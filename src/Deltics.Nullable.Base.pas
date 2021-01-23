
{$i deltics.nullable.inc}

  unit Deltics.Nullable.Base;


interface

  uses
    Deltics.Exceptions;


  type
    ENullValueException = class(EInvalidOperation);

  // In record and object types, string fields are auto-initialised where-as
  //  Booleans are not.  Because of this, the fHasValue flag is implemented
  //  using a string where:
  //
  //    '' (empty string) => FALSE (no value)
  //    'YES'             => TRUE  (there is a value)
  //
  // This ensures that a newly allocated object/record is 'initialised' with
  //  no value (i.e. IsNull = TRUE).

  {$ifdef Generics}
    Nullable<T> = record
    private
      fHasValue: String;
      fValue: T;
      function get_IsNull: Boolean;
      procedure set_IsNull(const aValue: Boolean);
      function get_Value: T;
      procedure set_Value(const aValue: T);
    public
      procedure Clear;
      property IsNull: Boolean read get_IsNull write set_IsNull;
      property Value: T read get_Value write set_Value;
    end;
  {$else}
    Nullable = object
    private
      fHasValue: String;
      function get_IsNull: Boolean;
    protected
      procedure GetValue(var aValue);
      procedure SetValue(const aValue);
    public
      procedure Clear;
      property IsNull: Boolean read get_IsNull;
    end;
  {$endif}



implementation




{$ifdef Generics}

{ Nullable<T> ------------------------------------------------------------------------------------ }

  procedure Nullable<T>.Clear;
  begin
    fHasValue := '';
  end;


  function Nullable<T>.get_IsNull: Boolean;
  begin
    result := (fHasValue = '');
  end;


  function Nullable<T>.get_Value: T;
  begin
    if IsNull then
      raise ENullValueException.Create('Value is null');

    result := fValue;
  end;


  procedure Nullable<T>.set_IsNull(const aValue: Boolean);
  begin
    if NOT aValue then
      raise EInvalidOperation.Create('IsNull can only be used to make the value null (IsNull := TRUE).  '
                                   + 'To set a concrete value on a nullable, use the Value property.');

    fHasValue := '';
  end;


  procedure Nullable<T>.set_Value(const aValue: T);
  begin
    fValue    := aValue;
    fHasValue := 'YES';
  end;

{$else}

{ Nullable --------------------------------------------------------------------------------------- }

  procedure Nullable.Clear;
  begin
    fHasValue := '';
  end;


  procedure Nullable.GetValue(var aValue);
  begin
    if IsNull then
      raise ENullValueException.Create('Value is null');
  end;


  function Nullable.get_IsNull: Boolean;
  begin
    result := (fHasValue = '');
  end;


  procedure Nullable.SetValue(const aValue);
  begin
    fHasValue := 'YES';
  end;

{$endif}



end.
