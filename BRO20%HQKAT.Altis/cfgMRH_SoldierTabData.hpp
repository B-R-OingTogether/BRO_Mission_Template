//Template
/*
class MRH_SoldierTabData //mandatory, do not change
{
	//you can have as many entries as you want
	
	class MyFirstData //must be unique, can be anything
	{
	title = "YourTitleHere"; // simple text
	text = "YourTextHere";// accepts structured text, DO NOT use double quotes("") inside.

	};
	
	class MySecondData //must be unique,can be anything
	{
	title = "YourTitleHere";
	text = "YourTextHere";// accepts structured text, DO NOT use double quotes("") inside.
		
		//you can have as many sub entries as you want
		
		class MyFirstSubEntry //must be unique,can be anything
		{
		titleSub = "YourTitleHere";
		textSub = "YourTextHere";// accepts structured text, DO NOT use double quotes("") inside.
		};
		
		class MySecondSubEntry
		{
		titleSub = "YourTitleHere";
		textSub = "YourTextHere You can use <br/> and also include pictures  <img size = '15' image ='pathToYourPicture.jpg'/>"; //after thorough testing 15 seems to be the most appropriate size for pictures. Smaller is OK, bigger might not be fully displayed.
		};
	};
};
*/

//https://community.bistudio.com/wiki/Structured_Text - This is the link to the ARMA 3 structured text website. 



//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Data Entries ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

class MRH_SoldierTabData
{
	class dataEntry1
	{
	title = Intel Title";
	text = "Intel Information.";
	};
	class dataEntry2
	{
	title = "Example: Enemy Movments";
	text = "An enemy armour column was spotted at 017462";
	};
};