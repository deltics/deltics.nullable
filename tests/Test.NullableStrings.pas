
{$i deltics.nullable.inc}

  unit Test.NullableStrings;


interface

  uses
    Deltics.Smoketest;


  type
    NullableStrings = class(TTest)
      procedure DeclaredButNotInitialisedAreNull;
      procedure DeclaredButNotInitialisedValueRaisesENullValueException;
      procedure WithAValueAreNotNull;
      procedure AreNullWhenCleared;
      procedure AreNotNullIfTheyHaveEnEmptyValue;
    end;



implementation

  uses
    Deltics.Nullable;


{ NullableStrings -------------------------------------------------------------------------------- }

  procedure NullableStrings.AreNotNullIfTheyHaveEnEmptyValue;
  var
    sut: NullableString;
  begin
    sut.Value := '';

    Test('IsNull').Assert(sut.IsNull).IsFalse;
    Test('Value').Assert(sut.Value).Equals('');
  end;


  procedure NullableStrings.AreNullWhenCleared;
  var
    sut: NullableString;
  begin
    sut.Value := 'Some string';

    Test('IsNull').Assert(sut.IsNull).IsFalse;
    Test('Value').Assert(sut.Value).Equals('Some string');

    sut.Clear;

    Test('IsNull').Assert(sut.IsNull);
  end;


  procedure NullableStrings.DeclaredButNotInitialisedAreNull;
  var
    sut: NullableString;
  begin
    Test('IsNull').Assert(sut.IsNull);
  end;


  procedure NullableStrings.DeclaredButNotInitialisedValueRaisesENullValueException;
  var
    sut: NullableString;
  begin
    Test.Raises(ENullValueException);

    if sut.Value <> '' then;
  end;


  procedure NullableStrings.WithAValueAreNotNull;
  var
    sut: NullableString;
  begin
    sut.Value := 'Some string';

    Test('IsNull').Assert(sut.IsNull).IsFalse;
    Test('Value').Assert(sut.Value).Equals('Some string');
  end;



end.
