
{$define CONSOLE}

program Test;

{$i deltics.inc}

uses
  Deltics.Smoketest,
  Deltics.Nullable in '..\src\Deltics.Nullable.pas',
  Deltics.Nullable.Boolean in '..\src\Deltics.Nullable.Boolean.pas',
  Deltics.Nullable.Datetime in '..\src\Deltics.Nullable.Datetime.pas',
  Deltics.Nullable.Integer in '..\src\Deltics.Nullable.Integer.pas',
  Deltics.Nullable.String_ in '..\src\Deltics.Nullable.String_.pas',
  Deltics.Nullable.Generic in '..\src\Deltics.Nullable.Generic.pas',
  Deltics.Nullable.Utils in '..\src\Deltics.Nullable.Utils.pas',
  Test.NullableBooleans in 'Test.NullableBooleans.pas',
  Test.NullableIntegers in 'Test.NullableIntegers.pas',
  Test.NullableDatetimes in 'Test.NullableDatetimes.pas',
  Test.NullableStrings in 'Test.NullableStrings.pas';

begin
  TestRun.Environment := DELPHI_VERSION_NAME;

  TestRun.Test(NullableBooleans);
  TestRun.Test(NullableIntegers);
  TestRun.Test(NullableDatetimes);
  TestRun.Test(NullableStrings);
end.

