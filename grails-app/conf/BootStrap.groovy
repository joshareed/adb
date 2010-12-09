import org.andrill.adb.*

class BootStrap {
	def springSecurityService

	def init = { servletContext ->
		// create our user and admin roles
		def userRole  = Role.findByAuthority('ROLE_USER')  ?: new Role(authority: 'ROLE_USER').save(failOnError: true, flush: true)
		def adminRole = Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save(failOnError: true, flush: true)

		// create our admin user if it does not already exist
		def adminUser = User.findByUsername('admin') ?: new User(
				username: 'admin',
				password: springSecurityService.encodePassword('changeme'),
				enabled: true,
				firstName: 'Admin',
				lastName: 'User',
				email: 'admin@andrill.org'
			).save(failOnError: true, flush: true)

		def testUser = User.findByUsername('test') ?: new User(
				username: 'test',
				password: springSecurityService.encodePassword('changeme'),
				enabled: true,
				firstName: 'Test',
				lastName: 'User',
				email: 'test@andrill.org'
			).save(failOnError: true, flush: true)

		if (!adminUser.authorities.contains(adminRole)) {
			UserRole.create adminUser, adminRole, true
		}
		if (!testUser.authorities.contains(userRole)) {
			UserRole.create testUser, userRole, true
		}
	}
	def destroy = {
	}
}
