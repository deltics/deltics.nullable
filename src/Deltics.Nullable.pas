
{$i deltics.nullable.inc}

  unit Deltics.Nullable;


interface

  uses
  {$ifdef Generics}
    Deltics.Nullable.Generic,
  {$else}
    Deltics.Nullable.Boolean,
    Deltics.Nullable.Datetime,
    Deltics.Nullable.Integer,
    Deltics.Nullable.String_,
  {$endif}
    Deltics.Nullable.Utils;


  type
  {$ifdef Generics}

    NullableBoolean   = Nullable<Boolean>;
    NullableDatetime  = Nullable<TDatetime>;
    NullableInteger   = Nullable<Integer>;
    NullableString    = Nullable<String>;

  {$else}

    NullableBoolean   = Deltics.Nullable.Boolean.NullableBoolean;
    NullableDateTime  = Deltics.Nullable.DateTime.NullableDateTime;
    NullableInteger   = Deltics.Nullable.Integer.NullableInteger;
    NullableString    = Deltics.Nullable.String_.NullableString;

  {$endif}

    ENullValueException = Deltics.Nullable.Utils.ENullValueException;



implementation





end.
