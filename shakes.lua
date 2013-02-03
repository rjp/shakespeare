ShakespeareInsult = {}
ShakespeareInsult.__index = ShakespeareInsult

-- source columns from http://bit.ly/WJmpNU
ShakespeareInsult['s-adj1'] = "artless bawdy beslubbering bootless churlish cockered clouted craven currish dankish dissembling droning errant fawning fobbing froward frothy gleeking goatish gorbellied impertinent infectious jarring loggerheaded lumpish mammering mangled mewling paunchy pribbling puking puny qualling rank reeky roguish ruttish saucy spleeny spongy surly tottering unmuzzled vain venomed villainous warped wayward weedy yeasty cullionly fusty caluminous wimpled burly-boned misbegotten odiferous poisonous fishified Wart-necked weasel-girthed fox-eared"

ShakespeareInsult['s-adj2'] = "base-court bat-fowling beef-witted beetle-headed boil-brained clapper-clawed clay-brained common-kissing crook-pated dismal-dreaming dizzy-eyed doghearted dread-bolted earth-vexing elf-skinned fat-kidneyed fen-sucked flap-mouthed fly-bitten folly-fallen fool-born full-gorged guts-griping half-faced hasty-witted hedge-born hell-hated idle-headed ill-breeding ill-nurtured knotty-pated milk-livered motley-minded onion-eyed plume-plucked pottle-deep pox-marked reeling-ripe rough-hewn rude-growing rump-fed shard-borne sheep-biting spur-galled swag-bellied tardy-gaited tickle-brained toad-spotted unchin-snouted weather-bitten whoreson malmsey-nosed rampallian lily-livered scurvy-valiant brazen-faced unwash'd bunch-back'd leaden-footed muddy-mettled pigeon-liver'd scale-sided"

ShakespeareInsult['s-noun'] = "apple-john baggage barnacle bladder boar-pig bugbear bum-bailey canker-blossom clack-dish clotpole coxcomb codpiece death-token dewberry flap-dragon flax-wench flirt-gill foot-licker fustilarian giglet gudgeon haggard harpy hedge-pig horn-beast hugger-mugger joithead lewdster lout maggot-pie malt-worm mammet measle minnow miscreant moldwarp mumble-news nut-hook pigeon-egg pignut puttock pumpion ratsbane scut skainsmate strumpet varlot vassal whey-face wagtail knave blind-worm popinjay scullian jolt-head malcontent devil-monk toad rascal Basket-Cockle toad-scraper stoat-gatherer"

function ShakespeareInsult:split(string, inSplitPattern, outResults )
  if not outResults then
    outResults = { }
  end
  local theStart = 1
  local theSplitStart, theSplitEnd = string.find( string, inSplitPattern, theStart )
  while theSplitStart do
    table.insert( outResults, string.sub( string, theStart, theSplitStart-1 ) )
    theStart = theSplitEnd + 1
    theSplitStart, theSplitEnd = string.find( string, inSplitPattern, theStart )
  end
  table.insert( outResults, string.sub( string, theStart ) )
  return outResults
end

function ShakespeareInsult:init()
    self['generated'] = 1
    self['adj1'] = self:split(self['s-adj1'], " ")
    self['adj2'] = self:split(self['s-adj2'], " ")
    self['noun'] = self:split(self['s-noun'], " ")
end

function ShakespeareInsult:new()
    local si = {}
    setmetatable(si, ShakespeareInsult)
    --  si:init()
    return si
end

function ShakespeareInsult:generate()
    if not self['generated'] then
        self:init()
    end

    -- short names because I hate unnecessary typing
    local c1 = self['adj1']
    local c2 = self['adj2']
    local c3 = self['noun']

    -- bonus random() to try and mix things up a little
    local w0 = 1+(math.random(100*#c1) % #c1)
    local w1 = 1+(math.random(100*#c1) % #c1)
    local w2 = 1+(math.random(100*#c2) % #c2)
    local w3 = 1+(math.random(100*#c3) % #c3)

    local a = "Thou " .. c1[w1] .. " " .. c2[w2] .. " " .. c3[w3] .. "!"

    return a
end
