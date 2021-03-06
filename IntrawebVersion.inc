{.$DEFINE INTRAWEB51}
{.$DEFINE INTRAWEB60}
{.$DEFINE INTRAWEB70}
{.$DEFINE INTRAWEB72}
{.$DEFINE INTRAWEB80}
{.$DEFINE INTRAWEB90}
{.$DEFINE INTRAWEB100}
{.$DEFINE INTRAWEB110}
{.$DEFINE INTRAWEB120}
{$DEFINE INTRAWEB122}

// This define is needed if you are using the latest version of TMS's menu
// and have noticed a problem using Interop's AppDriver Mode.  If you are
// not using the latest TMS menus, you may comment out this directive.
{$DEFINE NEWTMSMENU}

{$IFDEF INTRAWEB122}
  {$DEFINE INTRAWEB120}
{$ENDIF}

{$IFDEF INTRAWEB120}
  {$DEFINE INTRAWEB110}
{$ENDIF}

{$IFDEF INTRAWEB110}
  {$DEFINE INTRAWEB100}
{$ENDIF}

{$IFDEF INTRAWEB100}
  {$DEFINE INTRAWEB90}
{$ENDIF}

{$IFDEF INTRAWEB90}
  {$DEFINE INTRAWEB80}
{$ENDIF}

{$IFDEF INTRAWEB90}
  {$DEFINE INTRAWEB80}
{$ENDIF}

{$IFDEF INTRAWEB80}
  {$DEFINE INTRAWEB72}
{$ENDIF}

{$IFDEF INTRAWEB72}
  {$DEFINE INTRAWEB70}
{$ENDIF}
