//
// Created by Fabrizio Duroni on 04.03.18.
// Copyright (c) 2018 Fabrizio Duroni. All rights reserved.
//

import Foundation

class GenreFrameContentParsingOperation: FrameContentParsingOperation {
    private let stringContentParsingOperation: FrameStringContentParsingOperation
    private let genreStringAdapter: GenreStringAdapter

    init(stringContentParsingOperation: FrameStringContentParsingOperation, genreStringAdapter: GenreStringAdapter) {
        self.stringContentParsingOperation = stringContentParsingOperation
        self.genreStringAdapter = genreStringAdapter
    }

    func parse(frame: Data, id3Tag: ID3Tag) {
        stringContentParsingOperation.parse(frame: frame, id3Tag: id3Tag) { content in
            id3Tag.genre = genreStringAdapter.adapt(genre: content)
        }
    }
}