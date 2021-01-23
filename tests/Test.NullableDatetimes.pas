
{$i deltics.nullable.inc}

  unit Test.NullableDatetimes;


interface

  uses
    Deltics.Smoketest;


  type
    NullableDatetimes = class(TTest)
      procedure DeclaredButNotInitialisedAreNull;
      procedure DeclaredButNotInitialisedValueRaisesENullValueException;
      procedure WithAValueAreNotNull;
      procedure AreNullWhenCleared;
    end;



implementation

  uses
    SysUtils,
    Deltics.Nullable;


{ NullableDatetimes }

  procedure NullableDatetimes.AreNullWhenCleared;
  var
    sut: NullableDatetime;
  begin
    sut.Value := EncodeDate(2020,06,15);

    Test('IsNull').Assert(sut.IsNull).IsFalse;
    Test('Value').Assert(sut.Value).Equals(EncodeDate(2020,06,15));

    sut.Clear;

    Test('IsNull').Assert(sut.IsNull);
  end;


  procedure NullableDatetimes.DeclaredButNotInitialisedAreNull;
  var
    sut: NullableDatetime;
  begin
    Test('IsNull').Assert(sut.IsNull);
  end;


  procedure NullableDatetimes.DeclaredButNotInitialisedValueRaisesENullValueException;
  var
    sut: NullableDatetime;
  begin
    Test.Raises(ENullValueException);

    if sut.Value > 0 then;
  end;


  procedure NullableDatetimes.WithAValueAreNotNull;
  var
    sut: NullableDatetime;
  begin
    sut.Value := EncodeDate(2020,06,15);

    Test('IsNull').Assert(sut.IsNull).IsFalse;
    Test('Value').Assert(sut.Value).Equals(EncodeDate(2020,06,15));
  end;



end.
