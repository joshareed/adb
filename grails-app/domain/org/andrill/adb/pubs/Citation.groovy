package org.andrill.adb.pubs

import org.andrill.adb.*

class Citation {
	User owner

	// fields
	String authors
	String title
	String year
	String publication
	String volume
	String issue
	String pages
	String publisher
	String link

	static constraints = {
		authors		   blank: false
		title		   blank: false
		year		   blank: false
		publication	   blank: false
		volume		   required: false, blank: true
		issue		   required: false, blank: true
		pages		   required: false, blank: true
		publisher	   required: false, blank: true
		link		   required: false, blank: true
	}
}
