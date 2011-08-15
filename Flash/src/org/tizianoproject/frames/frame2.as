/**************************
 Initialize
 **************************/
var answerButtons:Array = new Array(guess0_btn, guess1_btn, guess2_btn, guess3_btn);

/*************
 Style answerButtons[]
 *************/
for(var i:Number = 0; i < answerButtons.length; i++){
	var tf:TextField = answerButtons[i].text_txt;
		tf.autoSize = "left";
		tf.color = 0xffffff;
		tf.fontWeight = "normal";
		tf.fontSize = 14;
		tf.fontFamily = "Verdana";
}

/**************************
 Answer Options
 **************************/
function buildAnswers():Void {
	for (var a:Number = 0; a < quiz[currentRound].options.length; a++)
	{
		//Non-Random: answerButtons[a].text_txt.text = quiz[currentRound].Options[a].toUpperCase();
		answerButtons[a].onRollOver = function() {
			this.gotoAndStop("over");
		};
		answerButtons[a].onRollOut = function() {
			this.gotoAndStop("up");
		};
		answerButtons[a].onRelease = answerButtons[a].onReleaseOutside = function () {
			this.gotoAndStop("highlight");
			validateRound(this.text_txt.text);
			
			pageView();
		};
	}
}
function populateAnswers():Void {
	//trace(quiz[currentRound].options);
	//trace( answerButtons.length );
//	trace( quiz[currentRound].options.length );
	for( var b:Number = 0; b < answerButtons.length; b++ ){
		answerButtons[b]._visible = false;
	}
	
	for (var a:Number = 0; a < quiz[currentRound].options.length; a++)
	{
		answerButtons[a].text_txt.text = quiz[currentRound].options[a];
		answerButtons[a]._visible = true;
	}
	buildAnswers();
}
/**************************
 Start The Game
 **************************/
function startGame() {
	pageView("Question_" + (currentRound + Number(1)).toString());
	//A. Update the Round
	rounds_txt.text = (currentRound + 1) <= quiz.length ? ((currentRound + 1)) : (currentRound + 1);
	rounds_txt.text += " of " + quiz.length;
	//B. Populate Question
	question_txt.text = quiz[currentRound].question;
	
	//D. Populate Question + Answers
	populateAnswers();

	startTimer();
}
/**************************
 onLoad
 **************************/
startGame();
stop();