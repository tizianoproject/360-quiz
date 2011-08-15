/*	CASA Lib for ActionScript 2.0	Copyright (c) 2008, Aaron Clinger & Contributors of CASA Lib	All rights reserved.		Redistribution and use in source and binary forms, with or without	modification, are permitted provided that the following conditions are met:		- Redistributions of source code must retain the above copyright notice,	  this list of conditions and the following disclaimer.		- Redistributions in binary form must reproduce the above copyright notice,	  this list of conditions and the following disclaimer in the documentation	  and/or other materials provided with the distribution.		- Neither the name of the CASA Lib nor the names of its contributors	  may be used to endorse or promote products derived from this software	  without specific prior written permission.		THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"	AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE	IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE	ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE	LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR	CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF	SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS	INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN	CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)	ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE	POSSIBILITY OF SUCH DAMAGE.*//**	Util functions for detecting SWF's file location.		@author Aaron Clinger	@version 02/13/07*/class org.casalib.util.LocationUtil {		/**		Determines if the SWF is being served on the internet.				@param location: MovieClip to get location of.		@return Returns <code>true</code> if SWF is being served on the internet; otherwise <code>false</code>.		@usage			<code>				trace(LocationUtil.isWeb(_root));			</code>	*/	public static function isWeb(location:MovieClip):Boolean {		return location._url.substr(0, 4) == 'http';	}		/**		Determines if the SWF is running in a browser plug-in.				@return Returns <code>true</code> if SWF is running in the Flash Player browser plug-in; otherwise <code>false</code>.	*/	public static function isPlugin():Boolean {		return System.capabilities.playerType == 'PlugIn' || System.capabilities.playerType == 'ActiveX';	}		/**		Determines if the SWF is running in the IDE.				@return Returns <code>true</code> if SWF is running in the Flash Player version used by the external player or test movie mode; otherwise <code>false</code>.	*/	public static function isIde():Boolean {		return System.capabilities.playerType == 'External';	}		/**		Determines if the SWF is running in the StandAlone player.				@return Returns <code>true</code> if SWF is running in the Flash StandAlone Player; otherwise <code>false</code>.	*/	public static function isStandAlone():Boolean {		return System.capabilities.playerType == 'StandAlone';	}		/**		Detects if MovieClip's embed location matches passed domain. 				@param location: MovieClip to compare location of.		@param domain: Web domain.		@return  Returns <code>true</code> if file's embed location matched passed domain; otherwise <code>false</code>.		@usage			To check for domain:			<code>				trace(LocationUtil.isDomain(_root, "google.com"));				trace(LocationUtil.isDomain(_root, "bbc.co.uk"));			</code>						You can even check for subdomains:			<code>				trace(LocationUtil.isDomain(_root, "subdomain.aaronclinger.com"))			</code>	*/	public static function isDomain(location:MovieClip, domain:String):Boolean {		return LocationUtil.getDomain(location).slice(-domain.length) == domain;	}		/**		Detects MovieClip's domain location.				@param location: MovieClip to get location of.		@return Returns full domain (including sub-domains) of MovieClip's location.		@usage			<code>				trace(LocationUtil.getDomain(_root));			</code>		@usageNote Function does not return folder path or file name. The method also treats "www" and sans "www" as the same; if "www" is present method does not return it.	*/	public static function getDomain(location:MovieClip):String {		var baseUrl:String = location._url.split('://')[1].split('/')[0];		return (baseUrl.substr(0, 4) == 'www.') ? baseUrl.substr(4) : baseUrl;	}		private function LocationUtil() {} // Prevents instance creation}