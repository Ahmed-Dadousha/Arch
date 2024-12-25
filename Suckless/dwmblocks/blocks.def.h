//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"", "echo 'Ahmed Mostafa Dadosha;'", 						0, 	 	0},
	{"󰕾 ", "amixer get Master | grep -o '[0-9]*%' | head -n 1", 			1, 	 	0},
	{" |  ", "sensors | awk '/Core 0/ {print $3}'",         			5, 		0},
	{" | 󰥔 ", "date '+%d-%m-%Y (%a) %I:%M:%S:%p   '",				1,		0}
};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = "";
static unsigned int delimLen = 5;
