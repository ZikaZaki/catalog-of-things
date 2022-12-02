require './lib/classes/music_album'

describe MusicAlbum do
    it "music-album has a publish_date" do
        album = MusicAlbum.new(publish_date: '2022-12-02', on_spotify: true)
        expect(album.publish_date.strftime('%Y-%m-%d')).to eq('2022-12-02')
    end

    it "music-album is on_spotify" do
        album = MusicAlbum.new(publish_date: '2022-12-02', on_spotify: true)
        expect(album.on_spotify).to eq(true)
    end

    it "music-album can be archived" do
        album = MusicAlbum.new(publish_date: '2000-12-02', on_spotify: true)
        expect(album.can_be_archived?).to eq(true)
    end

    it "music-album can be archived" do
        album = MusicAlbum.new(publish_date: '2022-12-02', on_spotify: true)
        expect(album.can_be_archived?).to eq(false)
    end
end
