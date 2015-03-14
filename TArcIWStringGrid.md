# TArcIWStringGrid Component Reference #

### Descends From ###

> [TArcIWCustomGrid](TArcIWCustomGrid.md)

> TIWControl

### Properties ###

> [AutoColumnWidth](http://code.google.com/p/iwelite/wiki/TArcIWCustomGrid.AutoColumnWidth)

> [AutoRowHeight](http://code.google.com/p/iwelite/wiki/TArcIWCustomGrid.AutoRowHeight)

> [StyleHeader](http://code.google.com/p/iwelite/wiki/TArcIWCustomGrid.StyleHeader)

> [StyleDetail](http://code.google.com/p/iwelite/wiki/TArcIWCustomGrid.StyleDetail)

> [StyleDetailAlt](http://code.google.com/p/iwelite/wiki/TArcIWCustomGrid.StyleDetailAlt)

> [StyleTable](http://code.google.com/p/iwelite/wiki/TArcIWCustomGrid.StyleTable)

> [UseAltStyles](http://code.google.com/p/iwelite/wiki/TArcIWCustomGrid.UseAltStyles)

> [RowCount](http://code.google.com/p/iwelite/wiki/TArcIWCustomGrid.RowCount)

> [ShowHeaderRow](http://code.google.com/p/iwelite/wiki/TArcIWCustomGrid.ShowHeaderRow)

> [StyleButtonBar](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.StyleButtonBar)

> [StyleControlBar](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.StyleControlBar)

> [StyleSelected](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.StyleSelected)

> [ScrollToSelectedCell](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.ScrollToSelectedCell)

> [ScrollToSelectedRow](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.ScrollToSelectedRow)

> [ShowButtonBar](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.ShowButtonBar)

> [ShowControlBar](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.ShowControlBar)

> [AllowEmptyCells](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.AllowEmptyCells)

> [Scrollbars](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.Scrollbars)

> [AutoHeight](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.AutoHeight)

> [Columns](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.Columns)

> [DetailVisible](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.DetailVisible)

> [RowHeight](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.RowHeight)

> [ColumnsWidthsType](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.ColumnsWidthsType)

> [SuppressSelRowClick](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.SuppressSelRowClick)

> [Content](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.Content)

> [Caption](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.Caption)

> [CaptionButtons](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.CaptionButtons)

> [ButtonBarHeight](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.ButtonBarHeight)

> [ControlBarAboveHeader](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.ControlBarAboveHeader)

> [RowHeaderHeight](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.RowHeaderHeight)

> [UseAsyncEvents](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.UseAsyncEvents)

> [Cells](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.Cells)

> [Objects](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.Objects)

> [Selected](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.Selected)

> [SelectedRow](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.SelectedRow)

> [SelectedCol](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.SelectedCol)

> [FirstSelectedRow](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.FirstSelectedRow)

### Methods ###

> procedure [LoadFromDelimitedFile](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.LoadFromDelimitedFile)(AFilename: string; ADelimiter: char = ','; AQuote: char = '"'; AAutoFields: boolean = true; AReadHeaders: boolean = true; AValuesAreLinks: boolean = false; SkipRows: integer = 0);

> procedure [LoadFromStringList](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.LoadFromStringList)(Strings: TStrings; {$IFNDEF VER130}ADelimiter: char = ','; AQuote: char = '"'; {$ENDIF}AAutoFields: boolean = true; AReadHeaders: boolean = true; AValuesAreLinks: boolean = false; SkipRows: integer = 0);

> procedure [LoadFromDataset](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.LoadFromDataset)(ADataset: TDataset);

> procedure [LoadFromDataset](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.LoadFromDataset)(ADataset: TDataset; const AFieldNames: array of string; AAutoFields: boolean = true; AStartRow: integer = 0; ACount: integer = -1);

> procedure [LoadFromDataset](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.LoadFromDataset)(ADataset: TDataset; const AFieldNames: TStringDynArray; AAutoFields: boolean = true; AStartRow: integer = 0; ACount: integer = -1);

> procedure [SelectAll](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.SelectAll);

> procedure [DeselectAll](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.DeselectAll);

> procedure [AddRow](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.AddRow);

> procedure [DeleteRow](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.DeleteRow)(idx: integer; FreeObjects: boolean = False);

> procedure [InsertRow](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.InsertRow)(idx: integer);

> function [FindValue](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.FindValue)(const Value: string; var Col, Row: integer): boolean;

> function [FindValueInCol](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.FindValueInCol)(const Value: string; Col: integer): integer;

> function [FindValueInRow](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.FindValueInRow)(const Value: string; Row: integer): integer;

> procedure [SelectRowWithValue](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.SelectRowWithValue)(const Value: string; Col: integer; DeselectOthers: boolean = True; SelectAll: boolean = False);

> procedure [DeselectRowWithValue](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.DeselectRowWithValue)(const Value: string; Col: integer; SelectOthers: boolean = False; DeselectAll: boolean = False);

> procedure [ExportGridStyle](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.ExportGridStyle)(const Filename: string);

> procedure [ImportGridStyle](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.ImportGridStyle)(const Filename: string);

> procedure [Focus](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.Focus)(Row: integer);]

### Events ###

> [OnCellHint](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.OnCellHint)

> [OnAsyncEnter](http://code.google.com/p/iwelite/wiki/TArcIWCustomGrid.OnAsyncEnter)

> [OnAsyncExit](http://code.google.com/p/iwelite/wiki/TArcIWCustomGrid.OnAsyncExit)

> [OnAsyncMouseDown](http://code.google.com/p/iwelite/wiki/TArcIWCustomGrid.OnAsyncMouseDown)

> [OnAsyncMouseMove](http://code.google.com/p/iwelite/wiki/TArcIWCustomGrid.OnAsyncMouseMove)

> [OnAsyncMouseOver](http://code.google.com/p/iwelite/wiki/TArcIWCustomGrid.OnAsyncMouseOver)

> [OnAsyncMouseOut](http://code.google.com/p/iwelite/wiki/TArcIWCustomGrid.OnAsyncMouseOut)

> [OnAsyncMouseUp](http://code.google.com/p/iwelite/wiki/TArcIWCustomGrid.OnAsyncMouseUp)

> [OnPopulateRow](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.OnPopulateRow)

> [OnCellData](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.OnCellData)

> [OnRowClick](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.OnRowClick)

> [OnCaptionButtonClick](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.OnCaptionButtonClick)

> [OnOverrideCellStyle](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.OnOverrideCellStyle)

> [OnOverrideCellShowIcon](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.OnOverrideCellShowIcon)

> [OnOverrideCellShowControl](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.OnOverrideCellShowControl)

> [OnRender](http://code.google.com/p/iwelite/wiki/TArcIWStringGrid.OnRender)