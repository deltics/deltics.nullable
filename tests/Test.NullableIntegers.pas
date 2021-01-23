
{$i deltics.nullable.inc}

  unit Test.NullableIntegers;


interface

  uses
    Deltics.Smoketest;


  type
    NullableIntegers = class(TTest)
      procedure DeclaredButNotInitialisedAreNull;
      procedure DeclaredButNotInitialisedValueRaisesENullValueException;
      procedure WithAValueAreNotNull;
      procedure AreNullWhenCleared;
    end;



implementation

  uses
    Deltics.Nullable;


{ NullableIntegers }

  procedure NullableIntegers.AreNullWhenCleared;
  var
    sut: NullableInteger;
  begin
    sut.Value := 42;

    Test('IsNull').Assert(sut.IsNull).IsFalse;
    Test('Value').Assert(sut.Value).Equals(42);

    sut.Clear;

    Test('IsNull').Assert(sut.IsNull);
  end;


  procedure NullableIntegers.DeclaredButNotInitialisedAreNull;
  var
    sut: NullableInteger;
  begin
    Test('IsNull').Assert(sut.IsNull);
  end;


  procedure NullableIntegers.DeclaredButNotInitialisedValueRaisesENullValueException;
  var
    sut: NullableInteger;
  begin
    Test.Raises(ENullValueException);

    if sut.Value > 0 then;
  end;


  procedure NullableIntegers.WithAValueAreNotNull;
  var
    sut: NullableInteger;
  begin
    sut.Value := 42;

    Test('IsNull').Assert(sut.IsNull).IsFalse;
    Test('Value').Assert(sut.Value).Equals(42);
  end;



end.
