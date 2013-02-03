# Shakespeare Insult Generator

Lua version for my Wax-based iOS app.

## Usage

    require 'shakes'

    si = ShakespeareInsult:new()
    print(si:generate())

## Command-line quicky

    lua -lshakes -e 'math.randomseed(os.time());print(ShakespeareInsult:new():generate())'

## Example output

> Thou gorbellied hasty-witted knave!
>
> Thou pribbling muddy-mettled pumpion!
>
> Thou spleeny motley-minded minnow!
>
> Thou weedy boil-brained horn-beast!
>
> Thou poisonous rude-growing flirt-gill!
