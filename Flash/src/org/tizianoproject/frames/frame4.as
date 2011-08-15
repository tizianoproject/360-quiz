score_txt.text = score;
total_txt.text = quiz.length;
pageView("Complete");

if (score >= 8) {
	copy_txt.text = "Excellent";
} else if (score >= 6) {
	copy_txt.text = "Great";
} else if (score >= 4) {
	copy_txt.text = "Fair";
} else if (score < 4) {
	copy_txt.text = "";
}
/**************************
 Big Button
 **************************/ 
big_btn.gotoAndStop("playAgain");
big_btn.onRelease = function() {
	home.gotoAndStop("start");
};
stop();