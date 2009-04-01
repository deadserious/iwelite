////////////////////////////////////////////////////////////////////////////////
// 
// The MIT License
// 
// Copyright (c) 2008 by Arcana Technologies Incorporated
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
// 
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  unit Pooling.pas                                                          //
//    Copyright 2003 by Arcana Technologies Incorporated                      //
//    Written By Jason Southwell                                              //
//                                                                            //
//  Description:                                                              //
//    This unit houses a class that implementats a generic pooling manager.   //
//                                                                            //
//  Updates:                                                                  //
//    04/03/2003 - TObjectPool Released to Open Source.                       //
//                                                                            //
//  License:                                                                  //
//    This code is covered by the Mozilla Public License 1.1 (MPL 1.1)        //
//    Full text of this license can be found at                               //
//    http://www.opensource.org/licenses/mozilla1.1.html                      //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

unit ArcIWIOPPooling;

interface

uses {$IFDEF VER130}Windows, {$ENDIF}Classes, SysUtils, SyncObjs;

type
  TObjectEvent = procedure(Sender : TObject; var AObject : TObject) of object;

  TObjectPool = class(TObject)
  private
    CS : TCriticalSection;
    ObjList : TList;
    ObjInUse : TBits;

    FActive : boolean;
    FAutoGrow: boolean;
    FGrowToSize: integer;
    FPoolSize: integer;
    FOnCreateObject: TObjectEvent;
    FOnDestroyObject: TObjectEvent;
    FUsageCount: integer;
    FRaiseExceptions: boolean;
  protected
  public
    constructor Create; virtual;
    destructor Destroy; override;

    procedure Start(RaiseExceptions : boolean = False); virtual;
    procedure Stop; virtual;

    function Acquire : TObject; virtual;
    procedure Release(item : TObject); virtual;

    property Active : boolean read FActive;
    property RaiseExceptions : boolean read FRaiseExceptions write FRaiseExceptions;
    property UsageCount : integer read FUsageCount;
    property PoolSize : integer read FPoolSize write FPoolSize;
    property AutoGrow : boolean read FAutoGrow write FAutoGrow;
    property GrowToSize : integer read FGrowToSize write FGrowToSize;
    property OnCreateObject : TObjectEvent read FOnCreateObject write FOnCreateObject;
    property OnDestroyObject : TObjectEvent read FOnDestroyObject write FOnDestroyObject;
  end;

implementation

{ TObjectPool }

function TObjectPool.Acquire: TObject;
var
  idx : integer;
begin
  Result := nil;
  if not FActive then
  begin
    if FRaiseExceptions then
      raise EAbort.Create('Cannot acquire an object before calling Start')
    else
      exit;
  end;
  CS.Enter;
  try
    Inc(FUsageCount);
    idx := ObjInUse.OpenBit;
    if idx < FPoolSize then // idx = FPoolSize when there are no openbits
    begin
      Result := Objlist[idx];
      ObjInUse[idx] := True;
    end else
    begin
      // Handle the case where the pool is completely acquired.
      if not AutoGrow or (FPoolSize > FGrowToSize) then
      begin
        if FRaiseExceptions then
          raise Exception.Create('There are no available objects in the pool')
        else
          Exit;
      end;
      inc(FPoolSize);
      ObjInUse.Size := FPoolSize;
      FOnCreateObject(Self, Result);
      ObjList.Add(Result);
      ObjInUse[FPoolSize-1] := True;
    end;
  finally
    CS.Leave;
  end;
end;

constructor TObjectPool.Create;
begin
  CS := TCriticalSection.Create;
  ObjList := TList.Create;
  ObjInUse := TBits.Create;

  FActive := False;
  FAutoGrow := False;
  FGrowToSize := 20;
  FPoolSize := 20;
  FRaiseExceptions := True;
  FOnCreateObject := nil;
  FOnDestroyObject := nil;
end;

destructor TObjectPool.Destroy;
begin
  if FActive then
    Stop;
  CS.Free;
  ObjList.Free;
  ObjInUse.Free;
  inherited;
end;

procedure TObjectPool.Release(item: TObject);
var
  idx : integer;
begin
  if not FActive then
  begin
    if FRaiseExceptions then
      raise Exception.Create('Cannot release an object before calling Start')
    else
      exit;
  end;
  if item = nil then
  begin
    if FRaiseExceptions then
      raise Exception.Create('Cannot release an object before calling Start')
    else
      exit;
  end;
  CS.Enter;
  try
    idx := ObjList.IndexOf(item);
    if idx < 0 then
    begin
      if FRaiseExceptions then
        raise Exception.Create('Cannot release an object that is not in the pool')
      else
        exit;
    end;
    ObjInUse[idx] := False;

    Dec(FUsageCount);
  finally
    CS.Leave;
  end;
end;

procedure TObjectPool.Start(RaiseExceptions : boolean = False);
var
  i : integer;
  o : TObject;
begin
  // Make sure events are assigned before starting the pool.
  if not Assigned(FOnCreateObject) then
    raise Exception.Create('There must be an OnCreateObject event before calling Start');
  if not Assigned(FOnDestroyObject) then
    raise Exception.Create('There must be an OnDestroyObject event before calling Start');

  // Set the TBits class to the same size as the pool.
  ObjInUse.Size := FPoolSize;

  // Call the OnCreateObject event once for each item in the pool.
  for i := 0 to FPoolSize-1 do
  begin
    o := nil;
    FOnCreateObject(Self,o);
    ObjList.Add(o);
    ObjInUse[i] := False;
  end;

  // Set the active flag to true so that the Acquire method will return values.
  FActive := True;

  // Automatically set RaiseExceptions to false by default.  This keeps
  // exceptions from being raised in threads.
  FRaiseExceptions := RaiseExceptions;
end;

procedure TObjectPool.Stop;
var
  i : integer;
  o : TObject;
begin
  // Wait until all objects have been released from the pool.  After waiting
  // 10 seconds, stop anyway.  This may cause unforseen problems, but usually
  // you only Stop a pool as the application is stopping.  40 x 250 = 10,000
  for i := 1 to 40 do
  begin
    CS.Enter;
    try
      // Setting Active to false here keeps the Acquire method from continuing to
      // retrieve objects.
      FActive := False;
      if FUsageCount = 0 then
        break;
    finally
     CS.Leave;
    end;
    // Sleep here to allow give threads time to release their objects.
    Sleep(250);
  end;

  CS.Enter;
  try
    // Loop through all items in the pool calling the OnDestroyObject event.
    for i := 0 to FPoolSize-1 do
    begin
      o := ObjList[i];
      if Assigned(FOnDestroyObject) then
        FOnDestroyObject(Self, o)
      else
        o.Free;
    end;

    // clear the memory used by the list object and TBits class.
    ObjList.Clear;
    ObjInUse.Size := 0;

    FRaiseExceptions := True;
  finally
    CS.Leave;
  end;
end;

end.
