class Biome
  @@blurbs = {
    :grass => [
      "You are in a grassy field.\n",
      "You are walking through some long grass and bushes.\n"
    ],
    :forest => [
      "There are closely spaced trees here.\n",
      "You are in a vibrant green forest.\n"
    ]
  }

  @@tiles = {
    :grass => ".",
    :forest => "^"
  }

  @@monsters = {
    :grass => [
      Orc,
      Drow
    ],
    :forest => [
      Spider
    ]
  }

  def Biome.blurb(biome_type)
    @@blurbs[biome_type.to_sym].sample
  end

  def Biome.tile(biome_type)
    @@tiles[biome_type.to_sym]
  end

  def Biome.monster(biome_type)
    @@monsters[biome_type.to_sym].sample
  end
end