#> sys:repeat/system_tag
#
# タグを使った処理他
#
# @within function sys:repeat/

# コマンド
    # サーバーにいるプレイヤー人数をカウント
        execute store result score $player iruru.player if entity @a
    # サーバーにいるプレイヤー人数が0のときに一時停止する
        execute if score $check iruru.check matches 1 if score $player iruru.player matches 0 run function cmd:game_pause
    # survivorタグを持つプレイヤー人数をカウント
        scoreboard players set $survivor iruru.survivor 0
        execute as @a[tag=Iruru.survivor] run scoreboard players add $survivor iruru.survivor 1
    # survivorが0人になったときゲームを終了する
        execute if score $check iruru.check matches 1 if score $survivor iruru.survivor matches 0 unless score $player iruru.player matches 0 run function cmd:game_end
