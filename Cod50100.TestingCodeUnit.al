codeunit 50101 "Testing Code Unit"
{
    Subtype=Test;

    [Test]
    procedure "Customer_WithoutPostedEntries_ValidateCustomer"()
    var
    Cust: Record Customer;
    HasPostedEntries, CustomerIsBlocked: Boolean;
    // Call codeunit from main app
    TestAut: Codeunit "Test Automation";
    begin
        // [GIVEN] Customer 
        Cust.Get('10000');
        // [WHEN] When Some Action 
        HasPostedEntries:= TestAut.CustomerHasPostedEntries(Cust);
        CustomerIsBlocked:=Cust.Blocked<>Cust.Blocked::" ";
        // [THEN] Then Expected Output 
        Assert.AreEqual(HasPostedEntries, not CustomerIsBlocked, StrSubstNo('The Customer %1, should be blocked!', Cust."No."));
        // Assert gives a True or False
    end;

    var
    Assert: Codeunit "Library Assert";
}
