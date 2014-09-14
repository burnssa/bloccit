class CommentPolicy < ApplicationPolicy
	def create?
		true
	end

	def destroy?
		user.present? && can_moderate?(user, record)
	end
end