codeunit 50102 "UI Handlers Testing"
{
    Subtype=Test;

    [Test]
    [HandlerFunctions('TrueConfirmHandler')]
    
    procedure "Verify if_True"()
    var
    TheConfirmReply: Boolean;
    TheConfirmMsg: Label 'Are you selecting True or False';
    begin
        // [GIVEN] Verify if
        TheConfirmReply:=Confirm(TheConfirmMsg, false);
        // [WHEN] When Some Action
        Assert.IsTrue(TheConfirmReply, 'The reply is supposed to be True');
        // [THEN] Then Expected Output
    end;

    [ConfirmHandler]
    procedure TrueConfirmHandler(Question: Text[1024]; var Reply: Boolean)
    begin
        Reply := true;
    end;

    [ConfirmHandler]
    procedure FalseConfirmHandler(Question: Text[1024]; var Reply: Boolean)
    begin
        Reply := false;
    end;

    var
    Assert: Codeunit "Library Assert";
}
