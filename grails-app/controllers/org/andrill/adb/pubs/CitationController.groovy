package org.andrill.adb.pubs

import org.andrill.adb.*

import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

@Secured(['ROLE_USER', 'ROLE_ADMIN'])
class CitationController {
	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def springSecurityService

	def canEdit(Citation c) {
		def principal = springSecurityService.principal
		def isAdmin = SpringSecurityUtils.ifAllGranted('ROLE_ADMIN')
		def isOwner = (principal.id == c?.owner?.id)
		return isAdmin || isOwner
	}

	def index = {
		redirect(action: "list", params: params)
	}

	def list = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[citationInstanceList: Citation.list(params), citationInstanceTotal: Citation.count()]
	}

	def create = {
		def citationInstance = new Citation()
		citationInstance.properties = params
		return [citationInstance: citationInstance]
	}

	def save = {
		def citationInstance = new Citation(params)
		if (SpringSecurityUtils.ifNotGranted('ROLE_ADMIN')) {
			citationInstance.owner = User.get(springSecurityService.principal.id)
		}
		if (citationInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'citation.label', default: 'Citation'), citationInstance.id])}"
			redirect(action: "show", id: citationInstance.id)
		} else {
			render(view: "create", model: [citationInstance: citationInstance])
		}
	}

	def show = {
		def citationInstance = Citation.get(params.id)
		if (!citationInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'citation.label', default: 'Citation'), params.id])}"
			redirect(action: "list")
		} else {
			[citationInstance: citationInstance, canEdit: canEdit(citationInstance)]
		}
	}

	def edit = {
		def citationInstance = Citation.get(params.id)
		if (!citationInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'citation.label', default: 'Citation'), params.id])}"
			redirect(action: "list")
		} else if (!canEdit(citationInstance)) {
			flash.message = "You do not have sufficient permissions to edit this citation"
			redirect(action: "list")
		} else {
			return [citationInstance: citationInstance, canEdit: canEdit(citationInstance)]
		}
	}

	def update = {
		def citationInstance = Citation.get(params.id)
		if (citationInstance) {
			if (!canEdit(citationInstance)) {
				flash.message = "You do not have sufficient permissions to edit this citation"
				redirect(action: "list")
				return
			}
			if (params.version) {
				def version = params.version.toLong()
				if (citationInstance.version > version) {
					citationInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'citation.label', default: 'Citation')] as Object[], "Another user has updated this Citation while you were editing")
					render(view: "edit", model: [citationInstance: citationInstance])
					return
				}
			}
			citationInstance.properties = params
			if (!citationInstance.hasErrors() && citationInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'citation.label', default: 'Citation'), citationInstance.id])}"
				redirect(action: "show", id: citationInstance.id)
			} else {
				render(view: "edit", model: [citationInstance: citationInstance, canEdit: canEdit(citationInstance)])
			}
		} else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'citation.label', default: 'Citation'), params.id])}"
			redirect(action: "list")
		}
	}

	def delete = {
		def citationInstance = Citation.get(params.id)
		if (citationInstance) {
			if (!canEdit(citationInstance)) {
				flash.message = "You do not have sufficient permissions to delete this citation"
				redirect(action: "list")
				return
			}
			try {
				citationInstance.delete(flush: true)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'citation.label', default: 'Citation'), params.id])}"
				redirect(action: "list")
			} catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'citation.label', default: 'Citation'), params.id])}"
				redirect(action: "show", id: params.id)
			}
		} else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'citation.label', default: 'Citation'), params.id])}"
			redirect(action: "list")
		}
	}
}
