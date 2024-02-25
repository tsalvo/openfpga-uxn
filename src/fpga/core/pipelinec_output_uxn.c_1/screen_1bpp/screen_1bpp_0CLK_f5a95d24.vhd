-- Timing params:
--   Fixed?: True
--   Pipeline Slices: []
--   Input regs?: False
--   Output regs?: False
library std;
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 54
entity screen_1bpp_0CLK_f5a95d24 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(11 downto 0);
 x1 : in unsigned(7 downto 0);
 y1 : in unsigned(7 downto 0);
 color : in unsigned(3 downto 0);
 fx : in unsigned(0 downto 0);
 fy : in unsigned(0 downto 0);
 ram_addr : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out screen_blit_result_t);
end screen_1bpp_0CLK_f5a95d24;
architecture arch of screen_1bpp_0CLK_f5a95d24 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal blending : uint2_t_48 := (
0 => to_unsigned(0, 2),
1 => to_unsigned(0, 2),
2 => to_unsigned(0, 2),
3 => to_unsigned(0, 2),
4 => to_unsigned(1, 2),
5 => to_unsigned(0, 2),
6 => to_unsigned(1, 2),
7 => to_unsigned(1, 2),
8 => to_unsigned(2, 2),
9 => to_unsigned(2, 2),
10 => to_unsigned(0, 2),
11 => to_unsigned(2, 2),
12 => to_unsigned(3, 2),
13 => to_unsigned(3, 2),
14 => to_unsigned(3, 2),
15 => to_unsigned(0, 2),
16 => to_unsigned(0, 2),
17 => to_unsigned(1, 2),
18 => to_unsigned(2, 2),
19 => to_unsigned(3, 2),
20 => to_unsigned(0, 2),
21 => to_unsigned(1, 2),
22 => to_unsigned(2, 2),
23 => to_unsigned(3, 2),
24 => to_unsigned(0, 2),
25 => to_unsigned(1, 2),
26 => to_unsigned(2, 2),
27 => to_unsigned(3, 2),
28 => to_unsigned(0, 2),
29 => to_unsigned(1, 2),
30 => to_unsigned(2, 2),
31 => to_unsigned(3, 2),
32 => to_unsigned(0, 2),
33 => to_unsigned(1, 2),
34 => to_unsigned(1, 2),
35 => to_unsigned(1, 2),
36 => to_unsigned(1, 2),
37 => to_unsigned(0, 2),
38 => to_unsigned(1, 2),
39 => to_unsigned(1, 2),
40 => to_unsigned(1, 2),
41 => to_unsigned(1, 2),
42 => to_unsigned(0, 2),
43 => to_unsigned(1, 2),
44 => to_unsigned(1, 2),
45 => to_unsigned(1, 2),
46 => to_unsigned(1, 2),
47 => to_unsigned(0, 2),
others => to_unsigned(0, 2))
;
signal x : unsigned(15 downto 0) := to_unsigned(0, 16);
signal y : unsigned(15 downto 0) := to_unsigned(0, 16);
signal xmod : unsigned(7 downto 0) := to_unsigned(0, 8);
signal opaque : unsigned(0 downto 0) := to_unsigned(0, 1);
signal c : unsigned(7 downto 0) := to_unsigned(0, 8);
signal color8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : screen_blit_result_t := screen_blit_result_t_NULL;
signal phase_minus_two : unsigned(7 downto 0) := to_unsigned(0, 8);
signal phase7_downto_3 : unsigned(4 downto 0) := to_unsigned(0, 5);
signal phase2_downto_0 : unsigned(2 downto 0) := to_unsigned(0, 3);
signal sprite_rows : uint8_t_8 := (others => to_unsigned(0, 8));
signal REG_COMB_blending : uint2_t_48;
signal REG_COMB_x : unsigned(15 downto 0);
signal REG_COMB_y : unsigned(15 downto 0);
signal REG_COMB_xmod : unsigned(7 downto 0);
signal REG_COMB_opaque : unsigned(0 downto 0);
signal REG_COMB_c : unsigned(7 downto 0);
signal REG_COMB_color8 : unsigned(7 downto 0);
signal REG_COMB_result : screen_blit_result_t;
signal REG_COMB_phase_minus_two : unsigned(7 downto 0);
signal REG_COMB_phase7_downto_3 : unsigned(4 downto 0);
signal REG_COMB_phase2_downto_0 : unsigned(2 downto 0);
signal REG_COMB_sprite_rows : uint8_t_8;

-- Each function instance gets signals
-- BIN_OP_MINUS[uxn_device_h_l124_c20_0e1e]
signal BIN_OP_MINUS_uxn_device_h_l124_c20_0e1e_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l124_c20_0e1e_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l124_c20_0e1e_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_device_h_l126_c6_5374]
signal BIN_OP_EQ_uxn_device_h_l126_c6_5374_left : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_device_h_l126_c6_5374_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l126_c6_5374_return_output : unsigned(0 downto 0);

-- sprite_rows_MUX[uxn_device_h_l126_c2_7e1a]
signal sprite_rows_MUX_uxn_device_h_l126_c2_7e1a_cond : unsigned(0 downto 0);
signal sprite_rows_MUX_uxn_device_h_l126_c2_7e1a_iftrue : uint8_t_8;
signal sprite_rows_MUX_uxn_device_h_l126_c2_7e1a_iffalse : uint8_t_8;
signal sprite_rows_MUX_uxn_device_h_l126_c2_7e1a_return_output : uint8_t_8;

-- VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8[uxn_device_h_l127_c3_09a1]
signal VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_09a1_elem_val : unsigned(7 downto 0);
signal VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_09a1_ref_toks_0 : uint8_t_8;
signal VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_09a1_var_dim_0 : unsigned(2 downto 0);
signal VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_09a1_return_output : uint8_t_array_8_t;

-- BIN_OP_EQ[uxn_device_h_l130_c6_46d9]
signal BIN_OP_EQ_uxn_device_h_l130_c6_46d9_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l130_c6_46d9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l130_c6_46d9_return_output : unsigned(0 downto 0);

-- xmod_MUX[uxn_device_h_l130_c2_4d2e]
signal xmod_MUX_uxn_device_h_l130_c2_4d2e_cond : unsigned(0 downto 0);
signal xmod_MUX_uxn_device_h_l130_c2_4d2e_iftrue : unsigned(7 downto 0);
signal xmod_MUX_uxn_device_h_l130_c2_4d2e_iffalse : unsigned(7 downto 0);
signal xmod_MUX_uxn_device_h_l130_c2_4d2e_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l130_c2_4d2e]
signal x_MUX_uxn_device_h_l130_c2_4d2e_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l130_c2_4d2e_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l130_c2_4d2e_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l130_c2_4d2e_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l130_c2_4d2e]
signal y_MUX_uxn_device_h_l130_c2_4d2e_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l130_c2_4d2e_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l130_c2_4d2e_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l130_c2_4d2e_return_output : unsigned(15 downto 0);

-- opaque_MUX[uxn_device_h_l130_c2_4d2e]
signal opaque_MUX_uxn_device_h_l130_c2_4d2e_cond : unsigned(0 downto 0);
signal opaque_MUX_uxn_device_h_l130_c2_4d2e_iftrue : unsigned(0 downto 0);
signal opaque_MUX_uxn_device_h_l130_c2_4d2e_iffalse : unsigned(0 downto 0);
signal opaque_MUX_uxn_device_h_l130_c2_4d2e_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l131_c21_2ee5]
signal BIN_OP_PLUS_uxn_device_h_l131_c21_2ee5_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l131_c21_2ee5_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l131_c21_2ee5_return_output : unsigned(8 downto 0);

-- VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d[uxn_device_h_l131_c12_b0bb]
signal VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l131_c12_b0bb_ref_toks_0 : uint2_t_48;
signal VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l131_c12_b0bb_var_dim_0 : unsigned(5 downto 0);
signal VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l131_c12_b0bb_return_output : unsigned(1 downto 0);

-- MUX[uxn_device_h_l132_c10_83c9]
signal MUX_uxn_device_h_l132_c10_83c9_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l132_c10_83c9_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l132_c10_83c9_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l132_c10_83c9_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l133_c7_6854]
signal BIN_OP_PLUS_uxn_device_h_l133_c7_6854_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l133_c7_6854_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l133_c7_6854_return_output : unsigned(8 downto 0);

-- MUX[uxn_device_h_l134_c13_8ab4]
signal MUX_uxn_device_h_l134_c13_8ab4_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l134_c13_8ab4_iftrue : unsigned(2 downto 0);
signal MUX_uxn_device_h_l134_c13_8ab4_iffalse : unsigned(2 downto 0);
signal MUX_uxn_device_h_l134_c13_8ab4_return_output : unsigned(2 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l134_c7_19fd]
signal BIN_OP_PLUS_uxn_device_h_l134_c7_19fd_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l134_c7_19fd_right : unsigned(2 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l134_c7_19fd_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_device_h_l137_c6_6e68]
signal BIN_OP_EQ_uxn_device_h_l137_c6_6e68_left : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_device_h_l137_c6_6e68_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l137_c6_6e68_return_output : unsigned(0 downto 0);

-- c_MUX[uxn_device_h_l137_c2_9c00]
signal c_MUX_uxn_device_h_l137_c2_9c00_cond : unsigned(0 downto 0);
signal c_MUX_uxn_device_h_l137_c2_9c00_iftrue : unsigned(7 downto 0);
signal c_MUX_uxn_device_h_l137_c2_9c00_iffalse : unsigned(7 downto 0);
signal c_MUX_uxn_device_h_l137_c2_9c00_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l137_c2_9c00]
signal x_MUX_uxn_device_h_l137_c2_9c00_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l137_c2_9c00_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l137_c2_9c00_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l137_c2_9c00_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l137_c2_9c00]
signal y_MUX_uxn_device_h_l137_c2_9c00_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l137_c2_9c00_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l137_c2_9c00_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l137_c2_9c00_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_device_h_l137_c2_9c00]
signal result_u8_value_MUX_uxn_device_h_l137_c2_9c00_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l137_c2_9c00_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l137_c2_9c00_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l137_c2_9c00_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l137_c2_9c00]
signal result_is_vram_write_MUX_uxn_device_h_l137_c2_9c00_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l137_c2_9c00_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l137_c2_9c00_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l137_c2_9c00_return_output : unsigned(0 downto 0);

-- result_u16_addr_MUX[uxn_device_h_l137_c2_9c00]
signal result_u16_addr_MUX_uxn_device_h_l137_c2_9c00_cond : unsigned(0 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l137_c2_9c00_iftrue : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l137_c2_9c00_iffalse : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l137_c2_9c00_return_output : unsigned(15 downto 0);

-- result_is_blit_done_MUX[uxn_device_h_l137_c2_9c00]
signal result_is_blit_done_MUX_uxn_device_h_l137_c2_9c00_cond : unsigned(0 downto 0);
signal result_is_blit_done_MUX_uxn_device_h_l137_c2_9c00_iftrue : unsigned(0 downto 0);
signal result_is_blit_done_MUX_uxn_device_h_l137_c2_9c00_iffalse : unsigned(0 downto 0);
signal result_is_blit_done_MUX_uxn_device_h_l137_c2_9c00_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l141_c21_3118]
signal BIN_OP_PLUS_uxn_device_h_l141_c21_3118_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l141_c21_3118_right : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l141_c21_3118_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_device_h_l143_c7_dcd6]
signal BIN_OP_EQ_uxn_device_h_l143_c7_dcd6_left : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l143_c7_dcd6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l143_c7_dcd6_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l143_c46_6334]
signal BIN_OP_MINUS_uxn_device_h_l143_c46_6334_left : unsigned(4 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l143_c46_6334_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l143_c46_6334_return_output : unsigned(4 downto 0);

-- VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d[uxn_device_h_l143_c34_3198]
signal VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l143_c34_3198_ref_toks_0 : uint8_t_8;
signal VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l143_c34_3198_var_dim_0 : unsigned(2 downto 0);
signal VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l143_c34_3198_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l143_c7_24b2]
signal MUX_uxn_device_h_l143_c7_24b2_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l143_c7_24b2_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l143_c7_24b2_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l143_c7_24b2_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l144_c7_891f]
signal BIN_OP_EQ_uxn_device_h_l144_c7_891f_left : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l144_c7_891f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l144_c7_891f_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l144_c35_dbbd]
signal BIN_OP_PLUS_uxn_device_h_l144_c35_dbbd_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l144_c35_dbbd_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l144_c35_dbbd_return_output : unsigned(8 downto 0);

-- MUX[uxn_device_h_l144_c7_cd9c]
signal MUX_uxn_device_h_l144_c7_cd9c_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l144_c7_cd9c_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l144_c7_cd9c_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l144_c7_cd9c_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_device_h_l145_c22_dcc1]
signal CONST_SL_8_uxn_device_h_l145_c22_dcc1_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_device_h_l145_c22_dcc1_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l145_c22_0842]
signal BIN_OP_PLUS_uxn_device_h_l145_c22_0842_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l145_c22_0842_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l145_c22_0842_return_output : unsigned(16 downto 0);

-- BIN_OP_OR[uxn_device_h_l146_c26_f4a2]
signal BIN_OP_OR_uxn_device_h_l146_c26_f4a2_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l146_c26_f4a2_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l146_c26_f4a2_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l147_c40_5ef1]
signal MUX_uxn_device_h_l147_c40_5ef1_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l147_c40_5ef1_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l147_c40_5ef1_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l147_c40_5ef1_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l147_c30_c2a0]
signal BIN_OP_PLUS_uxn_device_h_l147_c30_c2a0_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l147_c30_c2a0_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l147_c30_c2a0_return_output : unsigned(8 downto 0);

-- VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d[uxn_device_h_l147_c21_5712]
signal VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l147_c21_5712_ref_toks_0 : uint2_t_48;
signal VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l147_c21_5712_var_dim_0 : unsigned(5 downto 0);
signal VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l147_c21_5712_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_device_h_l148_c7_7ec6]
signal BIN_OP_EQ_uxn_device_h_l148_c7_7ec6_left : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l148_c7_7ec6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l148_c7_7ec6_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l148_c41_9e0e]
signal BIN_OP_MINUS_uxn_device_h_l148_c41_9e0e_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l148_c41_9e0e_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l148_c41_9e0e_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l148_c51_a739]
signal BIN_OP_PLUS_uxn_device_h_l148_c51_a739_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l148_c51_a739_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l148_c51_a739_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l148_c35_a45c]
signal MUX_uxn_device_h_l148_c35_a45c_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l148_c35_a45c_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l148_c35_a45c_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l148_c35_a45c_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l148_c7_b2b2]
signal MUX_uxn_device_h_l148_c7_b2b2_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l148_c7_b2b2_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l148_c7_b2b2_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l148_c7_b2b2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l149_c25_871c]
signal BIN_OP_EQ_uxn_device_h_l149_c25_871c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l149_c25_871c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l149_c25_871c_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l149_c25_b3a1]
signal MUX_uxn_device_h_l149_c25_b3a1_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l149_c25_b3a1_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l149_c25_b3a1_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l149_c25_b3a1_return_output : unsigned(0 downto 0);

-- CONST_SR_1[uxn_device_h_l150_c3_650f]
signal CONST_SR_1_uxn_device_h_l150_c3_650f_x : unsigned(7 downto 0);
signal CONST_SR_1_uxn_device_h_l150_c3_650f_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l151_c14_e7c9]
signal BIN_OP_PLUS_uxn_device_h_l151_c14_e7c9_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l151_c14_e7c9_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l151_c14_e7c9_return_output : unsigned(16 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l151_c24_7870]
signal BIN_OP_MINUS_uxn_device_h_l151_c24_7870_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l151_c24_7870_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l151_c24_7870_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l151_c8_9cc8]
signal MUX_uxn_device_h_l151_c8_9cc8_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l151_c8_9cc8_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l151_c8_9cc8_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l151_c8_9cc8_return_output : unsigned(15 downto 0);

function uint12_7_3( x : unsigned) return unsigned is
--variable x : unsigned(11 downto 0);
  variable return_output : unsigned(4 downto 0);
begin
return_output := unsigned(std_logic_vector(x(7 downto 3)));
return return_output;
end function;

function uint12_2_0( x : unsigned) return unsigned is
--variable x : unsigned(11 downto 0);
  variable return_output : unsigned(2 downto 0);
begin
return_output := unsigned(std_logic_vector(x(2 downto 0)));
return return_output;
end function;

function uint8_7_3( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(4 downto 0);
begin
return_output := unsigned(std_logic_vector(x(7 downto 3)));
return return_output;
end function;

function CONST_REF_RD_uint8_t_8_uint8_t_8_5ff5( ref_toks_0 : uint8_t_array_8_t) return uint8_t_8 is
 
  variable base : uint8_t_8; 
  variable return_output : uint8_t_8;
begin
      base(2) := ref_toks_0.data(2);
      base(5) := ref_toks_0.data(5);
      base(1) := ref_toks_0.data(1);
      base(4) := ref_toks_0.data(4);
      base(7) := ref_toks_0.data(7);
      base(3) := ref_toks_0.data(3);
      base(0) := ref_toks_0.data(0);
      base(6) := ref_toks_0.data(6);

      return_output := base;
      return return_output; 
end function;

function uint8_0_0( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(0- i);
      end loop;
return return_output;
end function;

function CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_97ac( ref_toks_0 : screen_blit_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned) return screen_blit_result_t is
 
  variable base : screen_blit_result_t; 
  variable return_output : screen_blit_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.u16_addr := ref_toks_3;
      base.is_blit_done := ref_toks_4;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_MINUS_uxn_device_h_l124_c20_0e1e
BIN_OP_MINUS_uxn_device_h_l124_c20_0e1e : entity work.BIN_OP_MINUS_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l124_c20_0e1e_left,
BIN_OP_MINUS_uxn_device_h_l124_c20_0e1e_right,
BIN_OP_MINUS_uxn_device_h_l124_c20_0e1e_return_output);

-- BIN_OP_EQ_uxn_device_h_l126_c6_5374
BIN_OP_EQ_uxn_device_h_l126_c6_5374 : entity work.BIN_OP_EQ_uint5_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l126_c6_5374_left,
BIN_OP_EQ_uxn_device_h_l126_c6_5374_right,
BIN_OP_EQ_uxn_device_h_l126_c6_5374_return_output);

-- sprite_rows_MUX_uxn_device_h_l126_c2_7e1a
sprite_rows_MUX_uxn_device_h_l126_c2_7e1a : entity work.MUX_uint1_t_uint8_t_8_uint8_t_8_0CLK_de264c78 port map (
sprite_rows_MUX_uxn_device_h_l126_c2_7e1a_cond,
sprite_rows_MUX_uxn_device_h_l126_c2_7e1a_iftrue,
sprite_rows_MUX_uxn_device_h_l126_c2_7e1a_iffalse,
sprite_rows_MUX_uxn_device_h_l126_c2_7e1a_return_output);

-- VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_09a1
VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_09a1 : entity work.VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_0CLK_83e31706 port map (
VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_09a1_elem_val,
VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_09a1_ref_toks_0,
VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_09a1_var_dim_0,
VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_09a1_return_output);

-- BIN_OP_EQ_uxn_device_h_l130_c6_46d9
BIN_OP_EQ_uxn_device_h_l130_c6_46d9 : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l130_c6_46d9_left,
BIN_OP_EQ_uxn_device_h_l130_c6_46d9_right,
BIN_OP_EQ_uxn_device_h_l130_c6_46d9_return_output);

-- xmod_MUX_uxn_device_h_l130_c2_4d2e
xmod_MUX_uxn_device_h_l130_c2_4d2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
xmod_MUX_uxn_device_h_l130_c2_4d2e_cond,
xmod_MUX_uxn_device_h_l130_c2_4d2e_iftrue,
xmod_MUX_uxn_device_h_l130_c2_4d2e_iffalse,
xmod_MUX_uxn_device_h_l130_c2_4d2e_return_output);

-- x_MUX_uxn_device_h_l130_c2_4d2e
x_MUX_uxn_device_h_l130_c2_4d2e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l130_c2_4d2e_cond,
x_MUX_uxn_device_h_l130_c2_4d2e_iftrue,
x_MUX_uxn_device_h_l130_c2_4d2e_iffalse,
x_MUX_uxn_device_h_l130_c2_4d2e_return_output);

-- y_MUX_uxn_device_h_l130_c2_4d2e
y_MUX_uxn_device_h_l130_c2_4d2e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l130_c2_4d2e_cond,
y_MUX_uxn_device_h_l130_c2_4d2e_iftrue,
y_MUX_uxn_device_h_l130_c2_4d2e_iffalse,
y_MUX_uxn_device_h_l130_c2_4d2e_return_output);

-- opaque_MUX_uxn_device_h_l130_c2_4d2e
opaque_MUX_uxn_device_h_l130_c2_4d2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
opaque_MUX_uxn_device_h_l130_c2_4d2e_cond,
opaque_MUX_uxn_device_h_l130_c2_4d2e_iftrue,
opaque_MUX_uxn_device_h_l130_c2_4d2e_iffalse,
opaque_MUX_uxn_device_h_l130_c2_4d2e_return_output);

-- BIN_OP_PLUS_uxn_device_h_l131_c21_2ee5
BIN_OP_PLUS_uxn_device_h_l131_c21_2ee5 : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l131_c21_2ee5_left,
BIN_OP_PLUS_uxn_device_h_l131_c21_2ee5_right,
BIN_OP_PLUS_uxn_device_h_l131_c21_2ee5_return_output);

-- VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l131_c12_b0bb
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l131_c12_b0bb : entity work.VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_0CLK_f9daebf3 port map (
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l131_c12_b0bb_ref_toks_0,
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l131_c12_b0bb_var_dim_0,
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l131_c12_b0bb_return_output);

-- MUX_uxn_device_h_l132_c10_83c9
MUX_uxn_device_h_l132_c10_83c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l132_c10_83c9_cond,
MUX_uxn_device_h_l132_c10_83c9_iftrue,
MUX_uxn_device_h_l132_c10_83c9_iffalse,
MUX_uxn_device_h_l132_c10_83c9_return_output);

-- BIN_OP_PLUS_uxn_device_h_l133_c7_6854
BIN_OP_PLUS_uxn_device_h_l133_c7_6854 : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l133_c7_6854_left,
BIN_OP_PLUS_uxn_device_h_l133_c7_6854_right,
BIN_OP_PLUS_uxn_device_h_l133_c7_6854_return_output);

-- MUX_uxn_device_h_l134_c13_8ab4
MUX_uxn_device_h_l134_c13_8ab4 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l134_c13_8ab4_cond,
MUX_uxn_device_h_l134_c13_8ab4_iftrue,
MUX_uxn_device_h_l134_c13_8ab4_iffalse,
MUX_uxn_device_h_l134_c13_8ab4_return_output);

-- BIN_OP_PLUS_uxn_device_h_l134_c7_19fd
BIN_OP_PLUS_uxn_device_h_l134_c7_19fd : entity work.BIN_OP_PLUS_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l134_c7_19fd_left,
BIN_OP_PLUS_uxn_device_h_l134_c7_19fd_right,
BIN_OP_PLUS_uxn_device_h_l134_c7_19fd_return_output);

-- BIN_OP_EQ_uxn_device_h_l137_c6_6e68
BIN_OP_EQ_uxn_device_h_l137_c6_6e68 : entity work.BIN_OP_EQ_uint5_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l137_c6_6e68_left,
BIN_OP_EQ_uxn_device_h_l137_c6_6e68_right,
BIN_OP_EQ_uxn_device_h_l137_c6_6e68_return_output);

-- c_MUX_uxn_device_h_l137_c2_9c00
c_MUX_uxn_device_h_l137_c2_9c00 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
c_MUX_uxn_device_h_l137_c2_9c00_cond,
c_MUX_uxn_device_h_l137_c2_9c00_iftrue,
c_MUX_uxn_device_h_l137_c2_9c00_iffalse,
c_MUX_uxn_device_h_l137_c2_9c00_return_output);

-- x_MUX_uxn_device_h_l137_c2_9c00
x_MUX_uxn_device_h_l137_c2_9c00 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l137_c2_9c00_cond,
x_MUX_uxn_device_h_l137_c2_9c00_iftrue,
x_MUX_uxn_device_h_l137_c2_9c00_iffalse,
x_MUX_uxn_device_h_l137_c2_9c00_return_output);

-- y_MUX_uxn_device_h_l137_c2_9c00
y_MUX_uxn_device_h_l137_c2_9c00 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l137_c2_9c00_cond,
y_MUX_uxn_device_h_l137_c2_9c00_iftrue,
y_MUX_uxn_device_h_l137_c2_9c00_iffalse,
y_MUX_uxn_device_h_l137_c2_9c00_return_output);

-- result_u8_value_MUX_uxn_device_h_l137_c2_9c00
result_u8_value_MUX_uxn_device_h_l137_c2_9c00 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l137_c2_9c00_cond,
result_u8_value_MUX_uxn_device_h_l137_c2_9c00_iftrue,
result_u8_value_MUX_uxn_device_h_l137_c2_9c00_iffalse,
result_u8_value_MUX_uxn_device_h_l137_c2_9c00_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l137_c2_9c00
result_is_vram_write_MUX_uxn_device_h_l137_c2_9c00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l137_c2_9c00_cond,
result_is_vram_write_MUX_uxn_device_h_l137_c2_9c00_iftrue,
result_is_vram_write_MUX_uxn_device_h_l137_c2_9c00_iffalse,
result_is_vram_write_MUX_uxn_device_h_l137_c2_9c00_return_output);

-- result_u16_addr_MUX_uxn_device_h_l137_c2_9c00
result_u16_addr_MUX_uxn_device_h_l137_c2_9c00 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_addr_MUX_uxn_device_h_l137_c2_9c00_cond,
result_u16_addr_MUX_uxn_device_h_l137_c2_9c00_iftrue,
result_u16_addr_MUX_uxn_device_h_l137_c2_9c00_iffalse,
result_u16_addr_MUX_uxn_device_h_l137_c2_9c00_return_output);

-- result_is_blit_done_MUX_uxn_device_h_l137_c2_9c00
result_is_blit_done_MUX_uxn_device_h_l137_c2_9c00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_blit_done_MUX_uxn_device_h_l137_c2_9c00_cond,
result_is_blit_done_MUX_uxn_device_h_l137_c2_9c00_iftrue,
result_is_blit_done_MUX_uxn_device_h_l137_c2_9c00_iffalse,
result_is_blit_done_MUX_uxn_device_h_l137_c2_9c00_return_output);

-- BIN_OP_PLUS_uxn_device_h_l141_c21_3118
BIN_OP_PLUS_uxn_device_h_l141_c21_3118 : entity work.BIN_OP_PLUS_uint16_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l141_c21_3118_left,
BIN_OP_PLUS_uxn_device_h_l141_c21_3118_right,
BIN_OP_PLUS_uxn_device_h_l141_c21_3118_return_output);

-- BIN_OP_EQ_uxn_device_h_l143_c7_dcd6
BIN_OP_EQ_uxn_device_h_l143_c7_dcd6 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l143_c7_dcd6_left,
BIN_OP_EQ_uxn_device_h_l143_c7_dcd6_right,
BIN_OP_EQ_uxn_device_h_l143_c7_dcd6_return_output);

-- BIN_OP_MINUS_uxn_device_h_l143_c46_6334
BIN_OP_MINUS_uxn_device_h_l143_c46_6334 : entity work.BIN_OP_MINUS_uint5_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l143_c46_6334_left,
BIN_OP_MINUS_uxn_device_h_l143_c46_6334_right,
BIN_OP_MINUS_uxn_device_h_l143_c46_6334_return_output);

-- VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l143_c34_3198
VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l143_c34_3198 : entity work.VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_0CLK_814e9c60 port map (
VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l143_c34_3198_ref_toks_0,
VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l143_c34_3198_var_dim_0,
VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l143_c34_3198_return_output);

-- MUX_uxn_device_h_l143_c7_24b2
MUX_uxn_device_h_l143_c7_24b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l143_c7_24b2_cond,
MUX_uxn_device_h_l143_c7_24b2_iftrue,
MUX_uxn_device_h_l143_c7_24b2_iffalse,
MUX_uxn_device_h_l143_c7_24b2_return_output);

-- BIN_OP_EQ_uxn_device_h_l144_c7_891f
BIN_OP_EQ_uxn_device_h_l144_c7_891f : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l144_c7_891f_left,
BIN_OP_EQ_uxn_device_h_l144_c7_891f_right,
BIN_OP_EQ_uxn_device_h_l144_c7_891f_return_output);

-- BIN_OP_PLUS_uxn_device_h_l144_c35_dbbd
BIN_OP_PLUS_uxn_device_h_l144_c35_dbbd : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l144_c35_dbbd_left,
BIN_OP_PLUS_uxn_device_h_l144_c35_dbbd_right,
BIN_OP_PLUS_uxn_device_h_l144_c35_dbbd_return_output);

-- MUX_uxn_device_h_l144_c7_cd9c
MUX_uxn_device_h_l144_c7_cd9c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l144_c7_cd9c_cond,
MUX_uxn_device_h_l144_c7_cd9c_iftrue,
MUX_uxn_device_h_l144_c7_cd9c_iffalse,
MUX_uxn_device_h_l144_c7_cd9c_return_output);

-- CONST_SL_8_uxn_device_h_l145_c22_dcc1
CONST_SL_8_uxn_device_h_l145_c22_dcc1 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_device_h_l145_c22_dcc1_x,
CONST_SL_8_uxn_device_h_l145_c22_dcc1_return_output);

-- BIN_OP_PLUS_uxn_device_h_l145_c22_0842
BIN_OP_PLUS_uxn_device_h_l145_c22_0842 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l145_c22_0842_left,
BIN_OP_PLUS_uxn_device_h_l145_c22_0842_right,
BIN_OP_PLUS_uxn_device_h_l145_c22_0842_return_output);

-- BIN_OP_OR_uxn_device_h_l146_c26_f4a2
BIN_OP_OR_uxn_device_h_l146_c26_f4a2 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l146_c26_f4a2_left,
BIN_OP_OR_uxn_device_h_l146_c26_f4a2_right,
BIN_OP_OR_uxn_device_h_l146_c26_f4a2_return_output);

-- MUX_uxn_device_h_l147_c40_5ef1
MUX_uxn_device_h_l147_c40_5ef1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l147_c40_5ef1_cond,
MUX_uxn_device_h_l147_c40_5ef1_iftrue,
MUX_uxn_device_h_l147_c40_5ef1_iffalse,
MUX_uxn_device_h_l147_c40_5ef1_return_output);

-- BIN_OP_PLUS_uxn_device_h_l147_c30_c2a0
BIN_OP_PLUS_uxn_device_h_l147_c30_c2a0 : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l147_c30_c2a0_left,
BIN_OP_PLUS_uxn_device_h_l147_c30_c2a0_right,
BIN_OP_PLUS_uxn_device_h_l147_c30_c2a0_return_output);

-- VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l147_c21_5712
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l147_c21_5712 : entity work.VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_0CLK_f9daebf3 port map (
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l147_c21_5712_ref_toks_0,
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l147_c21_5712_var_dim_0,
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l147_c21_5712_return_output);

-- BIN_OP_EQ_uxn_device_h_l148_c7_7ec6
BIN_OP_EQ_uxn_device_h_l148_c7_7ec6 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l148_c7_7ec6_left,
BIN_OP_EQ_uxn_device_h_l148_c7_7ec6_right,
BIN_OP_EQ_uxn_device_h_l148_c7_7ec6_return_output);

-- BIN_OP_MINUS_uxn_device_h_l148_c41_9e0e
BIN_OP_MINUS_uxn_device_h_l148_c41_9e0e : entity work.BIN_OP_MINUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l148_c41_9e0e_left,
BIN_OP_MINUS_uxn_device_h_l148_c41_9e0e_right,
BIN_OP_MINUS_uxn_device_h_l148_c41_9e0e_return_output);

-- BIN_OP_PLUS_uxn_device_h_l148_c51_a739
BIN_OP_PLUS_uxn_device_h_l148_c51_a739 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l148_c51_a739_left,
BIN_OP_PLUS_uxn_device_h_l148_c51_a739_right,
BIN_OP_PLUS_uxn_device_h_l148_c51_a739_return_output);

-- MUX_uxn_device_h_l148_c35_a45c
MUX_uxn_device_h_l148_c35_a45c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l148_c35_a45c_cond,
MUX_uxn_device_h_l148_c35_a45c_iftrue,
MUX_uxn_device_h_l148_c35_a45c_iffalse,
MUX_uxn_device_h_l148_c35_a45c_return_output);

-- MUX_uxn_device_h_l148_c7_b2b2
MUX_uxn_device_h_l148_c7_b2b2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l148_c7_b2b2_cond,
MUX_uxn_device_h_l148_c7_b2b2_iftrue,
MUX_uxn_device_h_l148_c7_b2b2_iffalse,
MUX_uxn_device_h_l148_c7_b2b2_return_output);

-- BIN_OP_EQ_uxn_device_h_l149_c25_871c
BIN_OP_EQ_uxn_device_h_l149_c25_871c : entity work.BIN_OP_EQ_uint12_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l149_c25_871c_left,
BIN_OP_EQ_uxn_device_h_l149_c25_871c_right,
BIN_OP_EQ_uxn_device_h_l149_c25_871c_return_output);

-- MUX_uxn_device_h_l149_c25_b3a1
MUX_uxn_device_h_l149_c25_b3a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l149_c25_b3a1_cond,
MUX_uxn_device_h_l149_c25_b3a1_iftrue,
MUX_uxn_device_h_l149_c25_b3a1_iffalse,
MUX_uxn_device_h_l149_c25_b3a1_return_output);

-- CONST_SR_1_uxn_device_h_l150_c3_650f
CONST_SR_1_uxn_device_h_l150_c3_650f : entity work.CONST_SR_1_uint8_t_0CLK_de264c78 port map (
CONST_SR_1_uxn_device_h_l150_c3_650f_x,
CONST_SR_1_uxn_device_h_l150_c3_650f_return_output);

-- BIN_OP_PLUS_uxn_device_h_l151_c14_e7c9
BIN_OP_PLUS_uxn_device_h_l151_c14_e7c9 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l151_c14_e7c9_left,
BIN_OP_PLUS_uxn_device_h_l151_c14_e7c9_right,
BIN_OP_PLUS_uxn_device_h_l151_c14_e7c9_return_output);

-- BIN_OP_MINUS_uxn_device_h_l151_c24_7870
BIN_OP_MINUS_uxn_device_h_l151_c24_7870 : entity work.BIN_OP_MINUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l151_c24_7870_left,
BIN_OP_MINUS_uxn_device_h_l151_c24_7870_right,
BIN_OP_MINUS_uxn_device_h_l151_c24_7870_return_output);

-- MUX_uxn_device_h_l151_c8_9cc8
MUX_uxn_device_h_l151_c8_9cc8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l151_c8_9cc8_cond,
MUX_uxn_device_h_l151_c8_9cc8_iftrue,
MUX_uxn_device_h_l151_c8_9cc8_iffalse,
MUX_uxn_device_h_l151_c8_9cc8_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 x1,
 y1,
 color,
 fx,
 fy,
 ram_addr,
 previous_ram_read,
 -- Registers
 blending,
 x,
 y,
 xmod,
 opaque,
 c,
 color8,
 result,
 phase_minus_two,
 phase7_downto_3,
 phase2_downto_0,
 sprite_rows,
 -- All submodule outputs
 BIN_OP_MINUS_uxn_device_h_l124_c20_0e1e_return_output,
 BIN_OP_EQ_uxn_device_h_l126_c6_5374_return_output,
 sprite_rows_MUX_uxn_device_h_l126_c2_7e1a_return_output,
 VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_09a1_return_output,
 BIN_OP_EQ_uxn_device_h_l130_c6_46d9_return_output,
 xmod_MUX_uxn_device_h_l130_c2_4d2e_return_output,
 x_MUX_uxn_device_h_l130_c2_4d2e_return_output,
 y_MUX_uxn_device_h_l130_c2_4d2e_return_output,
 opaque_MUX_uxn_device_h_l130_c2_4d2e_return_output,
 BIN_OP_PLUS_uxn_device_h_l131_c21_2ee5_return_output,
 VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l131_c12_b0bb_return_output,
 MUX_uxn_device_h_l132_c10_83c9_return_output,
 BIN_OP_PLUS_uxn_device_h_l133_c7_6854_return_output,
 MUX_uxn_device_h_l134_c13_8ab4_return_output,
 BIN_OP_PLUS_uxn_device_h_l134_c7_19fd_return_output,
 BIN_OP_EQ_uxn_device_h_l137_c6_6e68_return_output,
 c_MUX_uxn_device_h_l137_c2_9c00_return_output,
 x_MUX_uxn_device_h_l137_c2_9c00_return_output,
 y_MUX_uxn_device_h_l137_c2_9c00_return_output,
 result_u8_value_MUX_uxn_device_h_l137_c2_9c00_return_output,
 result_is_vram_write_MUX_uxn_device_h_l137_c2_9c00_return_output,
 result_u16_addr_MUX_uxn_device_h_l137_c2_9c00_return_output,
 result_is_blit_done_MUX_uxn_device_h_l137_c2_9c00_return_output,
 BIN_OP_PLUS_uxn_device_h_l141_c21_3118_return_output,
 BIN_OP_EQ_uxn_device_h_l143_c7_dcd6_return_output,
 BIN_OP_MINUS_uxn_device_h_l143_c46_6334_return_output,
 VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l143_c34_3198_return_output,
 MUX_uxn_device_h_l143_c7_24b2_return_output,
 BIN_OP_EQ_uxn_device_h_l144_c7_891f_return_output,
 BIN_OP_PLUS_uxn_device_h_l144_c35_dbbd_return_output,
 MUX_uxn_device_h_l144_c7_cd9c_return_output,
 CONST_SL_8_uxn_device_h_l145_c22_dcc1_return_output,
 BIN_OP_PLUS_uxn_device_h_l145_c22_0842_return_output,
 BIN_OP_OR_uxn_device_h_l146_c26_f4a2_return_output,
 MUX_uxn_device_h_l147_c40_5ef1_return_output,
 BIN_OP_PLUS_uxn_device_h_l147_c30_c2a0_return_output,
 VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l147_c21_5712_return_output,
 BIN_OP_EQ_uxn_device_h_l148_c7_7ec6_return_output,
 BIN_OP_MINUS_uxn_device_h_l148_c41_9e0e_return_output,
 BIN_OP_PLUS_uxn_device_h_l148_c51_a739_return_output,
 MUX_uxn_device_h_l148_c35_a45c_return_output,
 MUX_uxn_device_h_l148_c7_b2b2_return_output,
 BIN_OP_EQ_uxn_device_h_l149_c25_871c_return_output,
 MUX_uxn_device_h_l149_c25_b3a1_return_output,
 CONST_SR_1_uxn_device_h_l150_c3_650f_return_output,
 BIN_OP_PLUS_uxn_device_h_l151_c14_e7c9_return_output,
 BIN_OP_MINUS_uxn_device_h_l151_c24_7870_return_output,
 MUX_uxn_device_h_l151_c8_9cc8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : screen_blit_result_t;
 variable VAR_phase : unsigned(11 downto 0);
 variable VAR_x1 : unsigned(7 downto 0);
 variable VAR_y1 : unsigned(7 downto 0);
 variable VAR_color : unsigned(3 downto 0);
 variable VAR_fx : unsigned(0 downto 0);
 variable VAR_fy : unsigned(0 downto 0);
 variable VAR_ram_addr : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_color8_uxn_device_h_l121_c2_420e : unsigned(7 downto 0);
 variable VAR_uint12_7_3_uxn_device_h_l122_c20_8799_return_output : unsigned(4 downto 0);
 variable VAR_uint12_2_0_uxn_device_h_l123_c20_7595_return_output : unsigned(2 downto 0);
 variable VAR_phase_minus_two_uxn_device_h_l124_c2_fe68 : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l124_c20_0e1e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l124_c20_0e1e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l124_c20_0e1e_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l126_c6_5374_left : unsigned(4 downto 0);
 variable VAR_uint8_7_3_uxn_device_h_l126_c6_c6f6_return_output : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l126_c6_5374_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l126_c6_5374_return_output : unsigned(0 downto 0);
 variable VAR_sprite_rows_MUX_uxn_device_h_l126_c2_7e1a_iftrue : uint8_t_8;
 variable VAR_sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_8_uint8_t_8_5ff5_uxn_device_h_l126_c2_7e1a_return_output : uint8_t_8;
 variable VAR_sprite_rows_MUX_uxn_device_h_l126_c2_7e1a_iffalse : uint8_t_8;
 variable VAR_sprite_rows_MUX_uxn_device_h_l126_c2_7e1a_return_output : uint8_t_8;
 variable VAR_sprite_rows_MUX_uxn_device_h_l126_c2_7e1a_cond : unsigned(0 downto 0);
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_09a1_return_output : uint8_t_array_8_t;
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_09a1_elem_val : unsigned(7 downto 0);
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_09a1_ref_toks_0 : uint8_t_8;
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_09a1_var_dim_0 : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l130_c6_46d9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l130_c6_46d9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l130_c6_46d9_return_output : unsigned(0 downto 0);
 variable VAR_xmod_MUX_uxn_device_h_l130_c2_4d2e_iftrue : unsigned(7 downto 0);
 variable VAR_xmod_MUX_uxn_device_h_l130_c2_4d2e_iffalse : unsigned(7 downto 0);
 variable VAR_xmod_MUX_uxn_device_h_l130_c2_4d2e_return_output : unsigned(7 downto 0);
 variable VAR_xmod_MUX_uxn_device_h_l130_c2_4d2e_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l130_c2_4d2e_iftrue : unsigned(15 downto 0);
 variable VAR_x_uxn_device_h_l133_c3_abc1 : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l130_c2_4d2e_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l130_c2_4d2e_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l130_c2_4d2e_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l130_c2_4d2e_iftrue : unsigned(15 downto 0);
 variable VAR_y_uxn_device_h_l134_c3_d92d : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l130_c2_4d2e_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l130_c2_4d2e_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l130_c2_4d2e_cond : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l130_c2_4d2e_iftrue : unsigned(0 downto 0);
 variable VAR_opaque_uxn_device_h_l131_c3_524d : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l130_c2_4d2e_iffalse : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l130_c2_4d2e_return_output : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l130_c2_4d2e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l131_c21_2ee5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l131_c21_2ee5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l131_c21_2ee5_return_output : unsigned(8 downto 0);
 variable VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l131_c12_b0bb_var_dim_0 : unsigned(5 downto 0);
 variable VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l131_c12_b0bb_return_output : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l131_c12_b0bb_ref_toks_0 : uint2_t_48;
 variable VAR_MUX_uxn_device_h_l132_c10_83c9_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l132_c10_83c9_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l132_c10_83c9_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l132_c10_83c9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l133_c7_6854_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l133_c7_6854_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l133_c7_6854_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l134_c7_19fd_left : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l134_c13_8ab4_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l134_c13_8ab4_iftrue : unsigned(2 downto 0);
 variable VAR_MUX_uxn_device_h_l134_c13_8ab4_iffalse : unsigned(2 downto 0);
 variable VAR_MUX_uxn_device_h_l134_c13_8ab4_return_output : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l134_c7_19fd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l134_c7_19fd_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l137_c6_6e68_left : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l137_c6_6e68_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l137_c6_6e68_return_output : unsigned(0 downto 0);
 variable VAR_c_MUX_uxn_device_h_l137_c2_9c00_iftrue : unsigned(7 downto 0);
 variable VAR_c_MUX_uxn_device_h_l137_c2_9c00_iffalse : unsigned(7 downto 0);
 variable VAR_c_MUX_uxn_device_h_l137_c2_9c00_return_output : unsigned(7 downto 0);
 variable VAR_c_MUX_uxn_device_h_l137_c2_9c00_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l137_c2_9c00_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l137_c2_9c00_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l137_c2_9c00_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l137_c2_9c00_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l137_c2_9c00_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l137_c2_9c00_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l137_c2_9c00_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l137_c2_9c00_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l137_c2_9c00_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_device_h_l139_c3_7d3b : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l137_c2_9c00_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_device_h_l147_c3_6688 : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l137_c2_9c00_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l137_c2_9c00_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l137_c2_9c00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l137_c2_9c00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l137_c2_9c00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l137_c2_9c00_cond : unsigned(0 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l137_c2_9c00_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l141_c3_951f : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l137_c2_9c00_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l145_c3_212f : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l137_c2_9c00_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l137_c2_9c00_cond : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l137_c2_9c00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l137_c2_9c00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l137_c2_9c00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l137_c2_9c00_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l141_c21_3118_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l141_c21_3118_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l141_c21_3118_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l143_c7_24b2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l143_c7_dcd6_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l143_c7_dcd6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l143_c7_dcd6_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l143_c7_24b2_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l143_c7_24b2_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l143_c46_6334_left : unsigned(4 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l143_c46_6334_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l143_c46_6334_return_output : unsigned(4 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l143_c34_3198_var_dim_0 : unsigned(2 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l143_c34_3198_return_output : unsigned(7 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l143_c34_3198_ref_toks_0 : uint8_t_8;
 variable VAR_MUX_uxn_device_h_l143_c7_24b2_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l144_c7_cd9c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l144_c7_891f_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l144_c7_891f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l144_c7_891f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l144_c7_cd9c_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l144_c7_cd9c_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l144_c35_dbbd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l144_c35_dbbd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l144_c35_dbbd_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_device_h_l144_c7_cd9c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_device_h_l145_c22_dcc1_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l145_c22_0842_left : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_device_h_l145_c22_dcc1_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l145_c22_0842_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l145_c22_0842_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l146_c26_f4a2_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l146_c26_f4a2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l146_c26_f4a2_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l147_c30_c2a0_left : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l147_c40_5ef1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l147_c40_5ef1_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l147_c40_5ef1_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l147_c40_5ef1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l147_c30_c2a0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l147_c30_c2a0_return_output : unsigned(8 downto 0);
 variable VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l147_c21_5712_var_dim_0 : unsigned(5 downto 0);
 variable VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l147_c21_5712_return_output : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l147_c21_5712_ref_toks_0 : uint2_t_48;
 variable VAR_MUX_uxn_device_h_l148_c7_b2b2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l148_c7_7ec6_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l148_c7_7ec6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l148_c7_7ec6_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l148_c7_b2b2_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l148_c7_b2b2_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l148_c35_a45c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l148_c35_a45c_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l148_c35_a45c_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l148_c41_9e0e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l148_c41_9e0e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l148_c41_9e0e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l148_c51_a739_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l148_c51_a739_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l148_c51_a739_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l148_c35_a45c_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l148_c7_b2b2_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l149_c25_b3a1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l149_c25_871c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l149_c25_871c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l149_c25_871c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l149_c25_b3a1_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l149_c25_b3a1_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l149_c25_b3a1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_1_uxn_device_h_l150_c3_650f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_1_uxn_device_h_l150_c3_650f_x : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l151_c8_9cc8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l151_c8_9cc8_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l151_c8_9cc8_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l151_c14_e7c9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l151_c14_e7c9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l151_c14_e7c9_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l151_c24_7870_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l151_c24_7870_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l151_c24_7870_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l151_c8_9cc8_return_output : unsigned(15 downto 0);
 variable VAR_uint8_0_0_uxn_device_h_l146_l147_DUPLICATE_4870_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_97ac_uxn_device_h_l154_l103_DUPLICATE_81c6_return_output : screen_blit_result_t;
 -- State registers comb logic variables
variable REG_VAR_blending : uint2_t_48;
variable REG_VAR_x : unsigned(15 downto 0);
variable REG_VAR_y : unsigned(15 downto 0);
variable REG_VAR_xmod : unsigned(7 downto 0);
variable REG_VAR_opaque : unsigned(0 downto 0);
variable REG_VAR_c : unsigned(7 downto 0);
variable REG_VAR_color8 : unsigned(7 downto 0);
variable REG_VAR_result : screen_blit_result_t;
variable REG_VAR_phase_minus_two : unsigned(7 downto 0);
variable REG_VAR_phase7_downto_3 : unsigned(4 downto 0);
variable REG_VAR_phase2_downto_0 : unsigned(2 downto 0);
variable REG_VAR_sprite_rows : uint8_t_8;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_blending := blending;
  REG_VAR_x := x;
  REG_VAR_y := y;
  REG_VAR_xmod := xmod;
  REG_VAR_opaque := opaque;
  REG_VAR_c := c;
  REG_VAR_color8 := color8;
  REG_VAR_result := result;
  REG_VAR_phase_minus_two := phase_minus_two;
  REG_VAR_phase7_downto_3 := phase7_downto_3;
  REG_VAR_phase2_downto_0 := phase2_downto_0;
  REG_VAR_sprite_rows := sprite_rows;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_MINUS_uxn_device_h_l148_c41_9e0e_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l148_c51_a739_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l144_c7_891f_right := to_unsigned(0, 3);
     VAR_BIN_OP_EQ_uxn_device_h_l130_c6_46d9_right := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_device_h_l151_c24_7870_right := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l132_c10_83c9_iffalse := resize(to_unsigned(7, 3), 8);
     VAR_MUX_uxn_device_h_l147_c40_5ef1_iftrue := to_unsigned(16, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l149_c25_871c_right := to_unsigned(71, 8);
     VAR_result_is_blit_done_MUX_uxn_device_h_l137_c2_9c00_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l132_c10_83c9_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l143_c7_dcd6_right := to_unsigned(0, 3);
     VAR_MUX_uxn_device_h_l149_c25_b3a1_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l126_c6_5374_right := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_device_h_l124_c20_0e1e_right := to_unsigned(2, 2);
     VAR_MUX_uxn_device_h_l147_c40_5ef1_iffalse := to_unsigned(0, 8);
     VAR_BIN_OP_PLUS_uxn_device_h_l131_c21_2ee5_left := to_unsigned(32, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l137_c6_6e68_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l148_c7_7ec6_right := to_unsigned(7, 3);
     VAR_MUX_uxn_device_h_l134_c13_8ab4_iffalse := resize(to_unsigned(0, 1), 3);
     VAR_BIN_OP_PLUS_uxn_device_h_l151_c14_e7c9_right := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l137_c2_9c00_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l134_c13_8ab4_iftrue := to_unsigned(7, 3);
     VAR_BIN_OP_MINUS_uxn_device_h_l143_c46_6334_right := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l149_c25_b3a1_iftrue := to_unsigned(1, 1);
     VAR_result_u8_value_uxn_device_h_l139_c3_7d3b := resize(to_unsigned(0, 1), 8);
     VAR_result_u8_value_MUX_uxn_device_h_l137_c2_9c00_iftrue := VAR_result_u8_value_uxn_device_h_l139_c3_7d3b;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_x1 := x1;
     VAR_y1 := y1;
     VAR_color := color;
     VAR_fx := fx;
     VAR_fy := fy;
     VAR_ram_addr := ram_addr;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l131_c12_b0bb_ref_toks_0 := blending;
     VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l147_c21_5712_ref_toks_0 := blending;
     REG_VAR_blending := blending;
     VAR_MUX_uxn_device_h_l143_c7_24b2_iffalse := c;
     VAR_c_MUX_uxn_device_h_l137_c2_9c00_iftrue := c;
     VAR_color8_uxn_device_h_l121_c2_420e := resize(VAR_color, 8);
     VAR_MUX_uxn_device_h_l132_c10_83c9_cond := VAR_fx;
     VAR_MUX_uxn_device_h_l151_c8_9cc8_cond := VAR_fx;
     VAR_MUX_uxn_device_h_l134_c13_8ab4_cond := VAR_fy;
     VAR_MUX_uxn_device_h_l148_c35_a45c_cond := VAR_fy;
     VAR_opaque_MUX_uxn_device_h_l130_c2_4d2e_iffalse := opaque;
     VAR_BIN_OP_EQ_uxn_device_h_l130_c6_46d9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l149_c25_871c_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l124_c20_0e1e_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_device_h_l141_c21_3118_right := VAR_phase;
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_09a1_elem_val := VAR_previous_ram_read;
     VAR_BIN_OP_PLUS_uxn_device_h_l141_c21_3118_left := VAR_ram_addr;
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_09a1_ref_toks_0 := sprite_rows;
     VAR_sprite_rows_MUX_uxn_device_h_l126_c2_7e1a_iffalse := sprite_rows;
     VAR_x_MUX_uxn_device_h_l130_c2_4d2e_iffalse := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l133_c7_6854_left := VAR_x1;
     VAR_BIN_OP_PLUS_uxn_device_h_l144_c35_dbbd_left := VAR_x1;
     VAR_xmod_MUX_uxn_device_h_l130_c2_4d2e_iffalse := xmod;
     VAR_y_MUX_uxn_device_h_l130_c2_4d2e_iffalse := y;
     VAR_BIN_OP_PLUS_uxn_device_h_l134_c7_19fd_left := VAR_y1;
     VAR_BIN_OP_PLUS_uxn_device_h_l131_c21_2ee5_right := VAR_color8_uxn_device_h_l121_c2_420e;
     VAR_BIN_OP_PLUS_uxn_device_h_l147_c30_c2a0_left := VAR_color8_uxn_device_h_l121_c2_420e;
     REG_VAR_color8 := VAR_color8_uxn_device_h_l121_c2_420e;
     -- BIN_OP_EQ[uxn_device_h_l149_c25_871c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l149_c25_871c_left <= VAR_BIN_OP_EQ_uxn_device_h_l149_c25_871c_left;
     BIN_OP_EQ_uxn_device_h_l149_c25_871c_right <= VAR_BIN_OP_EQ_uxn_device_h_l149_c25_871c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l149_c25_871c_return_output := BIN_OP_EQ_uxn_device_h_l149_c25_871c_return_output;

     -- uint12_2_0[uxn_device_h_l123_c20_7595] LATENCY=0
     VAR_uint12_2_0_uxn_device_h_l123_c20_7595_return_output := uint12_2_0(
     VAR_phase);

     -- BIN_OP_EQ[uxn_device_h_l130_c6_46d9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l130_c6_46d9_left <= VAR_BIN_OP_EQ_uxn_device_h_l130_c6_46d9_left;
     BIN_OP_EQ_uxn_device_h_l130_c6_46d9_right <= VAR_BIN_OP_EQ_uxn_device_h_l130_c6_46d9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l130_c6_46d9_return_output := BIN_OP_EQ_uxn_device_h_l130_c6_46d9_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l141_c21_3118] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l141_c21_3118_left <= VAR_BIN_OP_PLUS_uxn_device_h_l141_c21_3118_left;
     BIN_OP_PLUS_uxn_device_h_l141_c21_3118_right <= VAR_BIN_OP_PLUS_uxn_device_h_l141_c21_3118_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l141_c21_3118_return_output := BIN_OP_PLUS_uxn_device_h_l141_c21_3118_return_output;

     -- MUX[uxn_device_h_l134_c13_8ab4] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l134_c13_8ab4_cond <= VAR_MUX_uxn_device_h_l134_c13_8ab4_cond;
     MUX_uxn_device_h_l134_c13_8ab4_iftrue <= VAR_MUX_uxn_device_h_l134_c13_8ab4_iftrue;
     MUX_uxn_device_h_l134_c13_8ab4_iffalse <= VAR_MUX_uxn_device_h_l134_c13_8ab4_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l134_c13_8ab4_return_output := MUX_uxn_device_h_l134_c13_8ab4_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l131_c21_2ee5] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l131_c21_2ee5_left <= VAR_BIN_OP_PLUS_uxn_device_h_l131_c21_2ee5_left;
     BIN_OP_PLUS_uxn_device_h_l131_c21_2ee5_right <= VAR_BIN_OP_PLUS_uxn_device_h_l131_c21_2ee5_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l131_c21_2ee5_return_output := BIN_OP_PLUS_uxn_device_h_l131_c21_2ee5_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l124_c20_0e1e] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l124_c20_0e1e_left <= VAR_BIN_OP_MINUS_uxn_device_h_l124_c20_0e1e_left;
     BIN_OP_MINUS_uxn_device_h_l124_c20_0e1e_right <= VAR_BIN_OP_MINUS_uxn_device_h_l124_c20_0e1e_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l124_c20_0e1e_return_output := BIN_OP_MINUS_uxn_device_h_l124_c20_0e1e_return_output;

     -- uint12_7_3[uxn_device_h_l122_c20_8799] LATENCY=0
     VAR_uint12_7_3_uxn_device_h_l122_c20_8799_return_output := uint12_7_3(
     VAR_phase);

     -- MUX[uxn_device_h_l132_c10_83c9] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l132_c10_83c9_cond <= VAR_MUX_uxn_device_h_l132_c10_83c9_cond;
     MUX_uxn_device_h_l132_c10_83c9_iftrue <= VAR_MUX_uxn_device_h_l132_c10_83c9_iftrue;
     MUX_uxn_device_h_l132_c10_83c9_iffalse <= VAR_MUX_uxn_device_h_l132_c10_83c9_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l132_c10_83c9_return_output := MUX_uxn_device_h_l132_c10_83c9_return_output;

     -- Submodule level 1
     VAR_opaque_MUX_uxn_device_h_l130_c2_4d2e_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c6_46d9_return_output;
     VAR_x_MUX_uxn_device_h_l130_c2_4d2e_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c6_46d9_return_output;
     VAR_xmod_MUX_uxn_device_h_l130_c2_4d2e_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c6_46d9_return_output;
     VAR_y_MUX_uxn_device_h_l130_c2_4d2e_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c6_46d9_return_output;
     VAR_MUX_uxn_device_h_l149_c25_b3a1_cond := VAR_BIN_OP_EQ_uxn_device_h_l149_c25_871c_return_output;
     VAR_phase_minus_two_uxn_device_h_l124_c2_fe68 := resize(VAR_BIN_OP_MINUS_uxn_device_h_l124_c20_0e1e_return_output, 8);
     VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l131_c12_b0bb_var_dim_0 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l131_c21_2ee5_return_output, 6);
     VAR_result_u16_addr_uxn_device_h_l141_c3_951f := resize(VAR_BIN_OP_PLUS_uxn_device_h_l141_c21_3118_return_output, 16);
     VAR_BIN_OP_PLUS_uxn_device_h_l133_c7_6854_right := VAR_MUX_uxn_device_h_l132_c10_83c9_return_output;
     VAR_xmod_MUX_uxn_device_h_l130_c2_4d2e_iftrue := VAR_MUX_uxn_device_h_l132_c10_83c9_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l134_c7_19fd_right := VAR_MUX_uxn_device_h_l134_c13_8ab4_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l143_c7_dcd6_left := VAR_uint12_2_0_uxn_device_h_l123_c20_7595_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l144_c7_891f_left := VAR_uint12_2_0_uxn_device_h_l123_c20_7595_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l148_c7_7ec6_left := VAR_uint12_2_0_uxn_device_h_l123_c20_7595_return_output;
     REG_VAR_phase2_downto_0 := VAR_uint12_2_0_uxn_device_h_l123_c20_7595_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l137_c6_6e68_left := VAR_uint12_7_3_uxn_device_h_l122_c20_8799_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l143_c46_6334_left := VAR_uint12_7_3_uxn_device_h_l122_c20_8799_return_output;
     REG_VAR_phase7_downto_3 := VAR_uint12_7_3_uxn_device_h_l122_c20_8799_return_output;
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_09a1_var_dim_0 := resize(VAR_phase_minus_two_uxn_device_h_l124_c2_fe68, 3);
     REG_VAR_phase_minus_two := VAR_phase_minus_two_uxn_device_h_l124_c2_fe68;
     VAR_result_u16_addr_MUX_uxn_device_h_l137_c2_9c00_iftrue := VAR_result_u16_addr_uxn_device_h_l141_c3_951f;
     -- VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8[uxn_device_h_l127_c3_09a1] LATENCY=0
     -- Inputs
     VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_09a1_elem_val <= VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_09a1_elem_val;
     VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_09a1_ref_toks_0 <= VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_09a1_ref_toks_0;
     VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_09a1_var_dim_0 <= VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_09a1_var_dim_0;
     -- Outputs
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_09a1_return_output := VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_09a1_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l134_c7_19fd] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l134_c7_19fd_left <= VAR_BIN_OP_PLUS_uxn_device_h_l134_c7_19fd_left;
     BIN_OP_PLUS_uxn_device_h_l134_c7_19fd_right <= VAR_BIN_OP_PLUS_uxn_device_h_l134_c7_19fd_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l134_c7_19fd_return_output := BIN_OP_PLUS_uxn_device_h_l134_c7_19fd_return_output;

     -- BIN_OP_EQ[uxn_device_h_l144_c7_891f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l144_c7_891f_left <= VAR_BIN_OP_EQ_uxn_device_h_l144_c7_891f_left;
     BIN_OP_EQ_uxn_device_h_l144_c7_891f_right <= VAR_BIN_OP_EQ_uxn_device_h_l144_c7_891f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l144_c7_891f_return_output := BIN_OP_EQ_uxn_device_h_l144_c7_891f_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l133_c7_6854] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l133_c7_6854_left <= VAR_BIN_OP_PLUS_uxn_device_h_l133_c7_6854_left;
     BIN_OP_PLUS_uxn_device_h_l133_c7_6854_right <= VAR_BIN_OP_PLUS_uxn_device_h_l133_c7_6854_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l133_c7_6854_return_output := BIN_OP_PLUS_uxn_device_h_l133_c7_6854_return_output;

     -- MUX[uxn_device_h_l149_c25_b3a1] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l149_c25_b3a1_cond <= VAR_MUX_uxn_device_h_l149_c25_b3a1_cond;
     MUX_uxn_device_h_l149_c25_b3a1_iftrue <= VAR_MUX_uxn_device_h_l149_c25_b3a1_iftrue;
     MUX_uxn_device_h_l149_c25_b3a1_iffalse <= VAR_MUX_uxn_device_h_l149_c25_b3a1_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l149_c25_b3a1_return_output := MUX_uxn_device_h_l149_c25_b3a1_return_output;

     -- VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d[uxn_device_h_l131_c12_b0bb] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l131_c12_b0bb_ref_toks_0 <= VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l131_c12_b0bb_ref_toks_0;
     VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l131_c12_b0bb_var_dim_0 <= VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l131_c12_b0bb_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l131_c12_b0bb_return_output := VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l131_c12_b0bb_return_output;

     -- BIN_OP_EQ[uxn_device_h_l137_c6_6e68] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l137_c6_6e68_left <= VAR_BIN_OP_EQ_uxn_device_h_l137_c6_6e68_left;
     BIN_OP_EQ_uxn_device_h_l137_c6_6e68_right <= VAR_BIN_OP_EQ_uxn_device_h_l137_c6_6e68_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l137_c6_6e68_return_output := BIN_OP_EQ_uxn_device_h_l137_c6_6e68_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l143_c46_6334] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l143_c46_6334_left <= VAR_BIN_OP_MINUS_uxn_device_h_l143_c46_6334_left;
     BIN_OP_MINUS_uxn_device_h_l143_c46_6334_right <= VAR_BIN_OP_MINUS_uxn_device_h_l143_c46_6334_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l143_c46_6334_return_output := BIN_OP_MINUS_uxn_device_h_l143_c46_6334_return_output;

     -- uint8_7_3[uxn_device_h_l126_c6_c6f6] LATENCY=0
     VAR_uint8_7_3_uxn_device_h_l126_c6_c6f6_return_output := uint8_7_3(
     VAR_phase_minus_two_uxn_device_h_l124_c2_fe68);

     -- BIN_OP_EQ[uxn_device_h_l143_c7_dcd6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l143_c7_dcd6_left <= VAR_BIN_OP_EQ_uxn_device_h_l143_c7_dcd6_left;
     BIN_OP_EQ_uxn_device_h_l143_c7_dcd6_right <= VAR_BIN_OP_EQ_uxn_device_h_l143_c7_dcd6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l143_c7_dcd6_return_output := BIN_OP_EQ_uxn_device_h_l143_c7_dcd6_return_output;

     -- BIN_OP_EQ[uxn_device_h_l148_c7_7ec6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l148_c7_7ec6_left <= VAR_BIN_OP_EQ_uxn_device_h_l148_c7_7ec6_left;
     BIN_OP_EQ_uxn_device_h_l148_c7_7ec6_right <= VAR_BIN_OP_EQ_uxn_device_h_l148_c7_7ec6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l148_c7_7ec6_return_output := BIN_OP_EQ_uxn_device_h_l148_c7_7ec6_return_output;

     -- xmod_MUX[uxn_device_h_l130_c2_4d2e] LATENCY=0
     -- Inputs
     xmod_MUX_uxn_device_h_l130_c2_4d2e_cond <= VAR_xmod_MUX_uxn_device_h_l130_c2_4d2e_cond;
     xmod_MUX_uxn_device_h_l130_c2_4d2e_iftrue <= VAR_xmod_MUX_uxn_device_h_l130_c2_4d2e_iftrue;
     xmod_MUX_uxn_device_h_l130_c2_4d2e_iffalse <= VAR_xmod_MUX_uxn_device_h_l130_c2_4d2e_iffalse;
     -- Outputs
     VAR_xmod_MUX_uxn_device_h_l130_c2_4d2e_return_output := xmod_MUX_uxn_device_h_l130_c2_4d2e_return_output;

     -- Submodule level 2
     VAR_c_MUX_uxn_device_h_l137_c2_9c00_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c6_6e68_return_output;
     VAR_result_is_blit_done_MUX_uxn_device_h_l137_c2_9c00_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c6_6e68_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l137_c2_9c00_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c6_6e68_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l137_c2_9c00_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c6_6e68_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l137_c2_9c00_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c6_6e68_return_output;
     VAR_x_MUX_uxn_device_h_l137_c2_9c00_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c6_6e68_return_output;
     VAR_y_MUX_uxn_device_h_l137_c2_9c00_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c6_6e68_return_output;
     VAR_MUX_uxn_device_h_l143_c7_24b2_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c7_dcd6_return_output;
     VAR_MUX_uxn_device_h_l144_c7_cd9c_cond := VAR_BIN_OP_EQ_uxn_device_h_l144_c7_891f_return_output;
     VAR_MUX_uxn_device_h_l148_c7_b2b2_cond := VAR_BIN_OP_EQ_uxn_device_h_l148_c7_7ec6_return_output;
     VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l143_c34_3198_var_dim_0 := resize(VAR_BIN_OP_MINUS_uxn_device_h_l143_c46_6334_return_output, 3);
     VAR_x_uxn_device_h_l133_c3_abc1 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l133_c7_6854_return_output, 16);
     VAR_y_uxn_device_h_l134_c3_d92d := resize(VAR_BIN_OP_PLUS_uxn_device_h_l134_c7_19fd_return_output, 16);
     VAR_result_is_blit_done_MUX_uxn_device_h_l137_c2_9c00_iffalse := VAR_MUX_uxn_device_h_l149_c25_b3a1_return_output;
     VAR_opaque_uxn_device_h_l131_c3_524d := resize(VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l131_c12_b0bb_return_output, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l126_c6_5374_left := VAR_uint8_7_3_uxn_device_h_l126_c6_c6f6_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l144_c35_dbbd_right := VAR_xmod_MUX_uxn_device_h_l130_c2_4d2e_return_output;
     REG_VAR_xmod := VAR_xmod_MUX_uxn_device_h_l130_c2_4d2e_return_output;
     VAR_opaque_MUX_uxn_device_h_l130_c2_4d2e_iftrue := VAR_opaque_uxn_device_h_l131_c3_524d;
     VAR_x_MUX_uxn_device_h_l130_c2_4d2e_iftrue := VAR_x_uxn_device_h_l133_c3_abc1;
     VAR_y_MUX_uxn_device_h_l130_c2_4d2e_iftrue := VAR_y_uxn_device_h_l134_c3_d92d;
     -- y_MUX[uxn_device_h_l130_c2_4d2e] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l130_c2_4d2e_cond <= VAR_y_MUX_uxn_device_h_l130_c2_4d2e_cond;
     y_MUX_uxn_device_h_l130_c2_4d2e_iftrue <= VAR_y_MUX_uxn_device_h_l130_c2_4d2e_iftrue;
     y_MUX_uxn_device_h_l130_c2_4d2e_iffalse <= VAR_y_MUX_uxn_device_h_l130_c2_4d2e_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l130_c2_4d2e_return_output := y_MUX_uxn_device_h_l130_c2_4d2e_return_output;

     -- BIN_OP_EQ[uxn_device_h_l126_c6_5374] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l126_c6_5374_left <= VAR_BIN_OP_EQ_uxn_device_h_l126_c6_5374_left;
     BIN_OP_EQ_uxn_device_h_l126_c6_5374_right <= VAR_BIN_OP_EQ_uxn_device_h_l126_c6_5374_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l126_c6_5374_return_output := BIN_OP_EQ_uxn_device_h_l126_c6_5374_return_output;

     -- x_MUX[uxn_device_h_l130_c2_4d2e] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l130_c2_4d2e_cond <= VAR_x_MUX_uxn_device_h_l130_c2_4d2e_cond;
     x_MUX_uxn_device_h_l130_c2_4d2e_iftrue <= VAR_x_MUX_uxn_device_h_l130_c2_4d2e_iftrue;
     x_MUX_uxn_device_h_l130_c2_4d2e_iffalse <= VAR_x_MUX_uxn_device_h_l130_c2_4d2e_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l130_c2_4d2e_return_output := x_MUX_uxn_device_h_l130_c2_4d2e_return_output;

     -- opaque_MUX[uxn_device_h_l130_c2_4d2e] LATENCY=0
     -- Inputs
     opaque_MUX_uxn_device_h_l130_c2_4d2e_cond <= VAR_opaque_MUX_uxn_device_h_l130_c2_4d2e_cond;
     opaque_MUX_uxn_device_h_l130_c2_4d2e_iftrue <= VAR_opaque_MUX_uxn_device_h_l130_c2_4d2e_iftrue;
     opaque_MUX_uxn_device_h_l130_c2_4d2e_iffalse <= VAR_opaque_MUX_uxn_device_h_l130_c2_4d2e_iffalse;
     -- Outputs
     VAR_opaque_MUX_uxn_device_h_l130_c2_4d2e_return_output := opaque_MUX_uxn_device_h_l130_c2_4d2e_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l144_c35_dbbd] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l144_c35_dbbd_left <= VAR_BIN_OP_PLUS_uxn_device_h_l144_c35_dbbd_left;
     BIN_OP_PLUS_uxn_device_h_l144_c35_dbbd_right <= VAR_BIN_OP_PLUS_uxn_device_h_l144_c35_dbbd_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l144_c35_dbbd_return_output := BIN_OP_PLUS_uxn_device_h_l144_c35_dbbd_return_output;

     -- sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_8_uint8_t_8_5ff5[uxn_device_h_l126_c2_7e1a] LATENCY=0
     VAR_sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_8_uint8_t_8_5ff5_uxn_device_h_l126_c2_7e1a_return_output := CONST_REF_RD_uint8_t_8_uint8_t_8_5ff5(
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l127_c3_09a1_return_output);

     -- result_is_blit_done_MUX[uxn_device_h_l137_c2_9c00] LATENCY=0
     -- Inputs
     result_is_blit_done_MUX_uxn_device_h_l137_c2_9c00_cond <= VAR_result_is_blit_done_MUX_uxn_device_h_l137_c2_9c00_cond;
     result_is_blit_done_MUX_uxn_device_h_l137_c2_9c00_iftrue <= VAR_result_is_blit_done_MUX_uxn_device_h_l137_c2_9c00_iftrue;
     result_is_blit_done_MUX_uxn_device_h_l137_c2_9c00_iffalse <= VAR_result_is_blit_done_MUX_uxn_device_h_l137_c2_9c00_iffalse;
     -- Outputs
     VAR_result_is_blit_done_MUX_uxn_device_h_l137_c2_9c00_return_output := result_is_blit_done_MUX_uxn_device_h_l137_c2_9c00_return_output;

     -- Submodule level 3
     VAR_sprite_rows_MUX_uxn_device_h_l126_c2_7e1a_cond := VAR_BIN_OP_EQ_uxn_device_h_l126_c6_5374_return_output;
     VAR_MUX_uxn_device_h_l144_c7_cd9c_iftrue := resize(VAR_BIN_OP_PLUS_uxn_device_h_l144_c35_dbbd_return_output, 16);
     VAR_BIN_OP_OR_uxn_device_h_l146_c26_f4a2_left := VAR_opaque_MUX_uxn_device_h_l130_c2_4d2e_return_output;
     REG_VAR_opaque := VAR_opaque_MUX_uxn_device_h_l130_c2_4d2e_return_output;
     VAR_sprite_rows_MUX_uxn_device_h_l126_c2_7e1a_iftrue := VAR_sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_8_uint8_t_8_5ff5_uxn_device_h_l126_c2_7e1a_return_output;
     VAR_MUX_uxn_device_h_l144_c7_cd9c_iffalse := VAR_x_MUX_uxn_device_h_l130_c2_4d2e_return_output;
     VAR_x_MUX_uxn_device_h_l137_c2_9c00_iftrue := VAR_x_MUX_uxn_device_h_l130_c2_4d2e_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l148_c41_9e0e_left := VAR_y_MUX_uxn_device_h_l130_c2_4d2e_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l148_c51_a739_left := VAR_y_MUX_uxn_device_h_l130_c2_4d2e_return_output;
     VAR_CONST_SL_8_uxn_device_h_l145_c22_dcc1_x := VAR_y_MUX_uxn_device_h_l130_c2_4d2e_return_output;
     VAR_MUX_uxn_device_h_l148_c7_b2b2_iffalse := VAR_y_MUX_uxn_device_h_l130_c2_4d2e_return_output;
     VAR_y_MUX_uxn_device_h_l137_c2_9c00_iftrue := VAR_y_MUX_uxn_device_h_l130_c2_4d2e_return_output;
     -- CONST_SL_8[uxn_device_h_l145_c22_dcc1] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_device_h_l145_c22_dcc1_x <= VAR_CONST_SL_8_uxn_device_h_l145_c22_dcc1_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_device_h_l145_c22_dcc1_return_output := CONST_SL_8_uxn_device_h_l145_c22_dcc1_return_output;

     -- sprite_rows_MUX[uxn_device_h_l126_c2_7e1a] LATENCY=0
     -- Inputs
     sprite_rows_MUX_uxn_device_h_l126_c2_7e1a_cond <= VAR_sprite_rows_MUX_uxn_device_h_l126_c2_7e1a_cond;
     sprite_rows_MUX_uxn_device_h_l126_c2_7e1a_iftrue <= VAR_sprite_rows_MUX_uxn_device_h_l126_c2_7e1a_iftrue;
     sprite_rows_MUX_uxn_device_h_l126_c2_7e1a_iffalse <= VAR_sprite_rows_MUX_uxn_device_h_l126_c2_7e1a_iffalse;
     -- Outputs
     VAR_sprite_rows_MUX_uxn_device_h_l126_c2_7e1a_return_output := sprite_rows_MUX_uxn_device_h_l126_c2_7e1a_return_output;

     -- MUX[uxn_device_h_l144_c7_cd9c] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l144_c7_cd9c_cond <= VAR_MUX_uxn_device_h_l144_c7_cd9c_cond;
     MUX_uxn_device_h_l144_c7_cd9c_iftrue <= VAR_MUX_uxn_device_h_l144_c7_cd9c_iftrue;
     MUX_uxn_device_h_l144_c7_cd9c_iffalse <= VAR_MUX_uxn_device_h_l144_c7_cd9c_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l144_c7_cd9c_return_output := MUX_uxn_device_h_l144_c7_cd9c_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l148_c51_a739] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l148_c51_a739_left <= VAR_BIN_OP_PLUS_uxn_device_h_l148_c51_a739_left;
     BIN_OP_PLUS_uxn_device_h_l148_c51_a739_right <= VAR_BIN_OP_PLUS_uxn_device_h_l148_c51_a739_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l148_c51_a739_return_output := BIN_OP_PLUS_uxn_device_h_l148_c51_a739_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l148_c41_9e0e] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l148_c41_9e0e_left <= VAR_BIN_OP_MINUS_uxn_device_h_l148_c41_9e0e_left;
     BIN_OP_MINUS_uxn_device_h_l148_c41_9e0e_right <= VAR_BIN_OP_MINUS_uxn_device_h_l148_c41_9e0e_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l148_c41_9e0e_return_output := BIN_OP_MINUS_uxn_device_h_l148_c41_9e0e_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_device_h_l148_c35_a45c_iftrue := VAR_BIN_OP_MINUS_uxn_device_h_l148_c41_9e0e_return_output;
     VAR_MUX_uxn_device_h_l148_c35_a45c_iffalse := resize(VAR_BIN_OP_PLUS_uxn_device_h_l148_c51_a739_return_output, 16);
     VAR_BIN_OP_PLUS_uxn_device_h_l145_c22_0842_left := VAR_CONST_SL_8_uxn_device_h_l145_c22_dcc1_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l151_c24_7870_left := VAR_MUX_uxn_device_h_l144_c7_cd9c_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l145_c22_0842_right := VAR_MUX_uxn_device_h_l144_c7_cd9c_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l151_c14_e7c9_left := VAR_MUX_uxn_device_h_l144_c7_cd9c_return_output;
     VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l143_c34_3198_ref_toks_0 := VAR_sprite_rows_MUX_uxn_device_h_l126_c2_7e1a_return_output;
     REG_VAR_sprite_rows := VAR_sprite_rows_MUX_uxn_device_h_l126_c2_7e1a_return_output;
     -- VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d[uxn_device_h_l143_c34_3198] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l143_c34_3198_ref_toks_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l143_c34_3198_ref_toks_0;
     VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l143_c34_3198_var_dim_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l143_c34_3198_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l143_c34_3198_return_output := VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l143_c34_3198_return_output;

     -- MUX[uxn_device_h_l148_c35_a45c] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l148_c35_a45c_cond <= VAR_MUX_uxn_device_h_l148_c35_a45c_cond;
     MUX_uxn_device_h_l148_c35_a45c_iftrue <= VAR_MUX_uxn_device_h_l148_c35_a45c_iftrue;
     MUX_uxn_device_h_l148_c35_a45c_iffalse <= VAR_MUX_uxn_device_h_l148_c35_a45c_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l148_c35_a45c_return_output := MUX_uxn_device_h_l148_c35_a45c_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l145_c22_0842] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l145_c22_0842_left <= VAR_BIN_OP_PLUS_uxn_device_h_l145_c22_0842_left;
     BIN_OP_PLUS_uxn_device_h_l145_c22_0842_right <= VAR_BIN_OP_PLUS_uxn_device_h_l145_c22_0842_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l145_c22_0842_return_output := BIN_OP_PLUS_uxn_device_h_l145_c22_0842_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l151_c14_e7c9] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l151_c14_e7c9_left <= VAR_BIN_OP_PLUS_uxn_device_h_l151_c14_e7c9_left;
     BIN_OP_PLUS_uxn_device_h_l151_c14_e7c9_right <= VAR_BIN_OP_PLUS_uxn_device_h_l151_c14_e7c9_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l151_c14_e7c9_return_output := BIN_OP_PLUS_uxn_device_h_l151_c14_e7c9_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l151_c24_7870] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l151_c24_7870_left <= VAR_BIN_OP_MINUS_uxn_device_h_l151_c24_7870_left;
     BIN_OP_MINUS_uxn_device_h_l151_c24_7870_right <= VAR_BIN_OP_MINUS_uxn_device_h_l151_c24_7870_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l151_c24_7870_return_output := BIN_OP_MINUS_uxn_device_h_l151_c24_7870_return_output;

     -- Submodule level 5
     VAR_MUX_uxn_device_h_l151_c8_9cc8_iffalse := VAR_BIN_OP_MINUS_uxn_device_h_l151_c24_7870_return_output;
     VAR_result_u16_addr_uxn_device_h_l145_c3_212f := resize(VAR_BIN_OP_PLUS_uxn_device_h_l145_c22_0842_return_output, 16);
     VAR_MUX_uxn_device_h_l151_c8_9cc8_iftrue := resize(VAR_BIN_OP_PLUS_uxn_device_h_l151_c14_e7c9_return_output, 16);
     VAR_MUX_uxn_device_h_l148_c7_b2b2_iftrue := VAR_MUX_uxn_device_h_l148_c35_a45c_return_output;
     VAR_MUX_uxn_device_h_l143_c7_24b2_iftrue := VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l143_c34_3198_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l137_c2_9c00_iffalse := VAR_result_u16_addr_uxn_device_h_l145_c3_212f;
     -- MUX[uxn_device_h_l151_c8_9cc8] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l151_c8_9cc8_cond <= VAR_MUX_uxn_device_h_l151_c8_9cc8_cond;
     MUX_uxn_device_h_l151_c8_9cc8_iftrue <= VAR_MUX_uxn_device_h_l151_c8_9cc8_iftrue;
     MUX_uxn_device_h_l151_c8_9cc8_iffalse <= VAR_MUX_uxn_device_h_l151_c8_9cc8_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l151_c8_9cc8_return_output := MUX_uxn_device_h_l151_c8_9cc8_return_output;

     -- MUX[uxn_device_h_l148_c7_b2b2] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l148_c7_b2b2_cond <= VAR_MUX_uxn_device_h_l148_c7_b2b2_cond;
     MUX_uxn_device_h_l148_c7_b2b2_iftrue <= VAR_MUX_uxn_device_h_l148_c7_b2b2_iftrue;
     MUX_uxn_device_h_l148_c7_b2b2_iffalse <= VAR_MUX_uxn_device_h_l148_c7_b2b2_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l148_c7_b2b2_return_output := MUX_uxn_device_h_l148_c7_b2b2_return_output;

     -- result_u16_addr_MUX[uxn_device_h_l137_c2_9c00] LATENCY=0
     -- Inputs
     result_u16_addr_MUX_uxn_device_h_l137_c2_9c00_cond <= VAR_result_u16_addr_MUX_uxn_device_h_l137_c2_9c00_cond;
     result_u16_addr_MUX_uxn_device_h_l137_c2_9c00_iftrue <= VAR_result_u16_addr_MUX_uxn_device_h_l137_c2_9c00_iftrue;
     result_u16_addr_MUX_uxn_device_h_l137_c2_9c00_iffalse <= VAR_result_u16_addr_MUX_uxn_device_h_l137_c2_9c00_iffalse;
     -- Outputs
     VAR_result_u16_addr_MUX_uxn_device_h_l137_c2_9c00_return_output := result_u16_addr_MUX_uxn_device_h_l137_c2_9c00_return_output;

     -- MUX[uxn_device_h_l143_c7_24b2] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l143_c7_24b2_cond <= VAR_MUX_uxn_device_h_l143_c7_24b2_cond;
     MUX_uxn_device_h_l143_c7_24b2_iftrue <= VAR_MUX_uxn_device_h_l143_c7_24b2_iftrue;
     MUX_uxn_device_h_l143_c7_24b2_iffalse <= VAR_MUX_uxn_device_h_l143_c7_24b2_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l143_c7_24b2_return_output := MUX_uxn_device_h_l143_c7_24b2_return_output;

     -- Submodule level 6
     VAR_CONST_SR_1_uxn_device_h_l150_c3_650f_x := VAR_MUX_uxn_device_h_l143_c7_24b2_return_output;
     VAR_y_MUX_uxn_device_h_l137_c2_9c00_iffalse := VAR_MUX_uxn_device_h_l148_c7_b2b2_return_output;
     VAR_x_MUX_uxn_device_h_l137_c2_9c00_iffalse := VAR_MUX_uxn_device_h_l151_c8_9cc8_return_output;
     -- y_MUX[uxn_device_h_l137_c2_9c00] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l137_c2_9c00_cond <= VAR_y_MUX_uxn_device_h_l137_c2_9c00_cond;
     y_MUX_uxn_device_h_l137_c2_9c00_iftrue <= VAR_y_MUX_uxn_device_h_l137_c2_9c00_iftrue;
     y_MUX_uxn_device_h_l137_c2_9c00_iffalse <= VAR_y_MUX_uxn_device_h_l137_c2_9c00_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l137_c2_9c00_return_output := y_MUX_uxn_device_h_l137_c2_9c00_return_output;

     -- x_MUX[uxn_device_h_l137_c2_9c00] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l137_c2_9c00_cond <= VAR_x_MUX_uxn_device_h_l137_c2_9c00_cond;
     x_MUX_uxn_device_h_l137_c2_9c00_iftrue <= VAR_x_MUX_uxn_device_h_l137_c2_9c00_iftrue;
     x_MUX_uxn_device_h_l137_c2_9c00_iffalse <= VAR_x_MUX_uxn_device_h_l137_c2_9c00_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l137_c2_9c00_return_output := x_MUX_uxn_device_h_l137_c2_9c00_return_output;

     -- CONST_SR_1[uxn_device_h_l150_c3_650f] LATENCY=0
     -- Inputs
     CONST_SR_1_uxn_device_h_l150_c3_650f_x <= VAR_CONST_SR_1_uxn_device_h_l150_c3_650f_x;
     -- Outputs
     VAR_CONST_SR_1_uxn_device_h_l150_c3_650f_return_output := CONST_SR_1_uxn_device_h_l150_c3_650f_return_output;

     -- uint8_0_0_uxn_device_h_l146_l147_DUPLICATE_4870 LATENCY=0
     VAR_uint8_0_0_uxn_device_h_l146_l147_DUPLICATE_4870_return_output := uint8_0_0(
     VAR_MUX_uxn_device_h_l143_c7_24b2_return_output);

     -- Submodule level 7
     VAR_c_MUX_uxn_device_h_l137_c2_9c00_iffalse := VAR_CONST_SR_1_uxn_device_h_l150_c3_650f_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l146_c26_f4a2_right := VAR_uint8_0_0_uxn_device_h_l146_l147_DUPLICATE_4870_return_output;
     VAR_MUX_uxn_device_h_l147_c40_5ef1_cond := VAR_uint8_0_0_uxn_device_h_l146_l147_DUPLICATE_4870_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l137_c2_9c00_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l137_c2_9c00_return_output;
     -- c_MUX[uxn_device_h_l137_c2_9c00] LATENCY=0
     -- Inputs
     c_MUX_uxn_device_h_l137_c2_9c00_cond <= VAR_c_MUX_uxn_device_h_l137_c2_9c00_cond;
     c_MUX_uxn_device_h_l137_c2_9c00_iftrue <= VAR_c_MUX_uxn_device_h_l137_c2_9c00_iftrue;
     c_MUX_uxn_device_h_l137_c2_9c00_iffalse <= VAR_c_MUX_uxn_device_h_l137_c2_9c00_iffalse;
     -- Outputs
     VAR_c_MUX_uxn_device_h_l137_c2_9c00_return_output := c_MUX_uxn_device_h_l137_c2_9c00_return_output;

     -- BIN_OP_OR[uxn_device_h_l146_c26_f4a2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l146_c26_f4a2_left <= VAR_BIN_OP_OR_uxn_device_h_l146_c26_f4a2_left;
     BIN_OP_OR_uxn_device_h_l146_c26_f4a2_right <= VAR_BIN_OP_OR_uxn_device_h_l146_c26_f4a2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l146_c26_f4a2_return_output := BIN_OP_OR_uxn_device_h_l146_c26_f4a2_return_output;

     -- MUX[uxn_device_h_l147_c40_5ef1] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l147_c40_5ef1_cond <= VAR_MUX_uxn_device_h_l147_c40_5ef1_cond;
     MUX_uxn_device_h_l147_c40_5ef1_iftrue <= VAR_MUX_uxn_device_h_l147_c40_5ef1_iftrue;
     MUX_uxn_device_h_l147_c40_5ef1_iffalse <= VAR_MUX_uxn_device_h_l147_c40_5ef1_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l147_c40_5ef1_return_output := MUX_uxn_device_h_l147_c40_5ef1_return_output;

     -- Submodule level 8
     VAR_result_is_vram_write_MUX_uxn_device_h_l137_c2_9c00_iffalse := VAR_BIN_OP_OR_uxn_device_h_l146_c26_f4a2_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l147_c30_c2a0_right := VAR_MUX_uxn_device_h_l147_c40_5ef1_return_output;
     REG_VAR_c := VAR_c_MUX_uxn_device_h_l137_c2_9c00_return_output;
     -- result_is_vram_write_MUX[uxn_device_h_l137_c2_9c00] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l137_c2_9c00_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l137_c2_9c00_cond;
     result_is_vram_write_MUX_uxn_device_h_l137_c2_9c00_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l137_c2_9c00_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l137_c2_9c00_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l137_c2_9c00_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l137_c2_9c00_return_output := result_is_vram_write_MUX_uxn_device_h_l137_c2_9c00_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l147_c30_c2a0] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l147_c30_c2a0_left <= VAR_BIN_OP_PLUS_uxn_device_h_l147_c30_c2a0_left;
     BIN_OP_PLUS_uxn_device_h_l147_c30_c2a0_right <= VAR_BIN_OP_PLUS_uxn_device_h_l147_c30_c2a0_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l147_c30_c2a0_return_output := BIN_OP_PLUS_uxn_device_h_l147_c30_c2a0_return_output;

     -- Submodule level 9
     VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l147_c21_5712_var_dim_0 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l147_c30_c2a0_return_output, 6);
     -- VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d[uxn_device_h_l147_c21_5712] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l147_c21_5712_ref_toks_0 <= VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l147_c21_5712_ref_toks_0;
     VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l147_c21_5712_var_dim_0 <= VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l147_c21_5712_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l147_c21_5712_return_output := VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l147_c21_5712_return_output;

     -- Submodule level 10
     VAR_result_u8_value_uxn_device_h_l147_c3_6688 := resize(VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l147_c21_5712_return_output, 8);
     VAR_result_u8_value_MUX_uxn_device_h_l137_c2_9c00_iffalse := VAR_result_u8_value_uxn_device_h_l147_c3_6688;
     -- result_u8_value_MUX[uxn_device_h_l137_c2_9c00] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l137_c2_9c00_cond <= VAR_result_u8_value_MUX_uxn_device_h_l137_c2_9c00_cond;
     result_u8_value_MUX_uxn_device_h_l137_c2_9c00_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l137_c2_9c00_iftrue;
     result_u8_value_MUX_uxn_device_h_l137_c2_9c00_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l137_c2_9c00_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l137_c2_9c00_return_output := result_u8_value_MUX_uxn_device_h_l137_c2_9c00_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_97ac_uxn_device_h_l154_l103_DUPLICATE_81c6 LATENCY=0
     VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_97ac_uxn_device_h_l154_l103_DUPLICATE_81c6_return_output := CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_97ac(
     result,
     VAR_result_u8_value_MUX_uxn_device_h_l137_c2_9c00_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l137_c2_9c00_return_output,
     VAR_result_u16_addr_MUX_uxn_device_h_l137_c2_9c00_return_output,
     VAR_result_is_blit_done_MUX_uxn_device_h_l137_c2_9c00_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_97ac_uxn_device_h_l154_l103_DUPLICATE_81c6_return_output;
     VAR_return_output := VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_97ac_uxn_device_h_l154_l103_DUPLICATE_81c6_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_blending <= REG_VAR_blending;
REG_COMB_x <= REG_VAR_x;
REG_COMB_y <= REG_VAR_y;
REG_COMB_xmod <= REG_VAR_xmod;
REG_COMB_opaque <= REG_VAR_opaque;
REG_COMB_c <= REG_VAR_c;
REG_COMB_color8 <= REG_VAR_color8;
REG_COMB_result <= REG_VAR_result;
REG_COMB_phase_minus_two <= REG_VAR_phase_minus_two;
REG_COMB_phase7_downto_3 <= REG_VAR_phase7_downto_3;
REG_COMB_phase2_downto_0 <= REG_VAR_phase2_downto_0;
REG_COMB_sprite_rows <= REG_VAR_sprite_rows;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     blending <= REG_COMB_blending;
     x <= REG_COMB_x;
     y <= REG_COMB_y;
     xmod <= REG_COMB_xmod;
     opaque <= REG_COMB_opaque;
     c <= REG_COMB_c;
     color8 <= REG_COMB_color8;
     result <= REG_COMB_result;
     phase_minus_two <= REG_COMB_phase_minus_two;
     phase7_downto_3 <= REG_COMB_phase7_downto_3;
     phase2_downto_0 <= REG_COMB_phase2_downto_0;
     sprite_rows <= REG_COMB_sprite_rows;
 end if;
 end if;
end process;

end arch;
