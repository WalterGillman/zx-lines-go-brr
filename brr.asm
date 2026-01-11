org 8200h
plot_x0_y0_y1_y1:
ld hl,4010h
ld c,80h
ld b,127
call vert_neg
ld b,27
call hori_poz

ld hl,4010h
ld b,127
call vert_poz
ld b,27
call hori_neg
ret

vert_poz:
ld a,$09
ld (__mod_0003+1),a
ld a,$2c
ld (__mod_0004),a
call vert
ret

vert_neg:
ld a,$01
ld (__mod_0003+1),a
ld a,$2d
ld (__mod_0004),a
call vert
ret

vert:
	ld de,07e0h
vert_loop:
	ld a,c
	xor (hl)
	ld (hl),a
;	ld (hl),c
	inc h
	ld a,h
	and $7
	jr z,vert_switch_lane
vert_next_point:
	ld a,b
	ld (__mod_0001+1),a
__mod_0001:
	ld a,(bitrev)
__mod_0002:
	cp $40
	jr c,vert_no_shift
__mod_0003:
	rlc c;rrc c
	jr nc,vert_no_shift
__mod_0004:
	dec l;inc l
vert_no_shift:
	dec b
	jr nz,vert_loop
ret
vert_switch_lane:
	sbc hl,de
	inc a
	and h
	jr nz,vert_switch_driveway
	jr vert_next_point
vert_switch_driveway:
	ld a,h
	add a,$7
	ld h,a
	jr vert_next_point

hori_poz:
ld a,$09
ld (__mod_0013+1),a
ld a,$2c
ld (__mod_0014),a
call hori
ret

hori_neg:
ld a,$01
ld (__mod_0013+1),a
ld a,$2d
ld (__mod_0014),a
call hori
ret

hori:
	ld de,07e0h
hori_loop:
	ld a,c
	xor (hl)
	ld (hl),a
	ld a,b
	ld (__mod_0011+1),a
__mod_0011:
	ld a,(bitrev)
__mod_0012:
	cp $40
	jr c,hori_next_point
hori_change:
	inc h
	ld a,h
	and $7
	jr z,hori_switch_lane
hori_next_point:
__mod_0013:
	rlc c;rrc c
	jr nc,hori_no_shift
__mod_0014:
	dec l;inc l
hori_no_shift:
	dec b
	jr nz,hori_loop
ret
hori_switch_lane:
	sbc hl,de
	inc a
	and h
	jr nz,hori_switch_driveway
	jr hori_next_point
hori_switch_driveway:
	ld a,h
	add a,$7
	ld h,a
	jr hori_next_point

org 8300h
tolog:
db $00, $01, $03, $04, $06, $07, $09, $0a, $0b, $0d, $0e, $10, $11, $12, $14, $15
db $16, $18, $19, $1a, $1c, $1d, $1e, $20, $21, $22, $24, $25, $26, $28, $29, $2a
db $2c, $2d, $2e, $2f, $31, $32, $33, $34, $36, $37, $38, $39, $3b, $3c, $3d, $3e
db $3f, $41, $42, $43, $44, $45, $47, $48, $49, $4a, $4b, $4d, $4e, $4f, $50, $51
db $52, $54, $55, $56, $57, $58, $59, $5a, $5c, $5d, $5e, $5f, $60, $61, $62, $63
db $64, $66, $67, $68, $69, $6a, $6b, $6c, $6d, $6e, $6f, $70, $71, $72, $74, $75
db $76, $77, $78, $79, $7a, $7b, $7c, $7d, $7e, $7f, $80, $81, $82, $83, $84, $85
db $86, $87, $88, $89, $8a, $8b, $8c, $8d, $8e, $8f, $90, $91, $92, $93, $94, $95
db $96, $97, $98, $99, $9a, $9b, $9b, $9c, $9d, $9e, $9f, $a0, $a1, $a2, $a3, $a4
db $a5, $a6, $a7, $a8, $a9, $a9, $aa, $ab, $ac, $ad, $ae, $af, $b0, $b1, $b2, $b2
db $b3, $b4, $b5, $b6, $b7, $b8, $b9, $b9, $ba, $bb, $bc, $bd, $be, $bf, $c0, $c0
db $c1, $c2, $c3, $c4, $c5, $c6, $c6, $c7, $c8, $c9, $ca, $cb, $cb, $cc, $cd, $ce
db $cf, $d0, $d0, $d1, $d2, $d3, $d4, $d4, $d5, $d6, $d7, $d8, $d8, $d9, $da, $db
db $dc, $dc, $dd, $de, $df, $e0, $e0, $e1, $e2, $e3, $e4, $e4, $e5, $e6, $e7, $e7
db $e8, $e9, $ea, $ea, $eb, $ec, $ed, $ee, $ee, $ef, $f0, $f1, $f1, $f2, $f3, $f4
db $f4, $f5, $f6, $f7, $f7, $f8, $f9, $f9, $fa, $fb, $fc, $fc, $fd, $fe, $ff, $ff
org 8400h
tofloat:
db $00, $00, $01, $02, $02, $03, $04, $04, $05, $06, $07, $07, $08, $09, $09, $0a
db $0b, $0c, $0c, $0d, $0e, $0e, $0f, $10, $11, $11, $12, $13, $14, $14, $15, $16
db $17, $17, $18, $19, $1a, $1a, $1b, $1c, $1d, $1e, $1e, $1f, $20, $21, $21, $22
db $23, $24, $25, $25, $26, $27, $28, $29, $29, $2a, $2b, $2c, $2d, $2d, $2e, $2f
db $30, $31, $32, $32, $33, $34, $35, $36, $37, $37, $38, $39, $3a, $3b, $3c, $3d
db $3d, $3e, $3f, $40, $41, $42, $43, $44, $44, $45, $46, $47, $48, $49, $4a, $4b
db $4b, $4c, $4d, $4e, $4f, $50, $51, $52, $53, $54, $55, $56, $56, $57, $58, $59
db $5a, $5b, $5c, $5d, $5e, $5f, $60, $61, $62, $63, $64, $65, $66, $67, $68, $69
db $6a, $6b, $6c, $6c, $6d, $6e, $6f, $70, $71, $72, $73, $74, $75, $77, $78, $79
db $7a, $7b, $7c, $7d, $7e, $7f, $80, $81, $82, $83, $84, $85, $86, $87, $88, $89
db $8a, $8b, $8c, $8e, $8f, $90, $91, $92, $93, $94, $95, $96, $97, $98, $9a, $9b
db $9c, $9d, $9e, $9f, $a0, $a1, $a3, $a4, $a5, $a6, $a7, $a8, $a9, $ab, $ac, $ad
db $ae, $af, $b0, $b2, $b3, $b4, $b5, $b6, $b7, $b9, $ba, $bb, $bc, $bd, $bf, $c0
db $c1, $c2, $c4, $c5, $c6, $c7, $c8, $ca, $cb, $cc, $cd, $cf, $d0, $d1, $d2, $d4
db $d5, $d6, $d8, $d9, $da, $db, $dd, $de, $df, $e1, $e2, $e3, $e5, $e6, $e7, $e8
db $ea, $eb, $ec, $ee, $ef, $f0, $f2, $f3, $f5, $f6, $f7, $f9, $fa, $fb, $fd, $fe

org 8500h
bitrev:
db  $00, $80, $40, $c0, $20, $a0, $60, $e0, $10, $90, $50, $d0, $30, $b0, $70, $f0
db  $08, $88, $48, $c8, $28, $a8, $68, $e8, $18, $98, $58, $d8, $38, $b8, $78, $f8
db  $04, $84, $44, $c4, $24, $a4, $64, $e4, $14, $94, $54, $d4, $34, $b4, $74, $f4
db  $0c, $8c, $4c, $cc, $2c, $ac, $6c, $ec, $1c, $9c, $5c, $dc, $3c, $bc, $7c, $fc
db  $02, $82, $42, $c2, $22, $a2, $62, $e2, $12, $92, $52, $d2, $32, $b2, $72, $f2
db  $0a, $8a, $4a, $ca, $2a, $aa, $6a, $ea, $1a, $9a, $5a, $da, $3a, $ba, $7a, $fa
db  $06, $86, $46, $c6, $26, $a6, $66, $e6, $16, $96, $56, $d6, $36, $b6, $76, $f6
db  $0e, $8e, $4e, $ce, $2e, $ae, $6e, $ee, $1e, $9e, $5e, $de, $3e, $be, $7e, $fe
db  $01, $81, $41, $c1, $21, $a1, $61, $e1, $11, $91, $51, $d1, $31, $b1, $71, $f1
db  $09, $89, $49, $c9, $29, $a9, $69, $e9, $19, $99, $59, $d9, $39, $b9, $79, $f9
db  $05, $85, $45, $c5, $25, $a5, $65, $e5, $15, $95, $55, $d5, $35, $b5, $75, $f5
db  $0d, $8d, $4d, $cd, $2d, $ad, $6d, $ed, $1d, $9d, $5d, $dd, $3d, $bd, $7d, $fd
db  $03, $83, $43, $c3, $23, $a3, $63, $e3, $13, $93, $53, $d3, $33, $b3, $73, $f3
db  $0b, $8b, $4b, $cb, $2b, $ab, $6b, $eb, $1b, $9b, $5b, $db, $3b, $bb, $7b, $fb
db  $07, $87, $47, $c7, $27, $a7, $67, $e7, $17, $97, $57, $d7, $37, $b7, $77, $f7
db  $0f, $8f, $4f, $cf, $2f, $af, $6f, $ef, $1f, $9f, $5f, $df, $3f, $bf, $7f, $ff
