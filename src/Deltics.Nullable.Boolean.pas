
{$i deltics.nullable.inc}

  unit Deltics.Nullable.Boolean;


interface

{$ifNdef Generics}

  type
    NullableBoolean = object
    private
      fHasValue: String;
      fValue: Boolean;
      function get_IsNull: Boolean;
      function get_IsFalse: Boolean;
      function get_IsTrue: Boolean;
      function get_Value: Boolean;
      procedure set_IsNull(const aValue: Boolean);
      procedure set_Value(const aValue: Boolean);
    public
      procedure Clear;
      property IsFalse: Boolean read get_IsFalse;
      property IsTrue: Boolean read get_IsTrue;
      property IsNull: Boolean read get_IsNull write set_IsNull;
      property Value: Boolean read get_Value write set_Value;
    end;

{$endif}


implementation

{$ifNdef Generics}

  uses
    Deltics.Nullable.Utils;


{ NullableBoolean -------------------------------------------------------------------------------- }

  function NullableBoolean.get_IsFalse: Boolean;
  begin
    result := NOT IsNull and NOT fValue;
  end;


  function NullableBoolean.get_IsTrue: Boolean;
  begin
    result := NOT IsNull and fValue;
  end;


  function NullableBoolean.get_IsNull: Boolean;
  begin
    GetIsNull(fHasValue, result);
  end;


  function NullableBoolean.get_Value: Boolean;
  begin
    CheckHasValue(fHasValue);
    result := fValue;
  end;


  procedure NullableBoolean.set_IsNull(const aValue: Boolean);
  begin
    SetNullIfTrue(aValue, fHasValue);
  end;


  procedure NullableBoolean.set_Value(const aValue: Boolean);
  begin
    SetHasValue(fHasValue);
    fValue := aValue;
  end;

  
  procedure NullableBoolean.Clear;
  begin
    IsNull := TRUE;
  end;

{$endif}




end.
