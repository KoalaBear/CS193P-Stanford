//
//  MemoryGameTheme.swift
//  CS193P-Memorize-AS1
//
//  Created by TheKoalaBear on 18/06/2021.
//
import SwiftUI

struct MemoryGameTheme<CardContent,Color> {
    let name: String
    let contents: [CardContent]
    let pairsAmount: Int
    let foregroundColor: Color
    let backgroundColor: Color
}

