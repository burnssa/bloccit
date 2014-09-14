require "rails_helper"

RSpec.describe FavoriteMailer, :type => :mailer do
  describe "Mailer" do
    let(:mail) { FavoriteMailer.Mailer }

    it "renders the headers" do
      expect(mail.subject).to eq("Mailer")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["burnssa@gmail.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
