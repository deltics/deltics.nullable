
{$i deltics.nullable.inc}

  unit Deltics.Nullable.Utils;


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

    procedure CheckHasValue(const aHasValue: String);
    procedure GetIsNull(const aHasValue: String; var aIsNull: Boolean);
    procedure SetHasValue(var aHasValue: String);
    procedure SetNullIfTrue(const aIsNull: Boolean; var aHasValue: String);

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
    if self.IsNull then
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

  const
    HASVALUE_Null     = '';
    HASVALUE_NotNull  = 'YES';


  procedure CheckHasValue(const aHasValue: String);
  begin
    if aHasValue = HASVALUE_Null then
      raise ENullValueException.Create('Value is null');
  end;


  procedure GetIsNull(const aHasValue: String; var aIsNull: Boolean);
  begin
    aIsNull := aHasValue = HASVALUE_Null;
  end;


  procedure SetHasValue(var aHasValue: String);
  begin
    aHasValue := HASVALUE_NotNull;
  end;


  procedure SetNullIfTrue(const aIsNull: Boolean; var aHasValue: String);
  begin
    if NOT aIsNull then
      raise EInvalidOperation.Create('IsNull can only be used to make the value null (IsNull := TRUE).  '
                                   + 'To set a concrete value on a nullable, use the Value property.');

    aHasValue := HASVALUE_Null;
  end;

{$endif}



end.
