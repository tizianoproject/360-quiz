dynXML = "http://360.tizianoproject.org/xml/tizquiz.xml";

/*****************************
 Import Classes
/*****************************/
import org.tizianoproject.model.XMLLoader;
import org.tizianoproject.utils.CountDown;
/**************************
 Initialize
 **************************/
//This Scope is Especially helpful during xml.callXML()
var home:Object = this;

var xml:XMLLoader = new XMLLoader(dynXML);
	xml.addEventObserver( this, "complete", "onXMLLoaded" );

var timer:CountDown;
var currentRound:Number = 0;

//This array is the final, randomized Quiz w/ Rounds
var quiz:Array = new Array();

//User's Progress
var outOfTime:Boolean = false;
var correct:Boolean = false;
var score:Number = 0;

/**************************
 Earn 'da Bread
 **************************/
function pageView(page:String):Void {
}
/**************************
 Timer
 **************************/
function startTimer() {
	timer = new CountDown(timer_mc, 25000, "00:25");
	timer.start();
}

function endTime(mc:MovieClip) {
	trace( "End  Time" );
	//Sets the Result screen with the proper text
	outOfTime = true;
	home.gotoAndStop("result");
}

/**************************
 Validation
 **************************/
function validateRound(guess:String) {
	/*
	* I had to add letters to each of the answer options. 
	* So I've concatenated the letter to the answer option in 
	* populateAnswers(). And in this validator, I'm just stripping
	* out the letter.
	*/
	//Strip out the A., B., C., D. nonsenes
	//trace( (guess.substr(3) + " " + quiz[currentRound].key) );
	if (guess.substr(3) == quiz[currentRound].key) {
		home.correct = true;
		score++;
		//trace(score);
	} else {
		correct = false;
	}
	home.gotoAndStop("result");
}

/**************************
 Model Loaded Loaded
 **************************/
function onXMLLoaded( randomData:Array ):Void
{
	quiz = randomData;
}

/**************************
 Sound
 **************************/
function playSound(theSound:String) {
}

/**************************
 Big Button
 **************************/
big_btn.gotoAndStop("start");
big_btn.onRelease = function() {
	if ( quiz.length > 0 ) home.gotoAndStop(nextFrame());
};
stop();