require_relative '../music_album'

describe MusicAlbum do
  let(:music_album) { MusicAlbum.new(1,'2023-01-01', true) }

  describe 'when initialize' do
    it 'should be a MusicAlbum class' do
      expect(music_album).to be_a(MusicAlbum)
    end

    it 'should be a Item class' do
      expect(music_album).to be_a(Item)
    end

    it 'should have a id' do
      expect(music_album.id).to be_a(Integer)
    end

    it 'should have a publish_date' do
      expect(music_album.publish_date).to be_a(String)
    end

    it 'should have a on_spotify' do
      expect(music_album.on_spotify).to be_a(TrueClass)
    end
  end

  describe 'when call can_be_archived?' do
    
    it 'should return true' do
      music_album.move_to_archive
      expect(music_album.archived).to be(false)
    end

    it 'should return false' do
      music_album2 = MusicAlbum.new(1,'2000-01-01', true)
      music_album2.move_to_archive
      expect(music_album2.archived).to be(true)
    end
  end
end