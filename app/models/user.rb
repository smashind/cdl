class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :attempts, dependent: :destroy
  serialize :package

  after_create :send_welcome_email
  has_many :forum_topics, dependent: :destroy
  has_many :forum_posts, dependent: :destroy

  def self.packages
    { 
      Complete: "pcca", 
      HazmatComplete: "pchm", 
      DoubleTripleComplete: "pcdt", 
      TankComplete: "pctv", 
      PassengerComplete: "pcpp", 
      SchoolBusComplete: "pcsb",
      ClassAPractice: "itca",
      ClassBPractice: "itcb",
      HazmatPractice: "ithm",
      DoubleTriplePractice: "itdt",
      TankPractice: "ittv",
      PassengerPractice: "itpp",
      SchoolBusPractice: "itsb",
      ClassAStudy: "isca",
      ClassBStudy: "iscb",
      HazmatStudy: "ishm",
      DoubleTripleStudy: "isdt",
      TankStudy: "istv",
      PassengerStudy: "ispp",
      SchoolBusStudy: "issb",
      None: "none"
    }
  end

  def send_welcome_email
  	UserMailer.welcome(self).deliver_now
  end
end
