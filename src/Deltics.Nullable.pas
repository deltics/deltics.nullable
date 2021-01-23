
{$i deltics.nullable.inc}

  unit Deltics.Nullable;


interface

  uses
    Deltics.Nullable.Base
  {$ifdef Generics},
    Deltics.Nullable.Boolean,
    Deltics.Nullable.DateTime,
    Deltics.Nullable.Integer,
    Deltics.Nullable.String_
  {$endif};



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
    NullableString    = Deltics.Nullable.String.NullableString;
  {$endif}

    ENullValueException = Deltics.Nullable.Base.ENullValueException;



implementation





end.
