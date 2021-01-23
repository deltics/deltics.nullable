
{$i deltics.nullable.inc}

  unit Deltics.Nullable.Boolean;


interface

{$ifNdef Generics}

  uses
    Deltics.Nullable.Base;


  type
    NullableBoolean = object(Nullable)
    private
      fValue: Boolean;
      function get_IsFalse: Boolean;
      function get_IsTrue: Boolean;
      function get_Value: Boolean;
      procedure set_Value(const aValue: Boolean);
    protected
      procedure GetValue(var aValue);
      procedure SetValue(const aValue);
    public
      property IsFalse: Boolean read get_IsFalse;
      property IsTrue: Boolean read get_IsTrue;
      property Value: Boolean read get_Value write set_Value;
    end;

{$endif}


implementation

{$ifNdef Generics}

{ NullableBoolean -------------------------------------------------------------------------------- }

  procedure NullableBoolean.GetValue(var aValue);
  begin
    inherited;

    Boolean(aValue) := fValue;
  end;


  procedure NullableBoolean.SetValue(const aValue);
  begin
    inherited;

    fValue := Boolean(aValue);
  end;


  function NullableBoolean.get_IsFalse: Boolean;
  begin
    result := NOT IsNull and NOT fValue;
  end;


  function NullableBoolean.get_IsTrue: Boolean;
  begin
    result := NOT IsNull and fValue;
  end;


  function NullableBoolean.get_Value: Boolean;
  begin
    GetValue(result);
  end;


  procedure NullableBoolean.set_Value(const aValue: Boolean);
  begin
    SetValue(aValue);
  end;

{$endif}



end.
