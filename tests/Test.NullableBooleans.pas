
{$i deltics.inc}

  unit Test.NullableBooleans;


interface

  uses
    Deltics.Smoketest;


  type
    NullableBooleans = class(TTest)
      procedure DeclaredButNotInitialisedAreNull;
      procedure DeclaredButNotInitialisedValueRaisesENullValueException;
      procedure SetFalseAreNotNull;
      procedure SetTrueAreNotNull;
      procedure AreNullWhenCleared;
    end;



implementation

  uses
    Deltics.Nullable;


{ NullableBooleans }

  procedure NullableBooleans.DeclaredButNotInitialisedAreNull;
  var
    sut: NullableBoolean;
  begin
    Test('IsNull').Assert(sut.IsNull);
  end;


  procedure NullableBooleans.DeclaredButNotInitialisedValueRaisesENullValueException;
  var
    sut: NullableBoolean;
  begin
    Test.Raises(ENullValueException);

    if sut.Value then;
  end;


  procedure NullableBooleans.SetFalseAreNotNull;
  var
    sut: NullableBoolean;
  begin
    sut.Value := FALSE;

    Test('IsNull').Assert(sut.IsNull).IsFalse;
    Test('Value').Assert(sut.Value).IsFalse;
  end;


  procedure NullableBooleans.SetTrueAreNotNull;
  var
    sut: NullableBoolean;
  begin
    sut.Value := TRUE;

    Test('IsNull').Assert(sut.IsNull).IsFalse;
    Test('Value').Assert(sut.Value);
  end;


  procedure NullableBooleans.AreNullWhenCleared;
  var
    sut: NullableBoolean;
  begin
    sut.Value := TRUE;

    Test('IsNull').Assert(sut.IsNull).IsFalse;

    sut.Clear;

    Test('Value').Assert(sut.IsNull);
  end;





end.
