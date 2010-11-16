package org.andrill.adb

import org.apache.commons.lang.builder.HashCodeBuilder

class ProjectMembership implements Serializable {

	User user
	Project project

    boolean equals(other) {
		if (!(other instanceof ProjectMembership)) {
			return false
		}

		other.user?.id == user?.id &&
			other.project?.id == project?.id
	}

	int hashCode() {
		def builder = new HashCodeBuilder()
		if (user) builder.append(user.id)
		if (project) builder.append(project.id)
		builder.toHashCode()
	}

	static ProjectMembership get(long userId, long projectId) {
		find 'from ProjectMembership where user.id=:userId and project.id=:projectId',
			[userId: userId, projectId: projectId]
	}

	static ProjectMembership create(User user, Project project, boolean flush = false) {
		new ProjectMembership(user: user, project: project).save(flush: flush, insert: true)
	}

	static boolean remove(User user, Project project, boolean flush = false) {
		ProjectMembership instance = ProjectMembership.findByUserAndProject(user, project)
		instance ? instance.delete(flush: flush) : false
	}

	static void removeAll(User user) {
		executeUpdate 'DELETE FROM ProjectMembership WHERE user=:user', [user: user]
	}

	static void removeAll(Project project) {
		executeUpdate 'DELETE FROM ProjectMembership WHERE project=:project', [project: project]
	}

	static mapping = {
		id composite: ['project', 'user']
		version false
	}
}
