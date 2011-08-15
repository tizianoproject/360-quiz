/**************************
Init
 **************************/
if (correct) {
	writeCorrect( "Correct" );
} else if(outOfTime){
	writeCorrect( "Time's Up!" );
	outOfTime = false;
} else {
	writeCorrect( "Oops!" );
}

writeCopy( quiz[currentRound].info );

//writeAnswer( quiz[currentRound].key );

if( currentRound == (quiz.length - 1) ) big_btn.gotoAndStop("finalScore");
else big_btn.gotoAndStop("next");

/**************************
 Load Answer Copy and Image
 **************************/
function writeCorrect( value:String ):Void
{
	correct_txt.text = value;
}

function writeCopy( value:String ):Void
{
	copy_txt.text = value;	
}

function writeAnswer( value:String ):Void
{
	answer_txt.text = value;	
}

/**************************
 Big Button
 **************************/
big_btn.onRelease = function(){
	if( home.currentRound++ >= (quiz.length - 1) ) home.gotoAndStop("final");
	else home.gotoAndStop("question");	
}
stop();