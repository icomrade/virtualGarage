# Virtual Garage
Virtual Garage script rewritten by salival (https://github.com/oiad)

* Discussion URL: 
	
* Tested as working on a blank Epoch 1.0.6.1
* This adds support for briefcases, gems and coins.
* Supports dynamic pricing and vehicle limits
* More secure than the original scripts

# REPORTING ERRORS/PROBLEMS

1. Please, if you report issues can you please attach (on pastebin or similar) your CLIENT rpt log file as this helps find out the errors very quickly. To find this logfile:

	```sqf
	C:\users\<YOUR WINDOWS USERNAME>\AppData\Local\Arma 2 OA\ArmA2OA.RPT
	```
	
# Index:

* [Mission folder install](https://github.com/oiad/virtualGarage#mission-folder-install)
* [dayz_server folder install](https://github.com/oiad/virtualGarage#dayz_server-folder-install)
* [extDB install](https://github.com/oiad/virtualGarage#extDB-install)
* [mysql database setup fresh install](https://github.com/oiad/virtualGarage#mysql-database-setup-fresh-install)
* [mysql database update from previous virtual garage](https://github.com/oiad/virtualGarage#extDB-install)
* [mysql database update from previous virtual garage](https://github.com/oiad/virtualGarage#extDB-install)
* [Battleye filter install](https://github.com/oiad/virtualGarage#battleye-filter-install)

# Install:

* This install basically assumes you have NO custom variables.sqf or compiles.sqf or fn_selfActions.sqf, I would recommend diffmerging where possible.

**[>> Download <<](https://github.com/oiad/virtualGarage/archive/master.zip)**

# Mission folder install:

1. Copy the <code>dayz_code</code> and <code>scripts</code> folder to your mission folder preserving the directory structure.

2. In mission\init.sqf find: <code>call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\variables.sqf";</code> and add directly below:

	```sqf
	call compile preprocessFileLineNumbers "dayz_code\init\variables.sqf";
	```
	
3. In mission\init.sqf find: <code>call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\compiles.sqf";</code> and add directly below:

	```sqf
	call compile preprocessFileLineNumbers "dayz_code\init\compiles.sqf";
	```

4. Replace your original <code>description.ext</code> with the one provided or merge the contents if you have modified your own version.

5. Replace your modified <code>dayz_code\compiles\fn_selfActions.sqf</code> with the one provided or merge the contents if you have modified your own version.

6. If you run ESSv3 spawn script (by @ebayShopper) copy the supplied <code>stringTable - ESS.xml</code> to your mission file directory and rename it to <code>stringTable.xml</code>

7. If you are not running ESSv3 spawn script copy the supplied <code>stringTable.xml</code> to your mission file directory

# dayz_server folder install:

1. Replace or merge the contents of <code>init\server_functions.sqf</code> provided with your original copy.

2. Copy the <code>dayz_server\compile\garage</code> folder to your dayz_server directory

# extDB install:

1. Copy the @extDB folder to your main Arma 2 Operation Arrowhead folder (or where you host your server)

2. Edit @extDB\extdb-conf.ini to suit your database settings, mainly the database name, username and password.

3. Edit your server batch file or whatever loads your server to include <code>@extDB</code> in the -mod line, i.e for epoch:
	```sqf
	"-mod=@extDB;DayZ_Epoch;@DayZ_Epoch_Server"
	```
	for overwatch:
	```sqf
	"-mod=@extDB;@DayzOverwatch;@DayZ_Epoch;@DayZ_Epoch_Server"
	```

# mysql database setup fresh install:

1. If you are only allowed access to your main epoch database from your hosting provider, you can import the <code>virtualGarage.sql</code> file without editing it.

2. If you want to have an external virtual garage database you will need to edit <code>virtualGarage.sql</code> and uncomment the following lines:
	```sql
	-- CREATE DATABASE IF NOT EXISTS `extdb` /*!40100 DEFAULT CHARACTER SET latin1 */;
	-- USE `extdb`;
	```

	This will create a seperate database called extDB (useful if you have a couple of servers using the same virtual garage database)

3. You will need to edit your <code>@extDB\extdb-conf.ini</code> to suit your database settings!

# mysql database update from previous virtual garage:

1. Import the <code>virtualGarageUpdate.sql</code> file overtop of your garage database, this will update it to the latest version.

# Infistar setup:

1. Add 2800 to your _ALLOWED_Dialogs variable, i.e:
	```sqf
	_ALLOWED_Dialogs = _ALLOWED_Dialogs + [81000,88890,20001,20002,20003,20004,20005,20006,55510,55511,55514,55515,55516,55517,55518,55519,555120,118338,118339,571113,2800]; // adding some others from community addons
	```

# mysql install: