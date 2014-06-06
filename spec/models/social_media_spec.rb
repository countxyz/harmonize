require 'spec_helper'

describe SocialMedia do

  describe 'associations' do
    it { should belong_to(:sociable) }
  end

  describe 'field lengths' do
    it { should ensure_length_of(:google_plus).is_at_most(30) }
    it { should ensure_length_of(:github).is_at_most(30)      }
    it { should ensure_length_of(:twitter).is_at_most(30)     }
    it { should ensure_length_of(:skype).is_at_most(30)       }
    it { should ensure_length_of(:coderwall).is_at_most(30)   }
    it { should ensure_length_of(:linkedin).is_at_most(30)    }
    it { should ensure_length_of(:facebook).is_at_most(30)    }
  end
end
