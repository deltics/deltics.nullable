
{$i deltics.nullable.inc}

  unit Deltics.Nullable.Datetime;


interface

{$ifNdef Generics}

  type
    NullableDatetime = object
    private
      fHasValue: String;
      fValue: TDatetime;
      function get_IsNull: Boolean;
      function get_Value: TDatetime;
      procedure set_IsNull(const aValue: Boolean);
      procedure set_Value(const aValue: TDatetime);
    public
      procedure Clear;
      property IsNull: Boolean read get_IsNull write set_IsNull;
      property Value: TDatetime read get_Value write set_Value;
    end;

{$endif}



implementation

{$ifNdef Generics}

  uses
    Deltics.Nullable.Utils;


{ NullableDatetime -------------------------------------------------------------------------------- }

  function NullableDatetime.get_IsNull: Boolean;
  begin
    GetIsNull(fHasValue, result);
  end;


  function NullableDatetime.get_Value: TDatetime;
  begin
    CheckHasValue(fHasValue);
    result := fValue;
  end;


  procedure NullableDatetime.set_IsNull(const aValue: Boolean);
  begin
    SetNullIfTrue(aValue, fHasValue);
  end;


  procedure NullableDatetime.set_Value(const aValue: TDatetime);
  begin
    SetHasValue(fHasValue);
    fValue := aValue;
  end;

  procedure NullableDatetime.Clear;
  begin
    IsNull := TRUE;
  end;

{$endif}



end.

