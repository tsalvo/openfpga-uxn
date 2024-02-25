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
-- Submodules: 118
entity pixel_deo_0CLK_45036e41 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_port : in unsigned(3 downto 0);
 phase : in unsigned(11 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out device_out_result_t);
end pixel_deo_0CLK_45036e41;
architecture arch of pixel_deo_0CLK_45036e41 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal x : unsigned(15 downto 0) := to_unsigned(0, 16);
signal y : unsigned(15 downto 0) := to_unsigned(0, 16);
signal ctrl : unsigned(7 downto 0) := to_unsigned(0, 8);
signal auto_advance : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal color : unsigned(3 downto 0) := to_unsigned(0, 4);
signal ctrl_mode : unsigned(0 downto 0) := to_unsigned(0, 1);
signal flip_x : unsigned(0 downto 0) := to_unsigned(0, 1);
signal flip_y : unsigned(0 downto 0) := to_unsigned(0, 1);
signal layer : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_auto_x : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_auto_y : unsigned(0 downto 0) := to_unsigned(0, 1);
signal result : device_out_result_t := (
is_device_ram_write => to_unsigned(0, 1),
device_ram_address => to_unsigned(0, 8),
is_vram_write => to_unsigned(0, 1),
vram_write_layer => to_unsigned(0, 1),
u16_addr => to_unsigned(0, 16),
u8_value => to_unsigned(0, 8),
is_deo_done => to_unsigned(0, 1))
;
signal REG_COMB_x : unsigned(15 downto 0);
signal REG_COMB_y : unsigned(15 downto 0);
signal REG_COMB_ctrl : unsigned(7 downto 0);
signal REG_COMB_auto_advance : unsigned(7 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_color : unsigned(3 downto 0);
signal REG_COMB_ctrl_mode : unsigned(0 downto 0);
signal REG_COMB_flip_x : unsigned(0 downto 0);
signal REG_COMB_flip_y : unsigned(0 downto 0);
signal REG_COMB_layer : unsigned(0 downto 0);
signal REG_COMB_is_auto_x : unsigned(0 downto 0);
signal REG_COMB_is_auto_y : unsigned(0 downto 0);
signal REG_COMB_result : device_out_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_device_h_l164_c6_e588]
signal BIN_OP_EQ_uxn_device_h_l164_c6_e588_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l164_c6_e588_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l164_c6_e588_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l164_c2_b08d]
signal y_MUX_uxn_device_h_l164_c2_b08d_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l164_c2_b08d_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l164_c2_b08d_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l164_c2_b08d_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l164_c2_b08d]
signal auto_advance_MUX_uxn_device_h_l164_c2_b08d_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l164_c2_b08d_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l164_c2_b08d_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l164_c2_b08d_return_output : unsigned(7 downto 0);

-- flip_y_MUX[uxn_device_h_l164_c2_b08d]
signal flip_y_MUX_uxn_device_h_l164_c2_b08d_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l164_c2_b08d_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l164_c2_b08d_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l164_c2_b08d_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l164_c2_b08d]
signal layer_MUX_uxn_device_h_l164_c2_b08d_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l164_c2_b08d_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l164_c2_b08d_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l164_c2_b08d_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l164_c2_b08d]
signal is_auto_x_MUX_uxn_device_h_l164_c2_b08d_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l164_c2_b08d_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l164_c2_b08d_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l164_c2_b08d_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l164_c2_b08d]
signal tmp8_MUX_uxn_device_h_l164_c2_b08d_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l164_c2_b08d_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l164_c2_b08d_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l164_c2_b08d_return_output : unsigned(7 downto 0);

-- ctrl_MUX[uxn_device_h_l164_c2_b08d]
signal ctrl_MUX_uxn_device_h_l164_c2_b08d_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l164_c2_b08d_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l164_c2_b08d_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l164_c2_b08d_return_output : unsigned(7 downto 0);

-- flip_x_MUX[uxn_device_h_l164_c2_b08d]
signal flip_x_MUX_uxn_device_h_l164_c2_b08d_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l164_c2_b08d_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l164_c2_b08d_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l164_c2_b08d_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l164_c2_b08d]
signal x_MUX_uxn_device_h_l164_c2_b08d_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l164_c2_b08d_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l164_c2_b08d_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l164_c2_b08d_return_output : unsigned(15 downto 0);

-- is_auto_y_MUX[uxn_device_h_l164_c2_b08d]
signal is_auto_y_MUX_uxn_device_h_l164_c2_b08d_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l164_c2_b08d_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l164_c2_b08d_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l164_c2_b08d_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l164_c2_b08d]
signal ctrl_mode_MUX_uxn_device_h_l164_c2_b08d_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l164_c2_b08d_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l164_c2_b08d_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l164_c2_b08d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l164_c2_b08d]
signal result_MUX_uxn_device_h_l164_c2_b08d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l164_c2_b08d_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l164_c2_b08d_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l164_c2_b08d_return_output : device_out_result_t;

-- color_MUX[uxn_device_h_l164_c2_b08d]
signal color_MUX_uxn_device_h_l164_c2_b08d_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l164_c2_b08d_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l164_c2_b08d_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l164_c2_b08d_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_device_h_l170_c11_cd80]
signal BIN_OP_EQ_uxn_device_h_l170_c11_cd80_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l170_c11_cd80_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l170_c11_cd80_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l170_c7_1346]
signal y_MUX_uxn_device_h_l170_c7_1346_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l170_c7_1346_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l170_c7_1346_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l170_c7_1346_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l170_c7_1346]
signal auto_advance_MUX_uxn_device_h_l170_c7_1346_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l170_c7_1346_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l170_c7_1346_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l170_c7_1346_return_output : unsigned(7 downto 0);

-- flip_y_MUX[uxn_device_h_l170_c7_1346]
signal flip_y_MUX_uxn_device_h_l170_c7_1346_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l170_c7_1346_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l170_c7_1346_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l170_c7_1346_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l170_c7_1346]
signal layer_MUX_uxn_device_h_l170_c7_1346_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l170_c7_1346_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l170_c7_1346_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l170_c7_1346_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l170_c7_1346]
signal is_auto_x_MUX_uxn_device_h_l170_c7_1346_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l170_c7_1346_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l170_c7_1346_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l170_c7_1346_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l170_c7_1346]
signal tmp8_MUX_uxn_device_h_l170_c7_1346_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l170_c7_1346_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l170_c7_1346_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l170_c7_1346_return_output : unsigned(7 downto 0);

-- ctrl_MUX[uxn_device_h_l170_c7_1346]
signal ctrl_MUX_uxn_device_h_l170_c7_1346_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l170_c7_1346_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l170_c7_1346_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l170_c7_1346_return_output : unsigned(7 downto 0);

-- flip_x_MUX[uxn_device_h_l170_c7_1346]
signal flip_x_MUX_uxn_device_h_l170_c7_1346_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l170_c7_1346_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l170_c7_1346_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l170_c7_1346_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l170_c7_1346]
signal x_MUX_uxn_device_h_l170_c7_1346_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l170_c7_1346_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l170_c7_1346_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l170_c7_1346_return_output : unsigned(15 downto 0);

-- is_auto_y_MUX[uxn_device_h_l170_c7_1346]
signal is_auto_y_MUX_uxn_device_h_l170_c7_1346_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l170_c7_1346_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l170_c7_1346_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l170_c7_1346_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l170_c7_1346]
signal ctrl_mode_MUX_uxn_device_h_l170_c7_1346_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l170_c7_1346_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l170_c7_1346_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l170_c7_1346_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l170_c7_1346]
signal result_MUX_uxn_device_h_l170_c7_1346_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l170_c7_1346_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l170_c7_1346_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l170_c7_1346_return_output : device_out_result_t;

-- color_MUX[uxn_device_h_l170_c7_1346]
signal color_MUX_uxn_device_h_l170_c7_1346_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l170_c7_1346_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l170_c7_1346_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l170_c7_1346_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_device_h_l173_c11_bfd6]
signal BIN_OP_EQ_uxn_device_h_l173_c11_bfd6_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l173_c11_bfd6_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l173_c11_bfd6_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l173_c7_d70f]
signal y_MUX_uxn_device_h_l173_c7_d70f_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l173_c7_d70f_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l173_c7_d70f_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l173_c7_d70f_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l173_c7_d70f]
signal auto_advance_MUX_uxn_device_h_l173_c7_d70f_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l173_c7_d70f_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l173_c7_d70f_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l173_c7_d70f_return_output : unsigned(7 downto 0);

-- flip_y_MUX[uxn_device_h_l173_c7_d70f]
signal flip_y_MUX_uxn_device_h_l173_c7_d70f_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l173_c7_d70f_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l173_c7_d70f_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l173_c7_d70f_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l173_c7_d70f]
signal layer_MUX_uxn_device_h_l173_c7_d70f_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l173_c7_d70f_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l173_c7_d70f_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l173_c7_d70f_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l173_c7_d70f]
signal is_auto_x_MUX_uxn_device_h_l173_c7_d70f_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l173_c7_d70f_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l173_c7_d70f_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l173_c7_d70f_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l173_c7_d70f]
signal tmp8_MUX_uxn_device_h_l173_c7_d70f_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l173_c7_d70f_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l173_c7_d70f_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l173_c7_d70f_return_output : unsigned(7 downto 0);

-- ctrl_MUX[uxn_device_h_l173_c7_d70f]
signal ctrl_MUX_uxn_device_h_l173_c7_d70f_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l173_c7_d70f_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l173_c7_d70f_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l173_c7_d70f_return_output : unsigned(7 downto 0);

-- flip_x_MUX[uxn_device_h_l173_c7_d70f]
signal flip_x_MUX_uxn_device_h_l173_c7_d70f_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l173_c7_d70f_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l173_c7_d70f_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l173_c7_d70f_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l173_c7_d70f]
signal x_MUX_uxn_device_h_l173_c7_d70f_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l173_c7_d70f_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l173_c7_d70f_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l173_c7_d70f_return_output : unsigned(15 downto 0);

-- is_auto_y_MUX[uxn_device_h_l173_c7_d70f]
signal is_auto_y_MUX_uxn_device_h_l173_c7_d70f_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l173_c7_d70f_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l173_c7_d70f_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l173_c7_d70f_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l173_c7_d70f]
signal ctrl_mode_MUX_uxn_device_h_l173_c7_d70f_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l173_c7_d70f_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l173_c7_d70f_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l173_c7_d70f_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l173_c7_d70f]
signal result_MUX_uxn_device_h_l173_c7_d70f_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l173_c7_d70f_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l173_c7_d70f_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l173_c7_d70f_return_output : device_out_result_t;

-- color_MUX[uxn_device_h_l173_c7_d70f]
signal color_MUX_uxn_device_h_l173_c7_d70f_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l173_c7_d70f_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l173_c7_d70f_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l173_c7_d70f_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_device_h_l177_c11_70ec]
signal BIN_OP_EQ_uxn_device_h_l177_c11_70ec_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l177_c11_70ec_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l177_c11_70ec_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l177_c7_40ab]
signal y_MUX_uxn_device_h_l177_c7_40ab_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l177_c7_40ab_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l177_c7_40ab_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l177_c7_40ab_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l177_c7_40ab]
signal auto_advance_MUX_uxn_device_h_l177_c7_40ab_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l177_c7_40ab_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l177_c7_40ab_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l177_c7_40ab_return_output : unsigned(7 downto 0);

-- flip_y_MUX[uxn_device_h_l177_c7_40ab]
signal flip_y_MUX_uxn_device_h_l177_c7_40ab_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l177_c7_40ab_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l177_c7_40ab_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l177_c7_40ab_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l177_c7_40ab]
signal layer_MUX_uxn_device_h_l177_c7_40ab_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l177_c7_40ab_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l177_c7_40ab_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l177_c7_40ab_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l177_c7_40ab]
signal is_auto_x_MUX_uxn_device_h_l177_c7_40ab_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l177_c7_40ab_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l177_c7_40ab_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l177_c7_40ab_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l177_c7_40ab]
signal tmp8_MUX_uxn_device_h_l177_c7_40ab_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l177_c7_40ab_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l177_c7_40ab_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l177_c7_40ab_return_output : unsigned(7 downto 0);

-- ctrl_MUX[uxn_device_h_l177_c7_40ab]
signal ctrl_MUX_uxn_device_h_l177_c7_40ab_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l177_c7_40ab_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l177_c7_40ab_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l177_c7_40ab_return_output : unsigned(7 downto 0);

-- flip_x_MUX[uxn_device_h_l177_c7_40ab]
signal flip_x_MUX_uxn_device_h_l177_c7_40ab_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l177_c7_40ab_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l177_c7_40ab_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l177_c7_40ab_return_output : unsigned(0 downto 0);

-- is_auto_y_MUX[uxn_device_h_l177_c7_40ab]
signal is_auto_y_MUX_uxn_device_h_l177_c7_40ab_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l177_c7_40ab_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l177_c7_40ab_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l177_c7_40ab_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l177_c7_40ab]
signal ctrl_mode_MUX_uxn_device_h_l177_c7_40ab_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l177_c7_40ab_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l177_c7_40ab_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l177_c7_40ab_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l177_c7_40ab]
signal result_MUX_uxn_device_h_l177_c7_40ab_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l177_c7_40ab_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l177_c7_40ab_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l177_c7_40ab_return_output : device_out_result_t;

-- color_MUX[uxn_device_h_l177_c7_40ab]
signal color_MUX_uxn_device_h_l177_c7_40ab_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l177_c7_40ab_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l177_c7_40ab_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l177_c7_40ab_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_device_h_l181_c11_2a24]
signal BIN_OP_EQ_uxn_device_h_l181_c11_2a24_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l181_c11_2a24_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l181_c11_2a24_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l181_c7_daa1]
signal auto_advance_MUX_uxn_device_h_l181_c7_daa1_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l181_c7_daa1_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l181_c7_daa1_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l181_c7_daa1_return_output : unsigned(7 downto 0);

-- flip_y_MUX[uxn_device_h_l181_c7_daa1]
signal flip_y_MUX_uxn_device_h_l181_c7_daa1_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l181_c7_daa1_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l181_c7_daa1_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l181_c7_daa1_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l181_c7_daa1]
signal layer_MUX_uxn_device_h_l181_c7_daa1_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l181_c7_daa1_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l181_c7_daa1_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l181_c7_daa1_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l181_c7_daa1]
signal is_auto_x_MUX_uxn_device_h_l181_c7_daa1_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l181_c7_daa1_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l181_c7_daa1_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l181_c7_daa1_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l181_c7_daa1]
signal tmp8_MUX_uxn_device_h_l181_c7_daa1_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l181_c7_daa1_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l181_c7_daa1_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l181_c7_daa1_return_output : unsigned(7 downto 0);

-- ctrl_MUX[uxn_device_h_l181_c7_daa1]
signal ctrl_MUX_uxn_device_h_l181_c7_daa1_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l181_c7_daa1_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l181_c7_daa1_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l181_c7_daa1_return_output : unsigned(7 downto 0);

-- flip_x_MUX[uxn_device_h_l181_c7_daa1]
signal flip_x_MUX_uxn_device_h_l181_c7_daa1_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l181_c7_daa1_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l181_c7_daa1_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l181_c7_daa1_return_output : unsigned(0 downto 0);

-- is_auto_y_MUX[uxn_device_h_l181_c7_daa1]
signal is_auto_y_MUX_uxn_device_h_l181_c7_daa1_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l181_c7_daa1_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l181_c7_daa1_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l181_c7_daa1_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l181_c7_daa1]
signal ctrl_mode_MUX_uxn_device_h_l181_c7_daa1_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l181_c7_daa1_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l181_c7_daa1_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l181_c7_daa1_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l181_c7_daa1]
signal result_MUX_uxn_device_h_l181_c7_daa1_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l181_c7_daa1_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l181_c7_daa1_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l181_c7_daa1_return_output : device_out_result_t;

-- color_MUX[uxn_device_h_l181_c7_daa1]
signal color_MUX_uxn_device_h_l181_c7_daa1_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l181_c7_daa1_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l181_c7_daa1_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l181_c7_daa1_return_output : unsigned(3 downto 0);

-- CONST_SR_7[uxn_device_h_l184_c25_7f51]
signal CONST_SR_7_uxn_device_h_l184_c25_7f51_x : unsigned(7 downto 0);
signal CONST_SR_7_uxn_device_h_l184_c25_7f51_return_output : unsigned(7 downto 0);

-- CONST_SR_6[uxn_device_h_l185_c21_2779]
signal CONST_SR_6_uxn_device_h_l185_c21_2779_x : unsigned(7 downto 0);
signal CONST_SR_6_uxn_device_h_l185_c21_2779_return_output : unsigned(7 downto 0);

-- CONST_SR_5[uxn_device_h_l186_c22_bc50]
signal CONST_SR_5_uxn_device_h_l186_c22_bc50_x : unsigned(7 downto 0);
signal CONST_SR_5_uxn_device_h_l186_c22_bc50_return_output : unsigned(7 downto 0);

-- CONST_SR_4[uxn_device_h_l187_c22_647c]
signal CONST_SR_4_uxn_device_h_l187_c22_647c_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_device_h_l187_c22_647c_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l188_c10_0b42]
signal BIN_OP_AND_uxn_device_h_l188_c10_0b42_left : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l188_c10_0b42_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l188_c10_0b42_return_output : unsigned(3 downto 0);

-- CONST_SL_8[uxn_device_h_l190_c22_9d61]
signal CONST_SL_8_uxn_device_h_l190_c22_9d61_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_device_h_l190_c22_9d61_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l190_c22_0e66]
signal BIN_OP_PLUS_uxn_device_h_l190_c22_0e66_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l190_c22_0e66_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l190_c22_0e66_return_output : unsigned(16 downto 0);

-- tmp8_MUX[uxn_device_h_l193_c3_b65b]
signal tmp8_MUX_uxn_device_h_l193_c3_b65b_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l193_c3_b65b_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l193_c3_b65b_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l193_c3_b65b_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l193_c3_b65b]
signal result_is_deo_done_MUX_uxn_device_h_l193_c3_b65b_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l193_c3_b65b_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l193_c3_b65b_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l193_c3_b65b_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l194_c12_7bcc]
signal MUX_uxn_device_h_l194_c12_7bcc_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l194_c12_7bcc_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l194_c12_7bcc_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l194_c12_7bcc_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l194_c4_d454]
signal BIN_OP_OR_uxn_device_h_l194_c4_d454_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l194_c4_d454_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l194_c4_d454_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l195_c12_d7d9]
signal MUX_uxn_device_h_l195_c12_d7d9_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l195_c12_d7d9_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l195_c12_d7d9_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l195_c12_d7d9_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l195_c4_8be7]
signal BIN_OP_OR_uxn_device_h_l195_c4_8be7_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l195_c4_8be7_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l195_c4_8be7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l200_c11_adb3]
signal BIN_OP_EQ_uxn_device_h_l200_c11_adb3_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l200_c11_adb3_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l200_c11_adb3_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l200_c7_3d80]
signal auto_advance_MUX_uxn_device_h_l200_c7_3d80_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l200_c7_3d80_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l200_c7_3d80_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l200_c7_3d80_return_output : unsigned(7 downto 0);

-- is_auto_x_MUX[uxn_device_h_l200_c7_3d80]
signal is_auto_x_MUX_uxn_device_h_l200_c7_3d80_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l200_c7_3d80_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l200_c7_3d80_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l200_c7_3d80_return_output : unsigned(0 downto 0);

-- is_auto_y_MUX[uxn_device_h_l200_c7_3d80]
signal is_auto_y_MUX_uxn_device_h_l200_c7_3d80_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l200_c7_3d80_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l200_c7_3d80_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l200_c7_3d80_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l200_c7_3d80]
signal result_u8_value_MUX_uxn_device_h_l200_c7_3d80_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l200_c7_3d80_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l200_c7_3d80_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l200_c7_3d80_return_output : unsigned(7 downto 0);

-- result_u16_addr_MUX[uxn_device_h_l200_c7_3d80]
signal result_u16_addr_MUX_uxn_device_h_l200_c7_3d80_cond : unsigned(0 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l200_c7_3d80_iftrue : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l200_c7_3d80_iffalse : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l200_c7_3d80_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l200_c7_3d80]
signal result_is_deo_done_MUX_uxn_device_h_l200_c7_3d80_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l200_c7_3d80_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l200_c7_3d80_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l200_c7_3d80_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l200_c7_3d80]
signal result_is_vram_write_MUX_uxn_device_h_l200_c7_3d80_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l200_c7_3d80_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l200_c7_3d80_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l200_c7_3d80_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l200_c7_3d80]
signal result_device_ram_address_MUX_uxn_device_h_l200_c7_3d80_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l200_c7_3d80_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l200_c7_3d80_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l200_c7_3d80_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l200_c7_3d80]
signal result_is_device_ram_write_MUX_uxn_device_h_l200_c7_3d80_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l200_c7_3d80_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l200_c7_3d80_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l200_c7_3d80_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l207_c34_b4e9]
signal BIN_OP_PLUS_uxn_device_h_l207_c34_b4e9_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l207_c34_b4e9_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l207_c34_b4e9_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l207_c44_4e7a]
signal BIN_OP_PLUS_uxn_device_h_l207_c44_4e7a_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l207_c44_4e7a_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l207_c44_4e7a_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l207_c21_f107]
signal MUX_uxn_device_h_l207_c21_f107_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l207_c21_f107_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l207_c21_f107_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l207_c21_f107_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l208_c31_9efa]
signal MUX_uxn_device_h_l208_c31_9efa_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l208_c31_9efa_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l208_c31_9efa_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l208_c31_9efa_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_device_h_l209_c26_8223]
signal UNARY_OP_NOT_uxn_device_h_l209_c26_8223_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_device_h_l209_c26_8223_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l211_c11_48c2]
signal BIN_OP_EQ_uxn_device_h_l211_c11_48c2_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l211_c11_48c2_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l211_c11_48c2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l211_c7_4ee6]
signal result_u8_value_MUX_uxn_device_h_l211_c7_4ee6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l211_c7_4ee6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l211_c7_4ee6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l211_c7_4ee6_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l211_c7_4ee6]
signal result_device_ram_address_MUX_uxn_device_h_l211_c7_4ee6_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l211_c7_4ee6_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l211_c7_4ee6_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l211_c7_4ee6_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l211_c7_4ee6]
signal result_is_device_ram_write_MUX_uxn_device_h_l211_c7_4ee6_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l211_c7_4ee6_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l211_c7_4ee6_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l211_c7_4ee6_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l211_c7_4ee6]
signal result_is_deo_done_MUX_uxn_device_h_l211_c7_4ee6_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l211_c7_4ee6_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l211_c7_4ee6_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l211_c7_4ee6_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l213_c32_81e7]
signal BIN_OP_AND_uxn_device_h_l213_c32_81e7_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l213_c32_81e7_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l213_c32_81e7_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l215_c31_53fe]
signal BIN_OP_PLUS_uxn_device_h_l215_c31_53fe_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l215_c31_53fe_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l215_c31_53fe_return_output : unsigned(16 downto 0);

-- BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l209_l206_DUPLICATE_89fa
signal BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l209_l206_DUPLICATE_89fa_left : unsigned(0 downto 0);
signal BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l209_l206_DUPLICATE_89fa_right : unsigned(0 downto 0);
signal BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l209_l206_DUPLICATE_89fa_return_output : unsigned(0 downto 0);

function CONST_REF_RD_device_out_result_t_device_out_result_t_56ba( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.is_vram_write := ref_toks_1;
      base.is_device_ram_write := ref_toks_2;
      base.device_ram_address := ref_toks_3;
      base.is_deo_done := ref_toks_4;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_027a( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.device_ram_address := ref_toks_1;

      return_output := base;
      return return_output; 
end function;

function CAST_TO_uint4_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(3 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,4)));
    return return_output;
end function;

function CAST_TO_uint1_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(0 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,1)));
    return return_output;
end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_88f7( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.device_ram_address := ref_toks_1;
      base.u16_addr := ref_toks_2;
      base.vram_write_layer := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.is_deo_done := ref_toks_5;
      base.u8_value := ref_toks_6;

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

function uint8_1_1( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(1- i);
      end loop;
return return_output;
end function;

function CAST_TO_uint8_t_uint17_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(16 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_fa3f( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.u16_addr := ref_toks_2;
      base.is_deo_done := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.device_ram_address := ref_toks_5;
      base.is_device_ram_write := ref_toks_6;

      return_output := base;
      return return_output; 
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_device_h_l164_c6_e588
BIN_OP_EQ_uxn_device_h_l164_c6_e588 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l164_c6_e588_left,
BIN_OP_EQ_uxn_device_h_l164_c6_e588_right,
BIN_OP_EQ_uxn_device_h_l164_c6_e588_return_output);

-- y_MUX_uxn_device_h_l164_c2_b08d
y_MUX_uxn_device_h_l164_c2_b08d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l164_c2_b08d_cond,
y_MUX_uxn_device_h_l164_c2_b08d_iftrue,
y_MUX_uxn_device_h_l164_c2_b08d_iffalse,
y_MUX_uxn_device_h_l164_c2_b08d_return_output);

-- auto_advance_MUX_uxn_device_h_l164_c2_b08d
auto_advance_MUX_uxn_device_h_l164_c2_b08d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l164_c2_b08d_cond,
auto_advance_MUX_uxn_device_h_l164_c2_b08d_iftrue,
auto_advance_MUX_uxn_device_h_l164_c2_b08d_iffalse,
auto_advance_MUX_uxn_device_h_l164_c2_b08d_return_output);

-- flip_y_MUX_uxn_device_h_l164_c2_b08d
flip_y_MUX_uxn_device_h_l164_c2_b08d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l164_c2_b08d_cond,
flip_y_MUX_uxn_device_h_l164_c2_b08d_iftrue,
flip_y_MUX_uxn_device_h_l164_c2_b08d_iffalse,
flip_y_MUX_uxn_device_h_l164_c2_b08d_return_output);

-- layer_MUX_uxn_device_h_l164_c2_b08d
layer_MUX_uxn_device_h_l164_c2_b08d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l164_c2_b08d_cond,
layer_MUX_uxn_device_h_l164_c2_b08d_iftrue,
layer_MUX_uxn_device_h_l164_c2_b08d_iffalse,
layer_MUX_uxn_device_h_l164_c2_b08d_return_output);

-- is_auto_x_MUX_uxn_device_h_l164_c2_b08d
is_auto_x_MUX_uxn_device_h_l164_c2_b08d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l164_c2_b08d_cond,
is_auto_x_MUX_uxn_device_h_l164_c2_b08d_iftrue,
is_auto_x_MUX_uxn_device_h_l164_c2_b08d_iffalse,
is_auto_x_MUX_uxn_device_h_l164_c2_b08d_return_output);

-- tmp8_MUX_uxn_device_h_l164_c2_b08d
tmp8_MUX_uxn_device_h_l164_c2_b08d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l164_c2_b08d_cond,
tmp8_MUX_uxn_device_h_l164_c2_b08d_iftrue,
tmp8_MUX_uxn_device_h_l164_c2_b08d_iffalse,
tmp8_MUX_uxn_device_h_l164_c2_b08d_return_output);

-- ctrl_MUX_uxn_device_h_l164_c2_b08d
ctrl_MUX_uxn_device_h_l164_c2_b08d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l164_c2_b08d_cond,
ctrl_MUX_uxn_device_h_l164_c2_b08d_iftrue,
ctrl_MUX_uxn_device_h_l164_c2_b08d_iffalse,
ctrl_MUX_uxn_device_h_l164_c2_b08d_return_output);

-- flip_x_MUX_uxn_device_h_l164_c2_b08d
flip_x_MUX_uxn_device_h_l164_c2_b08d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l164_c2_b08d_cond,
flip_x_MUX_uxn_device_h_l164_c2_b08d_iftrue,
flip_x_MUX_uxn_device_h_l164_c2_b08d_iffalse,
flip_x_MUX_uxn_device_h_l164_c2_b08d_return_output);

-- x_MUX_uxn_device_h_l164_c2_b08d
x_MUX_uxn_device_h_l164_c2_b08d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l164_c2_b08d_cond,
x_MUX_uxn_device_h_l164_c2_b08d_iftrue,
x_MUX_uxn_device_h_l164_c2_b08d_iffalse,
x_MUX_uxn_device_h_l164_c2_b08d_return_output);

-- is_auto_y_MUX_uxn_device_h_l164_c2_b08d
is_auto_y_MUX_uxn_device_h_l164_c2_b08d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l164_c2_b08d_cond,
is_auto_y_MUX_uxn_device_h_l164_c2_b08d_iftrue,
is_auto_y_MUX_uxn_device_h_l164_c2_b08d_iffalse,
is_auto_y_MUX_uxn_device_h_l164_c2_b08d_return_output);

-- ctrl_mode_MUX_uxn_device_h_l164_c2_b08d
ctrl_mode_MUX_uxn_device_h_l164_c2_b08d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l164_c2_b08d_cond,
ctrl_mode_MUX_uxn_device_h_l164_c2_b08d_iftrue,
ctrl_mode_MUX_uxn_device_h_l164_c2_b08d_iffalse,
ctrl_mode_MUX_uxn_device_h_l164_c2_b08d_return_output);

-- result_MUX_uxn_device_h_l164_c2_b08d
result_MUX_uxn_device_h_l164_c2_b08d : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l164_c2_b08d_cond,
result_MUX_uxn_device_h_l164_c2_b08d_iftrue,
result_MUX_uxn_device_h_l164_c2_b08d_iffalse,
result_MUX_uxn_device_h_l164_c2_b08d_return_output);

-- color_MUX_uxn_device_h_l164_c2_b08d
color_MUX_uxn_device_h_l164_c2_b08d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l164_c2_b08d_cond,
color_MUX_uxn_device_h_l164_c2_b08d_iftrue,
color_MUX_uxn_device_h_l164_c2_b08d_iffalse,
color_MUX_uxn_device_h_l164_c2_b08d_return_output);

-- BIN_OP_EQ_uxn_device_h_l170_c11_cd80
BIN_OP_EQ_uxn_device_h_l170_c11_cd80 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l170_c11_cd80_left,
BIN_OP_EQ_uxn_device_h_l170_c11_cd80_right,
BIN_OP_EQ_uxn_device_h_l170_c11_cd80_return_output);

-- y_MUX_uxn_device_h_l170_c7_1346
y_MUX_uxn_device_h_l170_c7_1346 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l170_c7_1346_cond,
y_MUX_uxn_device_h_l170_c7_1346_iftrue,
y_MUX_uxn_device_h_l170_c7_1346_iffalse,
y_MUX_uxn_device_h_l170_c7_1346_return_output);

-- auto_advance_MUX_uxn_device_h_l170_c7_1346
auto_advance_MUX_uxn_device_h_l170_c7_1346 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l170_c7_1346_cond,
auto_advance_MUX_uxn_device_h_l170_c7_1346_iftrue,
auto_advance_MUX_uxn_device_h_l170_c7_1346_iffalse,
auto_advance_MUX_uxn_device_h_l170_c7_1346_return_output);

-- flip_y_MUX_uxn_device_h_l170_c7_1346
flip_y_MUX_uxn_device_h_l170_c7_1346 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l170_c7_1346_cond,
flip_y_MUX_uxn_device_h_l170_c7_1346_iftrue,
flip_y_MUX_uxn_device_h_l170_c7_1346_iffalse,
flip_y_MUX_uxn_device_h_l170_c7_1346_return_output);

-- layer_MUX_uxn_device_h_l170_c7_1346
layer_MUX_uxn_device_h_l170_c7_1346 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l170_c7_1346_cond,
layer_MUX_uxn_device_h_l170_c7_1346_iftrue,
layer_MUX_uxn_device_h_l170_c7_1346_iffalse,
layer_MUX_uxn_device_h_l170_c7_1346_return_output);

-- is_auto_x_MUX_uxn_device_h_l170_c7_1346
is_auto_x_MUX_uxn_device_h_l170_c7_1346 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l170_c7_1346_cond,
is_auto_x_MUX_uxn_device_h_l170_c7_1346_iftrue,
is_auto_x_MUX_uxn_device_h_l170_c7_1346_iffalse,
is_auto_x_MUX_uxn_device_h_l170_c7_1346_return_output);

-- tmp8_MUX_uxn_device_h_l170_c7_1346
tmp8_MUX_uxn_device_h_l170_c7_1346 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l170_c7_1346_cond,
tmp8_MUX_uxn_device_h_l170_c7_1346_iftrue,
tmp8_MUX_uxn_device_h_l170_c7_1346_iffalse,
tmp8_MUX_uxn_device_h_l170_c7_1346_return_output);

-- ctrl_MUX_uxn_device_h_l170_c7_1346
ctrl_MUX_uxn_device_h_l170_c7_1346 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l170_c7_1346_cond,
ctrl_MUX_uxn_device_h_l170_c7_1346_iftrue,
ctrl_MUX_uxn_device_h_l170_c7_1346_iffalse,
ctrl_MUX_uxn_device_h_l170_c7_1346_return_output);

-- flip_x_MUX_uxn_device_h_l170_c7_1346
flip_x_MUX_uxn_device_h_l170_c7_1346 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l170_c7_1346_cond,
flip_x_MUX_uxn_device_h_l170_c7_1346_iftrue,
flip_x_MUX_uxn_device_h_l170_c7_1346_iffalse,
flip_x_MUX_uxn_device_h_l170_c7_1346_return_output);

-- x_MUX_uxn_device_h_l170_c7_1346
x_MUX_uxn_device_h_l170_c7_1346 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l170_c7_1346_cond,
x_MUX_uxn_device_h_l170_c7_1346_iftrue,
x_MUX_uxn_device_h_l170_c7_1346_iffalse,
x_MUX_uxn_device_h_l170_c7_1346_return_output);

-- is_auto_y_MUX_uxn_device_h_l170_c7_1346
is_auto_y_MUX_uxn_device_h_l170_c7_1346 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l170_c7_1346_cond,
is_auto_y_MUX_uxn_device_h_l170_c7_1346_iftrue,
is_auto_y_MUX_uxn_device_h_l170_c7_1346_iffalse,
is_auto_y_MUX_uxn_device_h_l170_c7_1346_return_output);

-- ctrl_mode_MUX_uxn_device_h_l170_c7_1346
ctrl_mode_MUX_uxn_device_h_l170_c7_1346 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l170_c7_1346_cond,
ctrl_mode_MUX_uxn_device_h_l170_c7_1346_iftrue,
ctrl_mode_MUX_uxn_device_h_l170_c7_1346_iffalse,
ctrl_mode_MUX_uxn_device_h_l170_c7_1346_return_output);

-- result_MUX_uxn_device_h_l170_c7_1346
result_MUX_uxn_device_h_l170_c7_1346 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l170_c7_1346_cond,
result_MUX_uxn_device_h_l170_c7_1346_iftrue,
result_MUX_uxn_device_h_l170_c7_1346_iffalse,
result_MUX_uxn_device_h_l170_c7_1346_return_output);

-- color_MUX_uxn_device_h_l170_c7_1346
color_MUX_uxn_device_h_l170_c7_1346 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l170_c7_1346_cond,
color_MUX_uxn_device_h_l170_c7_1346_iftrue,
color_MUX_uxn_device_h_l170_c7_1346_iffalse,
color_MUX_uxn_device_h_l170_c7_1346_return_output);

-- BIN_OP_EQ_uxn_device_h_l173_c11_bfd6
BIN_OP_EQ_uxn_device_h_l173_c11_bfd6 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l173_c11_bfd6_left,
BIN_OP_EQ_uxn_device_h_l173_c11_bfd6_right,
BIN_OP_EQ_uxn_device_h_l173_c11_bfd6_return_output);

-- y_MUX_uxn_device_h_l173_c7_d70f
y_MUX_uxn_device_h_l173_c7_d70f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l173_c7_d70f_cond,
y_MUX_uxn_device_h_l173_c7_d70f_iftrue,
y_MUX_uxn_device_h_l173_c7_d70f_iffalse,
y_MUX_uxn_device_h_l173_c7_d70f_return_output);

-- auto_advance_MUX_uxn_device_h_l173_c7_d70f
auto_advance_MUX_uxn_device_h_l173_c7_d70f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l173_c7_d70f_cond,
auto_advance_MUX_uxn_device_h_l173_c7_d70f_iftrue,
auto_advance_MUX_uxn_device_h_l173_c7_d70f_iffalse,
auto_advance_MUX_uxn_device_h_l173_c7_d70f_return_output);

-- flip_y_MUX_uxn_device_h_l173_c7_d70f
flip_y_MUX_uxn_device_h_l173_c7_d70f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l173_c7_d70f_cond,
flip_y_MUX_uxn_device_h_l173_c7_d70f_iftrue,
flip_y_MUX_uxn_device_h_l173_c7_d70f_iffalse,
flip_y_MUX_uxn_device_h_l173_c7_d70f_return_output);

-- layer_MUX_uxn_device_h_l173_c7_d70f
layer_MUX_uxn_device_h_l173_c7_d70f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l173_c7_d70f_cond,
layer_MUX_uxn_device_h_l173_c7_d70f_iftrue,
layer_MUX_uxn_device_h_l173_c7_d70f_iffalse,
layer_MUX_uxn_device_h_l173_c7_d70f_return_output);

-- is_auto_x_MUX_uxn_device_h_l173_c7_d70f
is_auto_x_MUX_uxn_device_h_l173_c7_d70f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l173_c7_d70f_cond,
is_auto_x_MUX_uxn_device_h_l173_c7_d70f_iftrue,
is_auto_x_MUX_uxn_device_h_l173_c7_d70f_iffalse,
is_auto_x_MUX_uxn_device_h_l173_c7_d70f_return_output);

-- tmp8_MUX_uxn_device_h_l173_c7_d70f
tmp8_MUX_uxn_device_h_l173_c7_d70f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l173_c7_d70f_cond,
tmp8_MUX_uxn_device_h_l173_c7_d70f_iftrue,
tmp8_MUX_uxn_device_h_l173_c7_d70f_iffalse,
tmp8_MUX_uxn_device_h_l173_c7_d70f_return_output);

-- ctrl_MUX_uxn_device_h_l173_c7_d70f
ctrl_MUX_uxn_device_h_l173_c7_d70f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l173_c7_d70f_cond,
ctrl_MUX_uxn_device_h_l173_c7_d70f_iftrue,
ctrl_MUX_uxn_device_h_l173_c7_d70f_iffalse,
ctrl_MUX_uxn_device_h_l173_c7_d70f_return_output);

-- flip_x_MUX_uxn_device_h_l173_c7_d70f
flip_x_MUX_uxn_device_h_l173_c7_d70f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l173_c7_d70f_cond,
flip_x_MUX_uxn_device_h_l173_c7_d70f_iftrue,
flip_x_MUX_uxn_device_h_l173_c7_d70f_iffalse,
flip_x_MUX_uxn_device_h_l173_c7_d70f_return_output);

-- x_MUX_uxn_device_h_l173_c7_d70f
x_MUX_uxn_device_h_l173_c7_d70f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l173_c7_d70f_cond,
x_MUX_uxn_device_h_l173_c7_d70f_iftrue,
x_MUX_uxn_device_h_l173_c7_d70f_iffalse,
x_MUX_uxn_device_h_l173_c7_d70f_return_output);

-- is_auto_y_MUX_uxn_device_h_l173_c7_d70f
is_auto_y_MUX_uxn_device_h_l173_c7_d70f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l173_c7_d70f_cond,
is_auto_y_MUX_uxn_device_h_l173_c7_d70f_iftrue,
is_auto_y_MUX_uxn_device_h_l173_c7_d70f_iffalse,
is_auto_y_MUX_uxn_device_h_l173_c7_d70f_return_output);

-- ctrl_mode_MUX_uxn_device_h_l173_c7_d70f
ctrl_mode_MUX_uxn_device_h_l173_c7_d70f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l173_c7_d70f_cond,
ctrl_mode_MUX_uxn_device_h_l173_c7_d70f_iftrue,
ctrl_mode_MUX_uxn_device_h_l173_c7_d70f_iffalse,
ctrl_mode_MUX_uxn_device_h_l173_c7_d70f_return_output);

-- result_MUX_uxn_device_h_l173_c7_d70f
result_MUX_uxn_device_h_l173_c7_d70f : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l173_c7_d70f_cond,
result_MUX_uxn_device_h_l173_c7_d70f_iftrue,
result_MUX_uxn_device_h_l173_c7_d70f_iffalse,
result_MUX_uxn_device_h_l173_c7_d70f_return_output);

-- color_MUX_uxn_device_h_l173_c7_d70f
color_MUX_uxn_device_h_l173_c7_d70f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l173_c7_d70f_cond,
color_MUX_uxn_device_h_l173_c7_d70f_iftrue,
color_MUX_uxn_device_h_l173_c7_d70f_iffalse,
color_MUX_uxn_device_h_l173_c7_d70f_return_output);

-- BIN_OP_EQ_uxn_device_h_l177_c11_70ec
BIN_OP_EQ_uxn_device_h_l177_c11_70ec : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l177_c11_70ec_left,
BIN_OP_EQ_uxn_device_h_l177_c11_70ec_right,
BIN_OP_EQ_uxn_device_h_l177_c11_70ec_return_output);

-- y_MUX_uxn_device_h_l177_c7_40ab
y_MUX_uxn_device_h_l177_c7_40ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l177_c7_40ab_cond,
y_MUX_uxn_device_h_l177_c7_40ab_iftrue,
y_MUX_uxn_device_h_l177_c7_40ab_iffalse,
y_MUX_uxn_device_h_l177_c7_40ab_return_output);

-- auto_advance_MUX_uxn_device_h_l177_c7_40ab
auto_advance_MUX_uxn_device_h_l177_c7_40ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l177_c7_40ab_cond,
auto_advance_MUX_uxn_device_h_l177_c7_40ab_iftrue,
auto_advance_MUX_uxn_device_h_l177_c7_40ab_iffalse,
auto_advance_MUX_uxn_device_h_l177_c7_40ab_return_output);

-- flip_y_MUX_uxn_device_h_l177_c7_40ab
flip_y_MUX_uxn_device_h_l177_c7_40ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l177_c7_40ab_cond,
flip_y_MUX_uxn_device_h_l177_c7_40ab_iftrue,
flip_y_MUX_uxn_device_h_l177_c7_40ab_iffalse,
flip_y_MUX_uxn_device_h_l177_c7_40ab_return_output);

-- layer_MUX_uxn_device_h_l177_c7_40ab
layer_MUX_uxn_device_h_l177_c7_40ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l177_c7_40ab_cond,
layer_MUX_uxn_device_h_l177_c7_40ab_iftrue,
layer_MUX_uxn_device_h_l177_c7_40ab_iffalse,
layer_MUX_uxn_device_h_l177_c7_40ab_return_output);

-- is_auto_x_MUX_uxn_device_h_l177_c7_40ab
is_auto_x_MUX_uxn_device_h_l177_c7_40ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l177_c7_40ab_cond,
is_auto_x_MUX_uxn_device_h_l177_c7_40ab_iftrue,
is_auto_x_MUX_uxn_device_h_l177_c7_40ab_iffalse,
is_auto_x_MUX_uxn_device_h_l177_c7_40ab_return_output);

-- tmp8_MUX_uxn_device_h_l177_c7_40ab
tmp8_MUX_uxn_device_h_l177_c7_40ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l177_c7_40ab_cond,
tmp8_MUX_uxn_device_h_l177_c7_40ab_iftrue,
tmp8_MUX_uxn_device_h_l177_c7_40ab_iffalse,
tmp8_MUX_uxn_device_h_l177_c7_40ab_return_output);

-- ctrl_MUX_uxn_device_h_l177_c7_40ab
ctrl_MUX_uxn_device_h_l177_c7_40ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l177_c7_40ab_cond,
ctrl_MUX_uxn_device_h_l177_c7_40ab_iftrue,
ctrl_MUX_uxn_device_h_l177_c7_40ab_iffalse,
ctrl_MUX_uxn_device_h_l177_c7_40ab_return_output);

-- flip_x_MUX_uxn_device_h_l177_c7_40ab
flip_x_MUX_uxn_device_h_l177_c7_40ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l177_c7_40ab_cond,
flip_x_MUX_uxn_device_h_l177_c7_40ab_iftrue,
flip_x_MUX_uxn_device_h_l177_c7_40ab_iffalse,
flip_x_MUX_uxn_device_h_l177_c7_40ab_return_output);

-- is_auto_y_MUX_uxn_device_h_l177_c7_40ab
is_auto_y_MUX_uxn_device_h_l177_c7_40ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l177_c7_40ab_cond,
is_auto_y_MUX_uxn_device_h_l177_c7_40ab_iftrue,
is_auto_y_MUX_uxn_device_h_l177_c7_40ab_iffalse,
is_auto_y_MUX_uxn_device_h_l177_c7_40ab_return_output);

-- ctrl_mode_MUX_uxn_device_h_l177_c7_40ab
ctrl_mode_MUX_uxn_device_h_l177_c7_40ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l177_c7_40ab_cond,
ctrl_mode_MUX_uxn_device_h_l177_c7_40ab_iftrue,
ctrl_mode_MUX_uxn_device_h_l177_c7_40ab_iffalse,
ctrl_mode_MUX_uxn_device_h_l177_c7_40ab_return_output);

-- result_MUX_uxn_device_h_l177_c7_40ab
result_MUX_uxn_device_h_l177_c7_40ab : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l177_c7_40ab_cond,
result_MUX_uxn_device_h_l177_c7_40ab_iftrue,
result_MUX_uxn_device_h_l177_c7_40ab_iffalse,
result_MUX_uxn_device_h_l177_c7_40ab_return_output);

-- color_MUX_uxn_device_h_l177_c7_40ab
color_MUX_uxn_device_h_l177_c7_40ab : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l177_c7_40ab_cond,
color_MUX_uxn_device_h_l177_c7_40ab_iftrue,
color_MUX_uxn_device_h_l177_c7_40ab_iffalse,
color_MUX_uxn_device_h_l177_c7_40ab_return_output);

-- BIN_OP_EQ_uxn_device_h_l181_c11_2a24
BIN_OP_EQ_uxn_device_h_l181_c11_2a24 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l181_c11_2a24_left,
BIN_OP_EQ_uxn_device_h_l181_c11_2a24_right,
BIN_OP_EQ_uxn_device_h_l181_c11_2a24_return_output);

-- auto_advance_MUX_uxn_device_h_l181_c7_daa1
auto_advance_MUX_uxn_device_h_l181_c7_daa1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l181_c7_daa1_cond,
auto_advance_MUX_uxn_device_h_l181_c7_daa1_iftrue,
auto_advance_MUX_uxn_device_h_l181_c7_daa1_iffalse,
auto_advance_MUX_uxn_device_h_l181_c7_daa1_return_output);

-- flip_y_MUX_uxn_device_h_l181_c7_daa1
flip_y_MUX_uxn_device_h_l181_c7_daa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l181_c7_daa1_cond,
flip_y_MUX_uxn_device_h_l181_c7_daa1_iftrue,
flip_y_MUX_uxn_device_h_l181_c7_daa1_iffalse,
flip_y_MUX_uxn_device_h_l181_c7_daa1_return_output);

-- layer_MUX_uxn_device_h_l181_c7_daa1
layer_MUX_uxn_device_h_l181_c7_daa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l181_c7_daa1_cond,
layer_MUX_uxn_device_h_l181_c7_daa1_iftrue,
layer_MUX_uxn_device_h_l181_c7_daa1_iffalse,
layer_MUX_uxn_device_h_l181_c7_daa1_return_output);

-- is_auto_x_MUX_uxn_device_h_l181_c7_daa1
is_auto_x_MUX_uxn_device_h_l181_c7_daa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l181_c7_daa1_cond,
is_auto_x_MUX_uxn_device_h_l181_c7_daa1_iftrue,
is_auto_x_MUX_uxn_device_h_l181_c7_daa1_iffalse,
is_auto_x_MUX_uxn_device_h_l181_c7_daa1_return_output);

-- tmp8_MUX_uxn_device_h_l181_c7_daa1
tmp8_MUX_uxn_device_h_l181_c7_daa1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l181_c7_daa1_cond,
tmp8_MUX_uxn_device_h_l181_c7_daa1_iftrue,
tmp8_MUX_uxn_device_h_l181_c7_daa1_iffalse,
tmp8_MUX_uxn_device_h_l181_c7_daa1_return_output);

-- ctrl_MUX_uxn_device_h_l181_c7_daa1
ctrl_MUX_uxn_device_h_l181_c7_daa1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l181_c7_daa1_cond,
ctrl_MUX_uxn_device_h_l181_c7_daa1_iftrue,
ctrl_MUX_uxn_device_h_l181_c7_daa1_iffalse,
ctrl_MUX_uxn_device_h_l181_c7_daa1_return_output);

-- flip_x_MUX_uxn_device_h_l181_c7_daa1
flip_x_MUX_uxn_device_h_l181_c7_daa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l181_c7_daa1_cond,
flip_x_MUX_uxn_device_h_l181_c7_daa1_iftrue,
flip_x_MUX_uxn_device_h_l181_c7_daa1_iffalse,
flip_x_MUX_uxn_device_h_l181_c7_daa1_return_output);

-- is_auto_y_MUX_uxn_device_h_l181_c7_daa1
is_auto_y_MUX_uxn_device_h_l181_c7_daa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l181_c7_daa1_cond,
is_auto_y_MUX_uxn_device_h_l181_c7_daa1_iftrue,
is_auto_y_MUX_uxn_device_h_l181_c7_daa1_iffalse,
is_auto_y_MUX_uxn_device_h_l181_c7_daa1_return_output);

-- ctrl_mode_MUX_uxn_device_h_l181_c7_daa1
ctrl_mode_MUX_uxn_device_h_l181_c7_daa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l181_c7_daa1_cond,
ctrl_mode_MUX_uxn_device_h_l181_c7_daa1_iftrue,
ctrl_mode_MUX_uxn_device_h_l181_c7_daa1_iffalse,
ctrl_mode_MUX_uxn_device_h_l181_c7_daa1_return_output);

-- result_MUX_uxn_device_h_l181_c7_daa1
result_MUX_uxn_device_h_l181_c7_daa1 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l181_c7_daa1_cond,
result_MUX_uxn_device_h_l181_c7_daa1_iftrue,
result_MUX_uxn_device_h_l181_c7_daa1_iffalse,
result_MUX_uxn_device_h_l181_c7_daa1_return_output);

-- color_MUX_uxn_device_h_l181_c7_daa1
color_MUX_uxn_device_h_l181_c7_daa1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l181_c7_daa1_cond,
color_MUX_uxn_device_h_l181_c7_daa1_iftrue,
color_MUX_uxn_device_h_l181_c7_daa1_iffalse,
color_MUX_uxn_device_h_l181_c7_daa1_return_output);

-- CONST_SR_7_uxn_device_h_l184_c25_7f51
CONST_SR_7_uxn_device_h_l184_c25_7f51 : entity work.CONST_SR_7_uint8_t_0CLK_de264c78 port map (
CONST_SR_7_uxn_device_h_l184_c25_7f51_x,
CONST_SR_7_uxn_device_h_l184_c25_7f51_return_output);

-- CONST_SR_6_uxn_device_h_l185_c21_2779
CONST_SR_6_uxn_device_h_l185_c21_2779 : entity work.CONST_SR_6_uint8_t_0CLK_de264c78 port map (
CONST_SR_6_uxn_device_h_l185_c21_2779_x,
CONST_SR_6_uxn_device_h_l185_c21_2779_return_output);

-- CONST_SR_5_uxn_device_h_l186_c22_bc50
CONST_SR_5_uxn_device_h_l186_c22_bc50 : entity work.CONST_SR_5_uint8_t_0CLK_de264c78 port map (
CONST_SR_5_uxn_device_h_l186_c22_bc50_x,
CONST_SR_5_uxn_device_h_l186_c22_bc50_return_output);

-- CONST_SR_4_uxn_device_h_l187_c22_647c
CONST_SR_4_uxn_device_h_l187_c22_647c : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_device_h_l187_c22_647c_x,
CONST_SR_4_uxn_device_h_l187_c22_647c_return_output);

-- BIN_OP_AND_uxn_device_h_l188_c10_0b42
BIN_OP_AND_uxn_device_h_l188_c10_0b42 : entity work.BIN_OP_AND_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l188_c10_0b42_left,
BIN_OP_AND_uxn_device_h_l188_c10_0b42_right,
BIN_OP_AND_uxn_device_h_l188_c10_0b42_return_output);

-- CONST_SL_8_uxn_device_h_l190_c22_9d61
CONST_SL_8_uxn_device_h_l190_c22_9d61 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_device_h_l190_c22_9d61_x,
CONST_SL_8_uxn_device_h_l190_c22_9d61_return_output);

-- BIN_OP_PLUS_uxn_device_h_l190_c22_0e66
BIN_OP_PLUS_uxn_device_h_l190_c22_0e66 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l190_c22_0e66_left,
BIN_OP_PLUS_uxn_device_h_l190_c22_0e66_right,
BIN_OP_PLUS_uxn_device_h_l190_c22_0e66_return_output);

-- tmp8_MUX_uxn_device_h_l193_c3_b65b
tmp8_MUX_uxn_device_h_l193_c3_b65b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l193_c3_b65b_cond,
tmp8_MUX_uxn_device_h_l193_c3_b65b_iftrue,
tmp8_MUX_uxn_device_h_l193_c3_b65b_iffalse,
tmp8_MUX_uxn_device_h_l193_c3_b65b_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l193_c3_b65b
result_is_deo_done_MUX_uxn_device_h_l193_c3_b65b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l193_c3_b65b_cond,
result_is_deo_done_MUX_uxn_device_h_l193_c3_b65b_iftrue,
result_is_deo_done_MUX_uxn_device_h_l193_c3_b65b_iffalse,
result_is_deo_done_MUX_uxn_device_h_l193_c3_b65b_return_output);

-- MUX_uxn_device_h_l194_c12_7bcc
MUX_uxn_device_h_l194_c12_7bcc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l194_c12_7bcc_cond,
MUX_uxn_device_h_l194_c12_7bcc_iftrue,
MUX_uxn_device_h_l194_c12_7bcc_iffalse,
MUX_uxn_device_h_l194_c12_7bcc_return_output);

-- BIN_OP_OR_uxn_device_h_l194_c4_d454
BIN_OP_OR_uxn_device_h_l194_c4_d454 : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l194_c4_d454_left,
BIN_OP_OR_uxn_device_h_l194_c4_d454_right,
BIN_OP_OR_uxn_device_h_l194_c4_d454_return_output);

-- MUX_uxn_device_h_l195_c12_d7d9
MUX_uxn_device_h_l195_c12_d7d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l195_c12_d7d9_cond,
MUX_uxn_device_h_l195_c12_d7d9_iftrue,
MUX_uxn_device_h_l195_c12_d7d9_iffalse,
MUX_uxn_device_h_l195_c12_d7d9_return_output);

-- BIN_OP_OR_uxn_device_h_l195_c4_8be7
BIN_OP_OR_uxn_device_h_l195_c4_8be7 : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l195_c4_8be7_left,
BIN_OP_OR_uxn_device_h_l195_c4_8be7_right,
BIN_OP_OR_uxn_device_h_l195_c4_8be7_return_output);

-- BIN_OP_EQ_uxn_device_h_l200_c11_adb3
BIN_OP_EQ_uxn_device_h_l200_c11_adb3 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l200_c11_adb3_left,
BIN_OP_EQ_uxn_device_h_l200_c11_adb3_right,
BIN_OP_EQ_uxn_device_h_l200_c11_adb3_return_output);

-- auto_advance_MUX_uxn_device_h_l200_c7_3d80
auto_advance_MUX_uxn_device_h_l200_c7_3d80 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l200_c7_3d80_cond,
auto_advance_MUX_uxn_device_h_l200_c7_3d80_iftrue,
auto_advance_MUX_uxn_device_h_l200_c7_3d80_iffalse,
auto_advance_MUX_uxn_device_h_l200_c7_3d80_return_output);

-- is_auto_x_MUX_uxn_device_h_l200_c7_3d80
is_auto_x_MUX_uxn_device_h_l200_c7_3d80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l200_c7_3d80_cond,
is_auto_x_MUX_uxn_device_h_l200_c7_3d80_iftrue,
is_auto_x_MUX_uxn_device_h_l200_c7_3d80_iffalse,
is_auto_x_MUX_uxn_device_h_l200_c7_3d80_return_output);

-- is_auto_y_MUX_uxn_device_h_l200_c7_3d80
is_auto_y_MUX_uxn_device_h_l200_c7_3d80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l200_c7_3d80_cond,
is_auto_y_MUX_uxn_device_h_l200_c7_3d80_iftrue,
is_auto_y_MUX_uxn_device_h_l200_c7_3d80_iffalse,
is_auto_y_MUX_uxn_device_h_l200_c7_3d80_return_output);

-- result_u8_value_MUX_uxn_device_h_l200_c7_3d80
result_u8_value_MUX_uxn_device_h_l200_c7_3d80 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l200_c7_3d80_cond,
result_u8_value_MUX_uxn_device_h_l200_c7_3d80_iftrue,
result_u8_value_MUX_uxn_device_h_l200_c7_3d80_iffalse,
result_u8_value_MUX_uxn_device_h_l200_c7_3d80_return_output);

-- result_u16_addr_MUX_uxn_device_h_l200_c7_3d80
result_u16_addr_MUX_uxn_device_h_l200_c7_3d80 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_addr_MUX_uxn_device_h_l200_c7_3d80_cond,
result_u16_addr_MUX_uxn_device_h_l200_c7_3d80_iftrue,
result_u16_addr_MUX_uxn_device_h_l200_c7_3d80_iffalse,
result_u16_addr_MUX_uxn_device_h_l200_c7_3d80_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l200_c7_3d80
result_is_deo_done_MUX_uxn_device_h_l200_c7_3d80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l200_c7_3d80_cond,
result_is_deo_done_MUX_uxn_device_h_l200_c7_3d80_iftrue,
result_is_deo_done_MUX_uxn_device_h_l200_c7_3d80_iffalse,
result_is_deo_done_MUX_uxn_device_h_l200_c7_3d80_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l200_c7_3d80
result_is_vram_write_MUX_uxn_device_h_l200_c7_3d80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l200_c7_3d80_cond,
result_is_vram_write_MUX_uxn_device_h_l200_c7_3d80_iftrue,
result_is_vram_write_MUX_uxn_device_h_l200_c7_3d80_iffalse,
result_is_vram_write_MUX_uxn_device_h_l200_c7_3d80_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l200_c7_3d80
result_device_ram_address_MUX_uxn_device_h_l200_c7_3d80 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l200_c7_3d80_cond,
result_device_ram_address_MUX_uxn_device_h_l200_c7_3d80_iftrue,
result_device_ram_address_MUX_uxn_device_h_l200_c7_3d80_iffalse,
result_device_ram_address_MUX_uxn_device_h_l200_c7_3d80_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l200_c7_3d80
result_is_device_ram_write_MUX_uxn_device_h_l200_c7_3d80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l200_c7_3d80_cond,
result_is_device_ram_write_MUX_uxn_device_h_l200_c7_3d80_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l200_c7_3d80_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l200_c7_3d80_return_output);

-- BIN_OP_PLUS_uxn_device_h_l207_c34_b4e9
BIN_OP_PLUS_uxn_device_h_l207_c34_b4e9 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l207_c34_b4e9_left,
BIN_OP_PLUS_uxn_device_h_l207_c34_b4e9_right,
BIN_OP_PLUS_uxn_device_h_l207_c34_b4e9_return_output);

-- BIN_OP_PLUS_uxn_device_h_l207_c44_4e7a
BIN_OP_PLUS_uxn_device_h_l207_c44_4e7a : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l207_c44_4e7a_left,
BIN_OP_PLUS_uxn_device_h_l207_c44_4e7a_right,
BIN_OP_PLUS_uxn_device_h_l207_c44_4e7a_return_output);

-- MUX_uxn_device_h_l207_c21_f107
MUX_uxn_device_h_l207_c21_f107 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l207_c21_f107_cond,
MUX_uxn_device_h_l207_c21_f107_iftrue,
MUX_uxn_device_h_l207_c21_f107_iffalse,
MUX_uxn_device_h_l207_c21_f107_return_output);

-- MUX_uxn_device_h_l208_c31_9efa
MUX_uxn_device_h_l208_c31_9efa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l208_c31_9efa_cond,
MUX_uxn_device_h_l208_c31_9efa_iftrue,
MUX_uxn_device_h_l208_c31_9efa_iffalse,
MUX_uxn_device_h_l208_c31_9efa_return_output);

-- UNARY_OP_NOT_uxn_device_h_l209_c26_8223
UNARY_OP_NOT_uxn_device_h_l209_c26_8223 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_device_h_l209_c26_8223_expr,
UNARY_OP_NOT_uxn_device_h_l209_c26_8223_return_output);

-- BIN_OP_EQ_uxn_device_h_l211_c11_48c2
BIN_OP_EQ_uxn_device_h_l211_c11_48c2 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l211_c11_48c2_left,
BIN_OP_EQ_uxn_device_h_l211_c11_48c2_right,
BIN_OP_EQ_uxn_device_h_l211_c11_48c2_return_output);

-- result_u8_value_MUX_uxn_device_h_l211_c7_4ee6
result_u8_value_MUX_uxn_device_h_l211_c7_4ee6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l211_c7_4ee6_cond,
result_u8_value_MUX_uxn_device_h_l211_c7_4ee6_iftrue,
result_u8_value_MUX_uxn_device_h_l211_c7_4ee6_iffalse,
result_u8_value_MUX_uxn_device_h_l211_c7_4ee6_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l211_c7_4ee6
result_device_ram_address_MUX_uxn_device_h_l211_c7_4ee6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l211_c7_4ee6_cond,
result_device_ram_address_MUX_uxn_device_h_l211_c7_4ee6_iftrue,
result_device_ram_address_MUX_uxn_device_h_l211_c7_4ee6_iffalse,
result_device_ram_address_MUX_uxn_device_h_l211_c7_4ee6_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l211_c7_4ee6
result_is_device_ram_write_MUX_uxn_device_h_l211_c7_4ee6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l211_c7_4ee6_cond,
result_is_device_ram_write_MUX_uxn_device_h_l211_c7_4ee6_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l211_c7_4ee6_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l211_c7_4ee6_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l211_c7_4ee6
result_is_deo_done_MUX_uxn_device_h_l211_c7_4ee6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l211_c7_4ee6_cond,
result_is_deo_done_MUX_uxn_device_h_l211_c7_4ee6_iftrue,
result_is_deo_done_MUX_uxn_device_h_l211_c7_4ee6_iffalse,
result_is_deo_done_MUX_uxn_device_h_l211_c7_4ee6_return_output);

-- BIN_OP_AND_uxn_device_h_l213_c32_81e7
BIN_OP_AND_uxn_device_h_l213_c32_81e7 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l213_c32_81e7_left,
BIN_OP_AND_uxn_device_h_l213_c32_81e7_right,
BIN_OP_AND_uxn_device_h_l213_c32_81e7_return_output);

-- BIN_OP_PLUS_uxn_device_h_l215_c31_53fe
BIN_OP_PLUS_uxn_device_h_l215_c31_53fe : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l215_c31_53fe_left,
BIN_OP_PLUS_uxn_device_h_l215_c31_53fe_right,
BIN_OP_PLUS_uxn_device_h_l215_c31_53fe_return_output);

-- BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l209_l206_DUPLICATE_89fa
BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l209_l206_DUPLICATE_89fa : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l209_l206_DUPLICATE_89fa_left,
BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l209_l206_DUPLICATE_89fa_right,
BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l209_l206_DUPLICATE_89fa_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 device_port,
 phase,
 previous_device_ram_read,
 previous_ram_read,
 -- Registers
 x,
 y,
 ctrl,
 auto_advance,
 tmp8,
 color,
 ctrl_mode,
 flip_x,
 flip_y,
 layer,
 is_auto_x,
 is_auto_y,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_device_h_l164_c6_e588_return_output,
 y_MUX_uxn_device_h_l164_c2_b08d_return_output,
 auto_advance_MUX_uxn_device_h_l164_c2_b08d_return_output,
 flip_y_MUX_uxn_device_h_l164_c2_b08d_return_output,
 layer_MUX_uxn_device_h_l164_c2_b08d_return_output,
 is_auto_x_MUX_uxn_device_h_l164_c2_b08d_return_output,
 tmp8_MUX_uxn_device_h_l164_c2_b08d_return_output,
 ctrl_MUX_uxn_device_h_l164_c2_b08d_return_output,
 flip_x_MUX_uxn_device_h_l164_c2_b08d_return_output,
 x_MUX_uxn_device_h_l164_c2_b08d_return_output,
 is_auto_y_MUX_uxn_device_h_l164_c2_b08d_return_output,
 ctrl_mode_MUX_uxn_device_h_l164_c2_b08d_return_output,
 result_MUX_uxn_device_h_l164_c2_b08d_return_output,
 color_MUX_uxn_device_h_l164_c2_b08d_return_output,
 BIN_OP_EQ_uxn_device_h_l170_c11_cd80_return_output,
 y_MUX_uxn_device_h_l170_c7_1346_return_output,
 auto_advance_MUX_uxn_device_h_l170_c7_1346_return_output,
 flip_y_MUX_uxn_device_h_l170_c7_1346_return_output,
 layer_MUX_uxn_device_h_l170_c7_1346_return_output,
 is_auto_x_MUX_uxn_device_h_l170_c7_1346_return_output,
 tmp8_MUX_uxn_device_h_l170_c7_1346_return_output,
 ctrl_MUX_uxn_device_h_l170_c7_1346_return_output,
 flip_x_MUX_uxn_device_h_l170_c7_1346_return_output,
 x_MUX_uxn_device_h_l170_c7_1346_return_output,
 is_auto_y_MUX_uxn_device_h_l170_c7_1346_return_output,
 ctrl_mode_MUX_uxn_device_h_l170_c7_1346_return_output,
 result_MUX_uxn_device_h_l170_c7_1346_return_output,
 color_MUX_uxn_device_h_l170_c7_1346_return_output,
 BIN_OP_EQ_uxn_device_h_l173_c11_bfd6_return_output,
 y_MUX_uxn_device_h_l173_c7_d70f_return_output,
 auto_advance_MUX_uxn_device_h_l173_c7_d70f_return_output,
 flip_y_MUX_uxn_device_h_l173_c7_d70f_return_output,
 layer_MUX_uxn_device_h_l173_c7_d70f_return_output,
 is_auto_x_MUX_uxn_device_h_l173_c7_d70f_return_output,
 tmp8_MUX_uxn_device_h_l173_c7_d70f_return_output,
 ctrl_MUX_uxn_device_h_l173_c7_d70f_return_output,
 flip_x_MUX_uxn_device_h_l173_c7_d70f_return_output,
 x_MUX_uxn_device_h_l173_c7_d70f_return_output,
 is_auto_y_MUX_uxn_device_h_l173_c7_d70f_return_output,
 ctrl_mode_MUX_uxn_device_h_l173_c7_d70f_return_output,
 result_MUX_uxn_device_h_l173_c7_d70f_return_output,
 color_MUX_uxn_device_h_l173_c7_d70f_return_output,
 BIN_OP_EQ_uxn_device_h_l177_c11_70ec_return_output,
 y_MUX_uxn_device_h_l177_c7_40ab_return_output,
 auto_advance_MUX_uxn_device_h_l177_c7_40ab_return_output,
 flip_y_MUX_uxn_device_h_l177_c7_40ab_return_output,
 layer_MUX_uxn_device_h_l177_c7_40ab_return_output,
 is_auto_x_MUX_uxn_device_h_l177_c7_40ab_return_output,
 tmp8_MUX_uxn_device_h_l177_c7_40ab_return_output,
 ctrl_MUX_uxn_device_h_l177_c7_40ab_return_output,
 flip_x_MUX_uxn_device_h_l177_c7_40ab_return_output,
 is_auto_y_MUX_uxn_device_h_l177_c7_40ab_return_output,
 ctrl_mode_MUX_uxn_device_h_l177_c7_40ab_return_output,
 result_MUX_uxn_device_h_l177_c7_40ab_return_output,
 color_MUX_uxn_device_h_l177_c7_40ab_return_output,
 BIN_OP_EQ_uxn_device_h_l181_c11_2a24_return_output,
 auto_advance_MUX_uxn_device_h_l181_c7_daa1_return_output,
 flip_y_MUX_uxn_device_h_l181_c7_daa1_return_output,
 layer_MUX_uxn_device_h_l181_c7_daa1_return_output,
 is_auto_x_MUX_uxn_device_h_l181_c7_daa1_return_output,
 tmp8_MUX_uxn_device_h_l181_c7_daa1_return_output,
 ctrl_MUX_uxn_device_h_l181_c7_daa1_return_output,
 flip_x_MUX_uxn_device_h_l181_c7_daa1_return_output,
 is_auto_y_MUX_uxn_device_h_l181_c7_daa1_return_output,
 ctrl_mode_MUX_uxn_device_h_l181_c7_daa1_return_output,
 result_MUX_uxn_device_h_l181_c7_daa1_return_output,
 color_MUX_uxn_device_h_l181_c7_daa1_return_output,
 CONST_SR_7_uxn_device_h_l184_c25_7f51_return_output,
 CONST_SR_6_uxn_device_h_l185_c21_2779_return_output,
 CONST_SR_5_uxn_device_h_l186_c22_bc50_return_output,
 CONST_SR_4_uxn_device_h_l187_c22_647c_return_output,
 BIN_OP_AND_uxn_device_h_l188_c10_0b42_return_output,
 CONST_SL_8_uxn_device_h_l190_c22_9d61_return_output,
 BIN_OP_PLUS_uxn_device_h_l190_c22_0e66_return_output,
 tmp8_MUX_uxn_device_h_l193_c3_b65b_return_output,
 result_is_deo_done_MUX_uxn_device_h_l193_c3_b65b_return_output,
 MUX_uxn_device_h_l194_c12_7bcc_return_output,
 BIN_OP_OR_uxn_device_h_l194_c4_d454_return_output,
 MUX_uxn_device_h_l195_c12_d7d9_return_output,
 BIN_OP_OR_uxn_device_h_l195_c4_8be7_return_output,
 BIN_OP_EQ_uxn_device_h_l200_c11_adb3_return_output,
 auto_advance_MUX_uxn_device_h_l200_c7_3d80_return_output,
 is_auto_x_MUX_uxn_device_h_l200_c7_3d80_return_output,
 is_auto_y_MUX_uxn_device_h_l200_c7_3d80_return_output,
 result_u8_value_MUX_uxn_device_h_l200_c7_3d80_return_output,
 result_u16_addr_MUX_uxn_device_h_l200_c7_3d80_return_output,
 result_is_deo_done_MUX_uxn_device_h_l200_c7_3d80_return_output,
 result_is_vram_write_MUX_uxn_device_h_l200_c7_3d80_return_output,
 result_device_ram_address_MUX_uxn_device_h_l200_c7_3d80_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l200_c7_3d80_return_output,
 BIN_OP_PLUS_uxn_device_h_l207_c34_b4e9_return_output,
 BIN_OP_PLUS_uxn_device_h_l207_c44_4e7a_return_output,
 MUX_uxn_device_h_l207_c21_f107_return_output,
 MUX_uxn_device_h_l208_c31_9efa_return_output,
 UNARY_OP_NOT_uxn_device_h_l209_c26_8223_return_output,
 BIN_OP_EQ_uxn_device_h_l211_c11_48c2_return_output,
 result_u8_value_MUX_uxn_device_h_l211_c7_4ee6_return_output,
 result_device_ram_address_MUX_uxn_device_h_l211_c7_4ee6_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l211_c7_4ee6_return_output,
 result_is_deo_done_MUX_uxn_device_h_l211_c7_4ee6_return_output,
 BIN_OP_AND_uxn_device_h_l213_c32_81e7_return_output,
 BIN_OP_PLUS_uxn_device_h_l215_c31_53fe_return_output,
 BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l209_l206_DUPLICATE_89fa_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_port : unsigned(3 downto 0);
 variable VAR_phase : unsigned(11 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l164_c6_e588_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l164_c6_e588_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l164_c6_e588_return_output : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l164_c2_b08d_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l164_c2_b08d_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l170_c7_1346_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l164_c2_b08d_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l164_c2_b08d_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l164_c2_b08d_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l164_c2_b08d_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l170_c7_1346_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l164_c2_b08d_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l164_c2_b08d_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l164_c2_b08d_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l164_c2_b08d_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l170_c7_1346_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l164_c2_b08d_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l164_c2_b08d_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l164_c2_b08d_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l164_c2_b08d_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l170_c7_1346_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l164_c2_b08d_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l164_c2_b08d_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l164_c2_b08d_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l164_c2_b08d_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l170_c7_1346_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l164_c2_b08d_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l164_c2_b08d_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l164_c2_b08d_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l164_c2_b08d_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l170_c7_1346_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l164_c2_b08d_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l164_c2_b08d_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l164_c2_b08d_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l164_c2_b08d_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l170_c7_1346_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l164_c2_b08d_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l164_c2_b08d_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l164_c2_b08d_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l164_c2_b08d_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l170_c7_1346_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l164_c2_b08d_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l164_c2_b08d_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l164_c2_b08d_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l164_c2_b08d_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l170_c7_1346_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l164_c2_b08d_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l164_c2_b08d_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l164_c2_b08d_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l164_c2_b08d_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l170_c7_1346_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l164_c2_b08d_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l164_c2_b08d_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l164_c2_b08d_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l164_c2_b08d_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l170_c7_1346_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l164_c2_b08d_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l164_c2_b08d_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l164_c2_b08d_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l164_c2_b08d_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l164_c2_b08d_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l170_c7_1346_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l164_c2_b08d_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l164_c2_b08d_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l164_c2_b08d_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l164_c2_b08d_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l170_c7_1346_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l164_c2_b08d_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l164_c2_b08d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l170_c11_cd80_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l170_c11_cd80_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l170_c11_cd80_return_output : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l170_c7_1346_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l170_c7_1346_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l173_c7_d70f_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l170_c7_1346_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l170_c7_1346_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l170_c7_1346_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l173_c7_d70f_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l170_c7_1346_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l170_c7_1346_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l170_c7_1346_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l173_c7_d70f_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l170_c7_1346_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l170_c7_1346_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l170_c7_1346_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l173_c7_d70f_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l170_c7_1346_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l170_c7_1346_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l170_c7_1346_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l173_c7_d70f_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l170_c7_1346_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l170_c7_1346_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l170_c7_1346_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l173_c7_d70f_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l170_c7_1346_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l170_c7_1346_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l170_c7_1346_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l173_c7_d70f_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l170_c7_1346_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l170_c7_1346_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l170_c7_1346_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l173_c7_d70f_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l170_c7_1346_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l170_c7_1346_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l170_c7_1346_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l173_c7_d70f_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l170_c7_1346_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l170_c7_1346_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l170_c7_1346_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l173_c7_d70f_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l170_c7_1346_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l170_c7_1346_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l170_c7_1346_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l173_c7_d70f_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l170_c7_1346_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l170_c7_1346_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l170_c7_1346_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l170_c7_1346_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l173_c7_d70f_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l170_c7_1346_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l170_c7_1346_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l170_c7_1346_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l173_c7_d70f_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l170_c7_1346_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l173_c11_bfd6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l173_c11_bfd6_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l173_c11_bfd6_return_output : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l173_c7_d70f_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l173_c7_d70f_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l177_c7_40ab_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l173_c7_d70f_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l173_c7_d70f_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l173_c7_d70f_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l177_c7_40ab_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l173_c7_d70f_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l173_c7_d70f_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l173_c7_d70f_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l177_c7_40ab_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l173_c7_d70f_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l173_c7_d70f_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l173_c7_d70f_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l177_c7_40ab_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l173_c7_d70f_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l173_c7_d70f_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l173_c7_d70f_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l177_c7_40ab_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l173_c7_d70f_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l173_c7_d70f_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l173_c7_d70f_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l177_c7_40ab_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l173_c7_d70f_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l173_c7_d70f_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l173_c7_d70f_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l177_c7_40ab_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l173_c7_d70f_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l173_c7_d70f_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l173_c7_d70f_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l177_c7_40ab_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l173_c7_d70f_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l173_c7_d70f_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l173_c7_d70f_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l173_c7_d70f_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l173_c7_d70f_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l173_c7_d70f_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l177_c7_40ab_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l173_c7_d70f_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l173_c7_d70f_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l173_c7_d70f_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l177_c7_40ab_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l173_c7_d70f_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l173_c7_d70f_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l173_c7_d70f_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l173_c7_d70f_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l177_c7_40ab_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l173_c7_d70f_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l173_c7_d70f_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l173_c7_d70f_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l177_c7_40ab_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l173_c7_d70f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l177_c11_70ec_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l177_c11_70ec_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l177_c11_70ec_return_output : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l177_c7_40ab_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l177_c7_40ab_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l177_c7_40ab_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l177_c7_40ab_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l177_c7_40ab_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l181_c7_daa1_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l177_c7_40ab_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l177_c7_40ab_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l177_c7_40ab_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l181_c7_daa1_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l177_c7_40ab_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l177_c7_40ab_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l177_c7_40ab_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l181_c7_daa1_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l177_c7_40ab_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l177_c7_40ab_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l177_c7_40ab_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l181_c7_daa1_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l177_c7_40ab_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l177_c7_40ab_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l177_c7_40ab_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l181_c7_daa1_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l177_c7_40ab_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l177_c7_40ab_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l177_c7_40ab_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l181_c7_daa1_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l177_c7_40ab_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l177_c7_40ab_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l177_c7_40ab_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l181_c7_daa1_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l177_c7_40ab_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l177_c7_40ab_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l177_c7_40ab_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l181_c7_daa1_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l177_c7_40ab_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l177_c7_40ab_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l177_c7_40ab_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_daa1_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l177_c7_40ab_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l177_c7_40ab_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l177_c7_40ab_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l177_c7_40ab_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l181_c7_daa1_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l177_c7_40ab_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l177_c7_40ab_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l177_c7_40ab_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l181_c7_daa1_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l177_c7_40ab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l181_c11_2a24_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l181_c11_2a24_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l181_c11_2a24_return_output : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l181_c7_daa1_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l181_c7_daa1_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l200_c7_3d80_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l181_c7_daa1_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l181_c7_daa1_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l181_c7_daa1_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l181_c7_daa1_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l181_c7_daa1_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l181_c7_daa1_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l181_c7_daa1_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l181_c7_daa1_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l181_c7_daa1_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l200_c7_3d80_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l181_c7_daa1_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l181_c7_daa1_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l193_c3_b65b_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l181_c7_daa1_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l181_c7_daa1_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l181_c7_daa1_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l181_c7_daa1_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l181_c7_daa1_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l181_c7_daa1_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l181_c7_daa1_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l181_c7_daa1_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l181_c7_daa1_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l181_c7_daa1_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l200_c7_3d80_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l181_c7_daa1_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_daa1_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_daa1_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_daa1_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l181_c7_daa1_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_88f7_uxn_device_h_l181_c7_daa1_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l181_c7_daa1_iffalse : device_out_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_fa3f_uxn_device_h_l181_c7_daa1_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l181_c7_daa1_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l181_c7_daa1_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l181_c7_daa1_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l181_c7_daa1_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l183_c11_251b_return_output : unsigned(3 downto 0);
 variable VAR_CONST_SR_7_uxn_device_h_l184_c25_7f51_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_7_uxn_device_h_l184_c25_7f51_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l184_c15_2826_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_6_uxn_device_h_l185_c21_2779_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_6_uxn_device_h_l185_c21_2779_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l185_c11_52c1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_5_uxn_device_h_l186_c22_bc50_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_5_uxn_device_h_l186_c22_bc50_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l186_c12_1b17_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l187_c22_647c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l187_c22_647c_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l187_c12_dfee_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_uxn_device_h_l188_c3_1e84 : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l188_c10_0b42_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l188_c10_0b42_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l188_c10_0b42_return_output : unsigned(3 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l189_c3_e8bc : unsigned(7 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l190_c3_0484 : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_device_h_l190_c22_9d61_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l190_c22_0e66_left : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_device_h_l190_c22_9d61_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l190_c22_0e66_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l190_c22_0e66_return_output : unsigned(16 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l193_c3_b65b_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l193_c3_b65b_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l193_c3_b65b_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_b65b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_b65b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_b65b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_b65b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l194_c4_d454_left : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l194_c12_7bcc_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l194_c12_7bcc_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l194_c12_7bcc_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l194_c12_7bcc_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l194_c4_d454_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l194_c4_d454_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l195_c4_8be7_left : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l195_c12_d7d9_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l195_c12_d7d9_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l195_c12_d7d9_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l195_c12_d7d9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l195_c4_8be7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l195_c4_8be7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l200_c11_adb3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l200_c11_adb3_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l200_c11_adb3_return_output : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l200_c7_3d80_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l200_c7_3d80_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l200_c7_3d80_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l200_c7_3d80_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l200_c7_3d80_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l200_c7_3d80_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l200_c7_3d80_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l200_c7_3d80_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l200_c7_3d80_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l200_c7_3d80_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l200_c7_3d80_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l211_c7_4ee6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l200_c7_3d80_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l200_c7_3d80_cond : unsigned(0 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l200_c7_3d80_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l205_c3_88f0 : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l200_c7_3d80_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l200_c7_3d80_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l200_c7_3d80_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l200_c7_3d80_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l200_c7_3d80_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l200_c7_3d80_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l211_c7_4ee6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l200_c7_3d80_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l200_c7_3d80_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l200_c7_3d80_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l200_c7_3d80_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l200_c7_3d80_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l200_c7_3d80_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l200_c7_3d80_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l200_c7_3d80_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l200_c7_3d80_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l211_c7_4ee6_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l200_c7_3d80_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l200_c7_3d80_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l200_c7_3d80_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l200_c7_3d80_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l211_c7_4ee6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l200_c7_3d80_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l200_c7_3d80_cond : unsigned(0 downto 0);
 variable VAR_uint8_0_0_uxn_device_h_l202_c15_f7d9_return_output : unsigned(0 downto 0);
 variable VAR_uint8_1_1_uxn_device_h_l203_c15_ee3b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l207_c21_f107_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l207_c21_f107_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l207_c21_f107_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l207_c34_b4e9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l207_c34_b4e9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l207_c34_b4e9_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l207_c44_4e7a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l207_c44_4e7a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l207_c44_4e7a_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l207_c21_f107_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l208_c31_9efa_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l208_c31_9efa_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l208_c31_9efa_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l208_c31_9efa_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l209_c26_8223_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l209_c26_8223_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l211_c11_48c2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l211_c11_48c2_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l211_c11_48c2_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l211_c7_4ee6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l211_c7_4ee6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l211_c7_4ee6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l211_c7_4ee6_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l211_c7_4ee6_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l211_c7_4ee6_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l211_c7_4ee6_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l211_c7_4ee6_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l211_c7_4ee6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l211_c7_4ee6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l211_c7_4ee6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l211_c7_4ee6_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l211_c7_4ee6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l211_c7_4ee6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l211_c7_4ee6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l213_c32_81e7_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l213_c32_81e7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l213_c32_81e7_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l215_c31_53fe_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l215_c31_53fe_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l215_c31_53fe_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l215_c21_3040_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l178_l174_DUPLICATE_aee5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l211_l193_DUPLICATE_499f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l209_l206_DUPLICATE_89fa_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l209_l206_DUPLICATE_89fa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l209_l206_DUPLICATE_89fa_return_output : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_x : unsigned(15 downto 0);
variable REG_VAR_y : unsigned(15 downto 0);
variable REG_VAR_ctrl : unsigned(7 downto 0);
variable REG_VAR_auto_advance : unsigned(7 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_color : unsigned(3 downto 0);
variable REG_VAR_ctrl_mode : unsigned(0 downto 0);
variable REG_VAR_flip_x : unsigned(0 downto 0);
variable REG_VAR_flip_y : unsigned(0 downto 0);
variable REG_VAR_layer : unsigned(0 downto 0);
variable REG_VAR_is_auto_x : unsigned(0 downto 0);
variable REG_VAR_is_auto_y : unsigned(0 downto 0);
variable REG_VAR_result : device_out_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_x := x;
  REG_VAR_y := y;
  REG_VAR_ctrl := ctrl;
  REG_VAR_auto_advance := auto_advance;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_color := color;
  REG_VAR_ctrl_mode := ctrl_mode;
  REG_VAR_flip_x := flip_x;
  REG_VAR_flip_y := flip_y;
  REG_VAR_layer := layer;
  REG_VAR_is_auto_x := is_auto_x;
  REG_VAR_is_auto_y := is_auto_y;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_device_h_l181_c11_2a24_right := to_unsigned(4, 12);
     VAR_result_device_ram_address_uxn_device_h_l189_c3_e8bc := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l170_c11_cd80_right := to_unsigned(1, 12);
     VAR_result_device_ram_address_MUX_uxn_device_h_l211_c7_4ee6_iftrue := to_unsigned(43, 8);
     VAR_MUX_uxn_device_h_l208_c31_9efa_iftrue := to_unsigned(41, 8);
     VAR_result_is_deo_done_MUX_uxn_device_h_l211_c7_4ee6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l207_c44_4e7a_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l164_c6_e588_right := to_unsigned(0, 12);
     VAR_result_is_vram_write_MUX_uxn_device_h_l200_c7_3d80_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l215_c31_53fe_right := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l208_c31_9efa_iffalse := to_unsigned(43, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l177_c11_70ec_right := to_unsigned(3, 12);
     VAR_MUX_uxn_device_h_l194_c12_7bcc_iffalse := to_unsigned(16, 8);
     VAR_BIN_OP_PLUS_uxn_device_h_l207_c34_b4e9_right := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l194_c12_7bcc_iftrue := to_unsigned(24, 8);
     VAR_MUX_uxn_device_h_l195_c12_d7d9_iftrue := to_unsigned(4, 8);
     VAR_result_u16_addr_uxn_device_h_l205_c3_88f0 := resize(to_unsigned(0, 1), 16);
     VAR_result_u16_addr_MUX_uxn_device_h_l200_c7_3d80_iftrue := VAR_result_u16_addr_uxn_device_h_l205_c3_88f0;
     VAR_BIN_OP_EQ_uxn_device_h_l211_c11_48c2_right := to_unsigned(6, 12);
     VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_b65b_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l195_c12_d7d9_iffalse := to_unsigned(0, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l200_c11_adb3_right := to_unsigned(5, 12);
     VAR_BIN_OP_EQ_uxn_device_h_l173_c11_bfd6_right := to_unsigned(2, 12);
     VAR_BIN_OP_AND_uxn_device_h_l188_c10_0b42_right := to_unsigned(3, 4);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_device_port := device_port;
     VAR_phase := phase;
     VAR_previous_device_ram_read := previous_device_ram_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_auto_advance_MUX_uxn_device_h_l164_c2_b08d_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l170_c7_1346_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l173_c7_d70f_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l177_c7_40ab_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l181_c7_daa1_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l200_c7_3d80_iffalse := auto_advance;
     VAR_color_MUX_uxn_device_h_l164_c2_b08d_iftrue := color;
     VAR_color_MUX_uxn_device_h_l170_c7_1346_iftrue := color;
     VAR_color_MUX_uxn_device_h_l173_c7_d70f_iftrue := color;
     VAR_color_MUX_uxn_device_h_l177_c7_40ab_iftrue := color;
     VAR_color_MUX_uxn_device_h_l181_c7_daa1_iffalse := color;
     VAR_ctrl_MUX_uxn_device_h_l164_c2_b08d_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l170_c7_1346_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l173_c7_d70f_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l177_c7_40ab_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l181_c7_daa1_iffalse := ctrl;
     VAR_ctrl_mode_MUX_uxn_device_h_l164_c2_b08d_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l170_c7_1346_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l173_c7_d70f_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l177_c7_40ab_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_daa1_iffalse := ctrl_mode;
     VAR_flip_x_MUX_uxn_device_h_l164_c2_b08d_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l170_c7_1346_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l173_c7_d70f_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l177_c7_40ab_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l181_c7_daa1_iffalse := flip_x;
     VAR_flip_y_MUX_uxn_device_h_l164_c2_b08d_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l170_c7_1346_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l173_c7_d70f_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l177_c7_40ab_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l181_c7_daa1_iffalse := flip_y;
     VAR_BIN_OP_AND_uxn_device_h_l213_c32_81e7_right := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l164_c2_b08d_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l170_c7_1346_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l173_c7_d70f_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l177_c7_40ab_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l181_c7_daa1_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l200_c7_3d80_iffalse := is_auto_x;
     VAR_BIN_OP_AND_uxn_device_h_l213_c32_81e7_left := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l164_c2_b08d_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l170_c7_1346_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l173_c7_d70f_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l177_c7_40ab_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l181_c7_daa1_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l200_c7_3d80_iffalse := is_auto_y;
     VAR_layer_MUX_uxn_device_h_l164_c2_b08d_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l170_c7_1346_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l173_c7_d70f_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l177_c7_40ab_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l181_c7_daa1_iffalse := layer;
     VAR_BIN_OP_EQ_uxn_device_h_l164_c6_e588_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l170_c11_cd80_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l173_c11_bfd6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l177_c11_70ec_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l181_c11_2a24_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l200_c11_adb3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l211_c11_48c2_left := VAR_phase;
     VAR_CONST_SR_4_uxn_device_h_l187_c22_647c_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_5_uxn_device_h_l186_c22_bc50_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_6_uxn_device_h_l185_c21_2779_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_7_uxn_device_h_l184_c25_7f51_x := VAR_previous_device_ram_read;
     VAR_auto_advance_MUX_uxn_device_h_l200_c7_3d80_iftrue := VAR_previous_device_ram_read;
     VAR_ctrl_MUX_uxn_device_h_l181_c7_daa1_iftrue := VAR_previous_device_ram_read;
     VAR_tmp8_MUX_uxn_device_h_l164_c2_b08d_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l170_c7_1346_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l173_c7_d70f_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l177_c7_40ab_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l181_c7_daa1_iffalse := tmp8;
     VAR_BIN_OP_PLUS_uxn_device_h_l190_c22_0e66_right := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l207_c34_b4e9_left := x;
     VAR_x_MUX_uxn_device_h_l164_c2_b08d_iftrue := x;
     VAR_x_MUX_uxn_device_h_l170_c7_1346_iftrue := x;
     VAR_x_MUX_uxn_device_h_l173_c7_d70f_iffalse := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l207_c44_4e7a_left := y;
     VAR_BIN_OP_PLUS_uxn_device_h_l215_c31_53fe_left := y;
     VAR_CONST_SL_8_uxn_device_h_l190_c22_9d61_x := y;
     VAR_y_MUX_uxn_device_h_l164_c2_b08d_iftrue := y;
     VAR_y_MUX_uxn_device_h_l170_c7_1346_iftrue := y;
     VAR_y_MUX_uxn_device_h_l173_c7_d70f_iftrue := y;
     VAR_y_MUX_uxn_device_h_l177_c7_40ab_iffalse := y;
     -- CAST_TO_uint16_t_uint8_t_uxn_device_h_l178_l174_DUPLICATE_aee5 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l178_l174_DUPLICATE_aee5_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_EQ[uxn_device_h_l164_c6_e588] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l164_c6_e588_left <= VAR_BIN_OP_EQ_uxn_device_h_l164_c6_e588_left;
     BIN_OP_EQ_uxn_device_h_l164_c6_e588_right <= VAR_BIN_OP_EQ_uxn_device_h_l164_c6_e588_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l164_c6_e588_return_output := BIN_OP_EQ_uxn_device_h_l164_c6_e588_return_output;

     -- BIN_OP_AND[uxn_device_h_l213_c32_81e7] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l213_c32_81e7_left <= VAR_BIN_OP_AND_uxn_device_h_l213_c32_81e7_left;
     BIN_OP_AND_uxn_device_h_l213_c32_81e7_right <= VAR_BIN_OP_AND_uxn_device_h_l213_c32_81e7_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l213_c32_81e7_return_output := BIN_OP_AND_uxn_device_h_l213_c32_81e7_return_output;

     -- CONST_SR_6[uxn_device_h_l185_c21_2779] LATENCY=0
     -- Inputs
     CONST_SR_6_uxn_device_h_l185_c21_2779_x <= VAR_CONST_SR_6_uxn_device_h_l185_c21_2779_x;
     -- Outputs
     VAR_CONST_SR_6_uxn_device_h_l185_c21_2779_return_output := CONST_SR_6_uxn_device_h_l185_c21_2779_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l170_c7_1346] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l170_c7_1346_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(43, 8));

     -- BIN_OP_PLUS[uxn_device_h_l207_c34_b4e9] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l207_c34_b4e9_left <= VAR_BIN_OP_PLUS_uxn_device_h_l207_c34_b4e9_left;
     BIN_OP_PLUS_uxn_device_h_l207_c34_b4e9_right <= VAR_BIN_OP_PLUS_uxn_device_h_l207_c34_b4e9_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l207_c34_b4e9_return_output := BIN_OP_PLUS_uxn_device_h_l207_c34_b4e9_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l207_c44_4e7a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l207_c44_4e7a_left <= VAR_BIN_OP_PLUS_uxn_device_h_l207_c44_4e7a_left;
     BIN_OP_PLUS_uxn_device_h_l207_c44_4e7a_right <= VAR_BIN_OP_PLUS_uxn_device_h_l207_c44_4e7a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l207_c44_4e7a_return_output := BIN_OP_PLUS_uxn_device_h_l207_c44_4e7a_return_output;

     -- CAST_TO_uint4_t[uxn_device_h_l183_c11_251b] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l183_c11_251b_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_EQ[uxn_device_h_l173_c11_bfd6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l173_c11_bfd6_left <= VAR_BIN_OP_EQ_uxn_device_h_l173_c11_bfd6_left;
     BIN_OP_EQ_uxn_device_h_l173_c11_bfd6_right <= VAR_BIN_OP_EQ_uxn_device_h_l173_c11_bfd6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l173_c11_bfd6_return_output := BIN_OP_EQ_uxn_device_h_l173_c11_bfd6_return_output;

     -- uint8_0_0[uxn_device_h_l202_c15_f7d9] LATENCY=0
     VAR_uint8_0_0_uxn_device_h_l202_c15_f7d9_return_output := uint8_0_0(
     VAR_previous_device_ram_read);

     -- CONST_SR_5[uxn_device_h_l186_c22_bc50] LATENCY=0
     -- Inputs
     CONST_SR_5_uxn_device_h_l186_c22_bc50_x <= VAR_CONST_SR_5_uxn_device_h_l186_c22_bc50_x;
     -- Outputs
     VAR_CONST_SR_5_uxn_device_h_l186_c22_bc50_return_output := CONST_SR_5_uxn_device_h_l186_c22_bc50_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l173_c7_d70f] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l173_c7_d70f_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(46, 8));

     -- result_u16_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d[uxn_device_h_l200_c7_3d80] LATENCY=0
     VAR_result_u16_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l200_c7_3d80_return_output := result.u16_addr;

     -- BIN_OP_EQ[uxn_device_h_l170_c11_cd80] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l170_c11_cd80_left <= VAR_BIN_OP_EQ_uxn_device_h_l170_c11_cd80_left;
     BIN_OP_EQ_uxn_device_h_l170_c11_cd80_right <= VAR_BIN_OP_EQ_uxn_device_h_l170_c11_cd80_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l170_c11_cd80_return_output := BIN_OP_EQ_uxn_device_h_l170_c11_cd80_return_output;

     -- result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_device_h_l211_c7_4ee6] LATENCY=0
     VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l211_c7_4ee6_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_device_h_l200_c11_adb3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l200_c11_adb3_left <= VAR_BIN_OP_EQ_uxn_device_h_l200_c11_adb3_left;
     BIN_OP_EQ_uxn_device_h_l200_c11_adb3_right <= VAR_BIN_OP_EQ_uxn_device_h_l200_c11_adb3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l200_c11_adb3_return_output := BIN_OP_EQ_uxn_device_h_l200_c11_adb3_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_device_h_l200_c7_3d80] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l200_c7_3d80_return_output := result.is_vram_write;

     -- CONST_SR_7[uxn_device_h_l184_c25_7f51] LATENCY=0
     -- Inputs
     CONST_SR_7_uxn_device_h_l184_c25_7f51_x <= VAR_CONST_SR_7_uxn_device_h_l184_c25_7f51_x;
     -- Outputs
     VAR_CONST_SR_7_uxn_device_h_l184_c25_7f51_return_output := CONST_SR_7_uxn_device_h_l184_c25_7f51_return_output;

     -- CONST_SR_4[uxn_device_h_l187_c22_647c] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_device_h_l187_c22_647c_x <= VAR_CONST_SR_4_uxn_device_h_l187_c22_647c_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_device_h_l187_c22_647c_return_output := CONST_SR_4_uxn_device_h_l187_c22_647c_return_output;

     -- BIN_OP_EQ[uxn_device_h_l211_c11_48c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l211_c11_48c2_left <= VAR_BIN_OP_EQ_uxn_device_h_l211_c11_48c2_left;
     BIN_OP_EQ_uxn_device_h_l211_c11_48c2_right <= VAR_BIN_OP_EQ_uxn_device_h_l211_c11_48c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l211_c11_48c2_return_output := BIN_OP_EQ_uxn_device_h_l211_c11_48c2_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l215_c31_53fe] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l215_c31_53fe_left <= VAR_BIN_OP_PLUS_uxn_device_h_l215_c31_53fe_left;
     BIN_OP_PLUS_uxn_device_h_l215_c31_53fe_right <= VAR_BIN_OP_PLUS_uxn_device_h_l215_c31_53fe_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l215_c31_53fe_return_output := BIN_OP_PLUS_uxn_device_h_l215_c31_53fe_return_output;

     -- CONST_SL_8[uxn_device_h_l190_c22_9d61] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_device_h_l190_c22_9d61_x <= VAR_CONST_SL_8_uxn_device_h_l190_c22_9d61_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_device_h_l190_c22_9d61_return_output := CONST_SL_8_uxn_device_h_l190_c22_9d61_return_output;

     -- BIN_OP_EQ[uxn_device_h_l177_c11_70ec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l177_c11_70ec_left <= VAR_BIN_OP_EQ_uxn_device_h_l177_c11_70ec_left;
     BIN_OP_EQ_uxn_device_h_l177_c11_70ec_right <= VAR_BIN_OP_EQ_uxn_device_h_l177_c11_70ec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l177_c11_70ec_return_output := BIN_OP_EQ_uxn_device_h_l177_c11_70ec_return_output;

     -- BIN_OP_EQ[uxn_device_h_l181_c11_2a24] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l181_c11_2a24_left <= VAR_BIN_OP_EQ_uxn_device_h_l181_c11_2a24_left;
     BIN_OP_EQ_uxn_device_h_l181_c11_2a24_right <= VAR_BIN_OP_EQ_uxn_device_h_l181_c11_2a24_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l181_c11_2a24_return_output := BIN_OP_EQ_uxn_device_h_l181_c11_2a24_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l211_l193_DUPLICATE_499f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l211_l193_DUPLICATE_499f_return_output := result.is_deo_done;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l177_c7_40ab] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l177_c7_40ab_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(38, 8));

     -- uint8_1_1[uxn_device_h_l203_c15_ee3b] LATENCY=0
     VAR_uint8_1_1_uxn_device_h_l203_c15_ee3b_return_output := uint8_1_1(
     VAR_previous_device_ram_read);

     -- result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_device_h_l211_c7_4ee6] LATENCY=0
     VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l211_c7_4ee6_return_output := result.is_device_ram_write;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba[uxn_device_h_l164_c2_b08d] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l164_c2_b08d_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_56ba(
     result,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(41, 8),
     to_unsigned(0, 1));

     -- result_device_ram_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_device_h_l211_c7_4ee6] LATENCY=0
     VAR_result_device_ram_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l211_c7_4ee6_return_output := result.device_ram_address;

     -- Submodule level 1
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l211_c7_4ee6_iftrue := VAR_BIN_OP_AND_uxn_device_h_l213_c32_81e7_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l164_c2_b08d_cond := VAR_BIN_OP_EQ_uxn_device_h_l164_c6_e588_return_output;
     VAR_color_MUX_uxn_device_h_l164_c2_b08d_cond := VAR_BIN_OP_EQ_uxn_device_h_l164_c6_e588_return_output;
     VAR_ctrl_MUX_uxn_device_h_l164_c2_b08d_cond := VAR_BIN_OP_EQ_uxn_device_h_l164_c6_e588_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l164_c2_b08d_cond := VAR_BIN_OP_EQ_uxn_device_h_l164_c6_e588_return_output;
     VAR_flip_x_MUX_uxn_device_h_l164_c2_b08d_cond := VAR_BIN_OP_EQ_uxn_device_h_l164_c6_e588_return_output;
     VAR_flip_y_MUX_uxn_device_h_l164_c2_b08d_cond := VAR_BIN_OP_EQ_uxn_device_h_l164_c6_e588_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l164_c2_b08d_cond := VAR_BIN_OP_EQ_uxn_device_h_l164_c6_e588_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l164_c2_b08d_cond := VAR_BIN_OP_EQ_uxn_device_h_l164_c6_e588_return_output;
     VAR_layer_MUX_uxn_device_h_l164_c2_b08d_cond := VAR_BIN_OP_EQ_uxn_device_h_l164_c6_e588_return_output;
     VAR_result_MUX_uxn_device_h_l164_c2_b08d_cond := VAR_BIN_OP_EQ_uxn_device_h_l164_c6_e588_return_output;
     VAR_tmp8_MUX_uxn_device_h_l164_c2_b08d_cond := VAR_BIN_OP_EQ_uxn_device_h_l164_c6_e588_return_output;
     VAR_x_MUX_uxn_device_h_l164_c2_b08d_cond := VAR_BIN_OP_EQ_uxn_device_h_l164_c6_e588_return_output;
     VAR_y_MUX_uxn_device_h_l164_c2_b08d_cond := VAR_BIN_OP_EQ_uxn_device_h_l164_c6_e588_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l170_c7_1346_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c11_cd80_return_output;
     VAR_color_MUX_uxn_device_h_l170_c7_1346_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c11_cd80_return_output;
     VAR_ctrl_MUX_uxn_device_h_l170_c7_1346_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c11_cd80_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l170_c7_1346_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c11_cd80_return_output;
     VAR_flip_x_MUX_uxn_device_h_l170_c7_1346_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c11_cd80_return_output;
     VAR_flip_y_MUX_uxn_device_h_l170_c7_1346_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c11_cd80_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l170_c7_1346_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c11_cd80_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l170_c7_1346_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c11_cd80_return_output;
     VAR_layer_MUX_uxn_device_h_l170_c7_1346_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c11_cd80_return_output;
     VAR_result_MUX_uxn_device_h_l170_c7_1346_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c11_cd80_return_output;
     VAR_tmp8_MUX_uxn_device_h_l170_c7_1346_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c11_cd80_return_output;
     VAR_x_MUX_uxn_device_h_l170_c7_1346_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c11_cd80_return_output;
     VAR_y_MUX_uxn_device_h_l170_c7_1346_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c11_cd80_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l173_c7_d70f_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c11_bfd6_return_output;
     VAR_color_MUX_uxn_device_h_l173_c7_d70f_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c11_bfd6_return_output;
     VAR_ctrl_MUX_uxn_device_h_l173_c7_d70f_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c11_bfd6_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l173_c7_d70f_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c11_bfd6_return_output;
     VAR_flip_x_MUX_uxn_device_h_l173_c7_d70f_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c11_bfd6_return_output;
     VAR_flip_y_MUX_uxn_device_h_l173_c7_d70f_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c11_bfd6_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l173_c7_d70f_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c11_bfd6_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l173_c7_d70f_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c11_bfd6_return_output;
     VAR_layer_MUX_uxn_device_h_l173_c7_d70f_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c11_bfd6_return_output;
     VAR_result_MUX_uxn_device_h_l173_c7_d70f_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c11_bfd6_return_output;
     VAR_tmp8_MUX_uxn_device_h_l173_c7_d70f_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c11_bfd6_return_output;
     VAR_x_MUX_uxn_device_h_l173_c7_d70f_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c11_bfd6_return_output;
     VAR_y_MUX_uxn_device_h_l173_c7_d70f_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c11_bfd6_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l177_c7_40ab_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_70ec_return_output;
     VAR_color_MUX_uxn_device_h_l177_c7_40ab_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_70ec_return_output;
     VAR_ctrl_MUX_uxn_device_h_l177_c7_40ab_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_70ec_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l177_c7_40ab_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_70ec_return_output;
     VAR_flip_x_MUX_uxn_device_h_l177_c7_40ab_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_70ec_return_output;
     VAR_flip_y_MUX_uxn_device_h_l177_c7_40ab_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_70ec_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l177_c7_40ab_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_70ec_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l177_c7_40ab_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_70ec_return_output;
     VAR_layer_MUX_uxn_device_h_l177_c7_40ab_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_70ec_return_output;
     VAR_result_MUX_uxn_device_h_l177_c7_40ab_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_70ec_return_output;
     VAR_tmp8_MUX_uxn_device_h_l177_c7_40ab_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_70ec_return_output;
     VAR_y_MUX_uxn_device_h_l177_c7_40ab_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_70ec_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l181_c7_daa1_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_2a24_return_output;
     VAR_color_MUX_uxn_device_h_l181_c7_daa1_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_2a24_return_output;
     VAR_ctrl_MUX_uxn_device_h_l181_c7_daa1_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_2a24_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_daa1_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_2a24_return_output;
     VAR_flip_x_MUX_uxn_device_h_l181_c7_daa1_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_2a24_return_output;
     VAR_flip_y_MUX_uxn_device_h_l181_c7_daa1_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_2a24_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l181_c7_daa1_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_2a24_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l181_c7_daa1_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_2a24_return_output;
     VAR_layer_MUX_uxn_device_h_l181_c7_daa1_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_2a24_return_output;
     VAR_result_MUX_uxn_device_h_l181_c7_daa1_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_2a24_return_output;
     VAR_tmp8_MUX_uxn_device_h_l181_c7_daa1_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_2a24_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l200_c7_3d80_cond := VAR_BIN_OP_EQ_uxn_device_h_l200_c11_adb3_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l200_c7_3d80_cond := VAR_BIN_OP_EQ_uxn_device_h_l200_c11_adb3_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l200_c7_3d80_cond := VAR_BIN_OP_EQ_uxn_device_h_l200_c11_adb3_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l200_c7_3d80_cond := VAR_BIN_OP_EQ_uxn_device_h_l200_c11_adb3_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l200_c7_3d80_cond := VAR_BIN_OP_EQ_uxn_device_h_l200_c11_adb3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l200_c7_3d80_cond := VAR_BIN_OP_EQ_uxn_device_h_l200_c11_adb3_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l200_c7_3d80_cond := VAR_BIN_OP_EQ_uxn_device_h_l200_c11_adb3_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l200_c7_3d80_cond := VAR_BIN_OP_EQ_uxn_device_h_l200_c11_adb3_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l200_c7_3d80_cond := VAR_BIN_OP_EQ_uxn_device_h_l200_c11_adb3_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l211_c7_4ee6_cond := VAR_BIN_OP_EQ_uxn_device_h_l211_c11_48c2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l211_c7_4ee6_cond := VAR_BIN_OP_EQ_uxn_device_h_l211_c11_48c2_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l211_c7_4ee6_cond := VAR_BIN_OP_EQ_uxn_device_h_l211_c11_48c2_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l211_c7_4ee6_cond := VAR_BIN_OP_EQ_uxn_device_h_l211_c11_48c2_return_output;
     VAR_MUX_uxn_device_h_l207_c21_f107_iftrue := resize(VAR_BIN_OP_PLUS_uxn_device_h_l207_c34_b4e9_return_output, 8);
     VAR_MUX_uxn_device_h_l207_c21_f107_iffalse := resize(VAR_BIN_OP_PLUS_uxn_device_h_l207_c44_4e7a_return_output, 8);
     VAR_x_MUX_uxn_device_h_l173_c7_d70f_iftrue := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l178_l174_DUPLICATE_aee5_return_output;
     VAR_y_MUX_uxn_device_h_l177_c7_40ab_iftrue := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l178_l174_DUPLICATE_aee5_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l188_c10_0b42_left := VAR_CAST_TO_uint4_t_uxn_device_h_l183_c11_251b_return_output;
     VAR_color_MUX_uxn_device_h_l181_c7_daa1_iftrue := VAR_CAST_TO_uint4_t_uxn_device_h_l183_c11_251b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_b65b_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l211_l193_DUPLICATE_499f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l211_c7_4ee6_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l211_l193_DUPLICATE_499f_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l190_c22_0e66_left := VAR_CONST_SL_8_uxn_device_h_l190_c22_9d61_return_output;
     VAR_result_MUX_uxn_device_h_l170_c7_1346_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l170_c7_1346_return_output;
     VAR_result_MUX_uxn_device_h_l173_c7_d70f_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l173_c7_d70f_return_output;
     VAR_result_MUX_uxn_device_h_l177_c7_40ab_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l177_c7_40ab_return_output;
     VAR_result_MUX_uxn_device_h_l164_c2_b08d_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l164_c2_b08d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l211_c7_4ee6_iffalse := VAR_result_device_ram_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l211_c7_4ee6_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l211_c7_4ee6_iffalse := VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l211_c7_4ee6_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l200_c7_3d80_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l200_c7_3d80_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l200_c7_3d80_iffalse := VAR_result_u16_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l200_c7_3d80_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l211_c7_4ee6_iffalse := VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l211_c7_4ee6_return_output;
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l209_l206_DUPLICATE_89fa_left := VAR_uint8_0_0_uxn_device_h_l202_c15_f7d9_return_output;
     VAR_MUX_uxn_device_h_l207_c21_f107_cond := VAR_uint8_0_0_uxn_device_h_l202_c15_f7d9_return_output;
     VAR_MUX_uxn_device_h_l208_c31_9efa_cond := VAR_uint8_0_0_uxn_device_h_l202_c15_f7d9_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l200_c7_3d80_iftrue := VAR_uint8_0_0_uxn_device_h_l202_c15_f7d9_return_output;
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l209_l206_DUPLICATE_89fa_right := VAR_uint8_1_1_uxn_device_h_l203_c15_ee3b_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l200_c7_3d80_iftrue := VAR_uint8_1_1_uxn_device_h_l203_c15_ee3b_return_output;
     -- CAST_TO_uint8_t[uxn_device_h_l215_c21_3040] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l215_c21_3040_return_output := CAST_TO_uint8_t_uint17_t(
     VAR_BIN_OP_PLUS_uxn_device_h_l215_c31_53fe_return_output);

     -- color_MUX[uxn_device_h_l181_c7_daa1] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l181_c7_daa1_cond <= VAR_color_MUX_uxn_device_h_l181_c7_daa1_cond;
     color_MUX_uxn_device_h_l181_c7_daa1_iftrue <= VAR_color_MUX_uxn_device_h_l181_c7_daa1_iftrue;
     color_MUX_uxn_device_h_l181_c7_daa1_iffalse <= VAR_color_MUX_uxn_device_h_l181_c7_daa1_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l181_c7_daa1_return_output := color_MUX_uxn_device_h_l181_c7_daa1_return_output;

     -- auto_advance_MUX[uxn_device_h_l200_c7_3d80] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l200_c7_3d80_cond <= VAR_auto_advance_MUX_uxn_device_h_l200_c7_3d80_cond;
     auto_advance_MUX_uxn_device_h_l200_c7_3d80_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l200_c7_3d80_iftrue;
     auto_advance_MUX_uxn_device_h_l200_c7_3d80_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l200_c7_3d80_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l200_c7_3d80_return_output := auto_advance_MUX_uxn_device_h_l200_c7_3d80_return_output;

     -- y_MUX[uxn_device_h_l177_c7_40ab] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l177_c7_40ab_cond <= VAR_y_MUX_uxn_device_h_l177_c7_40ab_cond;
     y_MUX_uxn_device_h_l177_c7_40ab_iftrue <= VAR_y_MUX_uxn_device_h_l177_c7_40ab_iftrue;
     y_MUX_uxn_device_h_l177_c7_40ab_iffalse <= VAR_y_MUX_uxn_device_h_l177_c7_40ab_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l177_c7_40ab_return_output := y_MUX_uxn_device_h_l177_c7_40ab_return_output;

     -- result_u16_addr_MUX[uxn_device_h_l200_c7_3d80] LATENCY=0
     -- Inputs
     result_u16_addr_MUX_uxn_device_h_l200_c7_3d80_cond <= VAR_result_u16_addr_MUX_uxn_device_h_l200_c7_3d80_cond;
     result_u16_addr_MUX_uxn_device_h_l200_c7_3d80_iftrue <= VAR_result_u16_addr_MUX_uxn_device_h_l200_c7_3d80_iftrue;
     result_u16_addr_MUX_uxn_device_h_l200_c7_3d80_iffalse <= VAR_result_u16_addr_MUX_uxn_device_h_l200_c7_3d80_iffalse;
     -- Outputs
     VAR_result_u16_addr_MUX_uxn_device_h_l200_c7_3d80_return_output := result_u16_addr_MUX_uxn_device_h_l200_c7_3d80_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l185_c11_52c1] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l185_c11_52c1_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_6_uxn_device_h_l185_c21_2779_return_output);

     -- CAST_TO_uint1_t[uxn_device_h_l184_c15_2826] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l184_c15_2826_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_7_uxn_device_h_l184_c25_7f51_return_output);

     -- result_is_device_ram_write_MUX[uxn_device_h_l211_c7_4ee6] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l211_c7_4ee6_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l211_c7_4ee6_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l211_c7_4ee6_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l211_c7_4ee6_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l211_c7_4ee6_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l211_c7_4ee6_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l211_c7_4ee6_return_output := result_is_device_ram_write_MUX_uxn_device_h_l211_c7_4ee6_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l211_c7_4ee6] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l211_c7_4ee6_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l211_c7_4ee6_cond;
     result_is_deo_done_MUX_uxn_device_h_l211_c7_4ee6_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l211_c7_4ee6_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l211_c7_4ee6_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l211_c7_4ee6_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l211_c7_4ee6_return_output := result_is_deo_done_MUX_uxn_device_h_l211_c7_4ee6_return_output;

     -- MUX[uxn_device_h_l207_c21_f107] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l207_c21_f107_cond <= VAR_MUX_uxn_device_h_l207_c21_f107_cond;
     MUX_uxn_device_h_l207_c21_f107_iftrue <= VAR_MUX_uxn_device_h_l207_c21_f107_iftrue;
     MUX_uxn_device_h_l207_c21_f107_iffalse <= VAR_MUX_uxn_device_h_l207_c21_f107_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l207_c21_f107_return_output := MUX_uxn_device_h_l207_c21_f107_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l186_c12_1b17] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l186_c12_1b17_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_5_uxn_device_h_l186_c22_bc50_return_output);

     -- result_is_vram_write_MUX[uxn_device_h_l200_c7_3d80] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l200_c7_3d80_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l200_c7_3d80_cond;
     result_is_vram_write_MUX_uxn_device_h_l200_c7_3d80_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l200_c7_3d80_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l200_c7_3d80_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l200_c7_3d80_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l200_c7_3d80_return_output := result_is_vram_write_MUX_uxn_device_h_l200_c7_3d80_return_output;

     -- ctrl_MUX[uxn_device_h_l181_c7_daa1] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l181_c7_daa1_cond <= VAR_ctrl_MUX_uxn_device_h_l181_c7_daa1_cond;
     ctrl_MUX_uxn_device_h_l181_c7_daa1_iftrue <= VAR_ctrl_MUX_uxn_device_h_l181_c7_daa1_iftrue;
     ctrl_MUX_uxn_device_h_l181_c7_daa1_iffalse <= VAR_ctrl_MUX_uxn_device_h_l181_c7_daa1_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l181_c7_daa1_return_output := ctrl_MUX_uxn_device_h_l181_c7_daa1_return_output;

     -- BIN_OP_AND[uxn_device_h_l188_c10_0b42] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l188_c10_0b42_left <= VAR_BIN_OP_AND_uxn_device_h_l188_c10_0b42_left;
     BIN_OP_AND_uxn_device_h_l188_c10_0b42_right <= VAR_BIN_OP_AND_uxn_device_h_l188_c10_0b42_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l188_c10_0b42_return_output := BIN_OP_AND_uxn_device_h_l188_c10_0b42_return_output;

     -- BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l209_l206_DUPLICATE_89fa LATENCY=0
     -- Inputs
     BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l209_l206_DUPLICATE_89fa_left <= VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l209_l206_DUPLICATE_89fa_left;
     BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l209_l206_DUPLICATE_89fa_right <= VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l209_l206_DUPLICATE_89fa_right;
     -- Outputs
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l209_l206_DUPLICATE_89fa_return_output := BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l209_l206_DUPLICATE_89fa_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l187_c12_dfee] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l187_c12_dfee_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_4_uxn_device_h_l187_c22_647c_return_output);

     -- is_auto_x_MUX[uxn_device_h_l200_c7_3d80] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l200_c7_3d80_cond <= VAR_is_auto_x_MUX_uxn_device_h_l200_c7_3d80_cond;
     is_auto_x_MUX_uxn_device_h_l200_c7_3d80_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l200_c7_3d80_iftrue;
     is_auto_x_MUX_uxn_device_h_l200_c7_3d80_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l200_c7_3d80_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l200_c7_3d80_return_output := is_auto_x_MUX_uxn_device_h_l200_c7_3d80_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l211_c7_4ee6] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l211_c7_4ee6_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l211_c7_4ee6_cond;
     result_device_ram_address_MUX_uxn_device_h_l211_c7_4ee6_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l211_c7_4ee6_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l211_c7_4ee6_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l211_c7_4ee6_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l211_c7_4ee6_return_output := result_device_ram_address_MUX_uxn_device_h_l211_c7_4ee6_return_output;

     -- is_auto_y_MUX[uxn_device_h_l200_c7_3d80] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l200_c7_3d80_cond <= VAR_is_auto_y_MUX_uxn_device_h_l200_c7_3d80_cond;
     is_auto_y_MUX_uxn_device_h_l200_c7_3d80_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l200_c7_3d80_iftrue;
     is_auto_y_MUX_uxn_device_h_l200_c7_3d80_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l200_c7_3d80_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l200_c7_3d80_return_output := is_auto_y_MUX_uxn_device_h_l200_c7_3d80_return_output;

     -- MUX[uxn_device_h_l208_c31_9efa] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l208_c31_9efa_cond <= VAR_MUX_uxn_device_h_l208_c31_9efa_cond;
     MUX_uxn_device_h_l208_c31_9efa_iftrue <= VAR_MUX_uxn_device_h_l208_c31_9efa_iftrue;
     MUX_uxn_device_h_l208_c31_9efa_iffalse <= VAR_MUX_uxn_device_h_l208_c31_9efa_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l208_c31_9efa_return_output := MUX_uxn_device_h_l208_c31_9efa_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l190_c22_0e66] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l190_c22_0e66_left <= VAR_BIN_OP_PLUS_uxn_device_h_l190_c22_0e66_left;
     BIN_OP_PLUS_uxn_device_h_l190_c22_0e66_right <= VAR_BIN_OP_PLUS_uxn_device_h_l190_c22_0e66_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l190_c22_0e66_return_output := BIN_OP_PLUS_uxn_device_h_l190_c22_0e66_return_output;

     -- x_MUX[uxn_device_h_l173_c7_d70f] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l173_c7_d70f_cond <= VAR_x_MUX_uxn_device_h_l173_c7_d70f_cond;
     x_MUX_uxn_device_h_l173_c7_d70f_iftrue <= VAR_x_MUX_uxn_device_h_l173_c7_d70f_iftrue;
     x_MUX_uxn_device_h_l173_c7_d70f_iffalse <= VAR_x_MUX_uxn_device_h_l173_c7_d70f_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l173_c7_d70f_return_output := x_MUX_uxn_device_h_l173_c7_d70f_return_output;

     -- Submodule level 2
     VAR_tmp8_uxn_device_h_l188_c3_1e84 := resize(VAR_BIN_OP_AND_uxn_device_h_l188_c10_0b42_return_output, 8);
     VAR_UNARY_OP_NOT_uxn_device_h_l209_c26_8223_expr := VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l209_l206_DUPLICATE_89fa_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l200_c7_3d80_iftrue := VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l209_l206_DUPLICATE_89fa_return_output;
     VAR_result_u16_addr_uxn_device_h_l190_c3_0484 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l190_c22_0e66_return_output, 16);
     VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_daa1_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l184_c15_2826_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_b65b_cond := VAR_CAST_TO_uint1_t_uxn_device_h_l184_c15_2826_return_output;
     VAR_tmp8_MUX_uxn_device_h_l193_c3_b65b_cond := VAR_CAST_TO_uint1_t_uxn_device_h_l184_c15_2826_return_output;
     VAR_layer_MUX_uxn_device_h_l181_c7_daa1_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l185_c11_52c1_return_output;
     VAR_MUX_uxn_device_h_l195_c12_d7d9_cond := VAR_CAST_TO_uint1_t_uxn_device_h_l186_c12_1b17_return_output;
     VAR_flip_y_MUX_uxn_device_h_l181_c7_daa1_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l186_c12_1b17_return_output;
     VAR_MUX_uxn_device_h_l194_c12_7bcc_cond := VAR_CAST_TO_uint1_t_uxn_device_h_l187_c12_dfee_return_output;
     VAR_flip_x_MUX_uxn_device_h_l181_c7_daa1_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l187_c12_dfee_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l211_c7_4ee6_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l215_c21_3040_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l200_c7_3d80_iftrue := VAR_MUX_uxn_device_h_l207_c21_f107_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l200_c7_3d80_iftrue := VAR_MUX_uxn_device_h_l208_c31_9efa_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l181_c7_daa1_iffalse := VAR_auto_advance_MUX_uxn_device_h_l200_c7_3d80_return_output;
     VAR_color_MUX_uxn_device_h_l177_c7_40ab_iffalse := VAR_color_MUX_uxn_device_h_l181_c7_daa1_return_output;
     VAR_ctrl_MUX_uxn_device_h_l177_c7_40ab_iffalse := VAR_ctrl_MUX_uxn_device_h_l181_c7_daa1_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l181_c7_daa1_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l200_c7_3d80_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l181_c7_daa1_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l200_c7_3d80_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l200_c7_3d80_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l211_c7_4ee6_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l200_c7_3d80_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l211_c7_4ee6_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l200_c7_3d80_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l211_c7_4ee6_return_output;
     VAR_x_MUX_uxn_device_h_l170_c7_1346_iffalse := VAR_x_MUX_uxn_device_h_l173_c7_d70f_return_output;
     VAR_y_MUX_uxn_device_h_l173_c7_d70f_iffalse := VAR_y_MUX_uxn_device_h_l177_c7_40ab_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l194_c4_d454_left := VAR_tmp8_uxn_device_h_l188_c3_1e84;
     VAR_tmp8_MUX_uxn_device_h_l193_c3_b65b_iffalse := VAR_tmp8_uxn_device_h_l188_c3_1e84;
     -- is_auto_y_MUX[uxn_device_h_l181_c7_daa1] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l181_c7_daa1_cond <= VAR_is_auto_y_MUX_uxn_device_h_l181_c7_daa1_cond;
     is_auto_y_MUX_uxn_device_h_l181_c7_daa1_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l181_c7_daa1_iftrue;
     is_auto_y_MUX_uxn_device_h_l181_c7_daa1_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l181_c7_daa1_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l181_c7_daa1_return_output := is_auto_y_MUX_uxn_device_h_l181_c7_daa1_return_output;

     -- MUX[uxn_device_h_l195_c12_d7d9] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l195_c12_d7d9_cond <= VAR_MUX_uxn_device_h_l195_c12_d7d9_cond;
     MUX_uxn_device_h_l195_c12_d7d9_iftrue <= VAR_MUX_uxn_device_h_l195_c12_d7d9_iftrue;
     MUX_uxn_device_h_l195_c12_d7d9_iffalse <= VAR_MUX_uxn_device_h_l195_c12_d7d9_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l195_c12_d7d9_return_output := MUX_uxn_device_h_l195_c12_d7d9_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l193_c3_b65b] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l193_c3_b65b_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_b65b_cond;
     result_is_deo_done_MUX_uxn_device_h_l193_c3_b65b_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_b65b_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l193_c3_b65b_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_b65b_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_b65b_return_output := result_is_deo_done_MUX_uxn_device_h_l193_c3_b65b_return_output;

     -- y_MUX[uxn_device_h_l173_c7_d70f] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l173_c7_d70f_cond <= VAR_y_MUX_uxn_device_h_l173_c7_d70f_cond;
     y_MUX_uxn_device_h_l173_c7_d70f_iftrue <= VAR_y_MUX_uxn_device_h_l173_c7_d70f_iftrue;
     y_MUX_uxn_device_h_l173_c7_d70f_iffalse <= VAR_y_MUX_uxn_device_h_l173_c7_d70f_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l173_c7_d70f_return_output := y_MUX_uxn_device_h_l173_c7_d70f_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l200_c7_3d80] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l200_c7_3d80_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l200_c7_3d80_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l200_c7_3d80_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l200_c7_3d80_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l200_c7_3d80_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l200_c7_3d80_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l200_c7_3d80_return_output := result_is_device_ram_write_MUX_uxn_device_h_l200_c7_3d80_return_output;

     -- layer_MUX[uxn_device_h_l181_c7_daa1] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l181_c7_daa1_cond <= VAR_layer_MUX_uxn_device_h_l181_c7_daa1_cond;
     layer_MUX_uxn_device_h_l181_c7_daa1_iftrue <= VAR_layer_MUX_uxn_device_h_l181_c7_daa1_iftrue;
     layer_MUX_uxn_device_h_l181_c7_daa1_iffalse <= VAR_layer_MUX_uxn_device_h_l181_c7_daa1_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l181_c7_daa1_return_output := layer_MUX_uxn_device_h_l181_c7_daa1_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l181_c7_daa1] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l181_c7_daa1_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_daa1_cond;
     ctrl_mode_MUX_uxn_device_h_l181_c7_daa1_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_daa1_iftrue;
     ctrl_mode_MUX_uxn_device_h_l181_c7_daa1_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_daa1_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_daa1_return_output := ctrl_mode_MUX_uxn_device_h_l181_c7_daa1_return_output;

     -- flip_x_MUX[uxn_device_h_l181_c7_daa1] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l181_c7_daa1_cond <= VAR_flip_x_MUX_uxn_device_h_l181_c7_daa1_cond;
     flip_x_MUX_uxn_device_h_l181_c7_daa1_iftrue <= VAR_flip_x_MUX_uxn_device_h_l181_c7_daa1_iftrue;
     flip_x_MUX_uxn_device_h_l181_c7_daa1_iffalse <= VAR_flip_x_MUX_uxn_device_h_l181_c7_daa1_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l181_c7_daa1_return_output := flip_x_MUX_uxn_device_h_l181_c7_daa1_return_output;

     -- UNARY_OP_NOT[uxn_device_h_l209_c26_8223] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_device_h_l209_c26_8223_expr <= VAR_UNARY_OP_NOT_uxn_device_h_l209_c26_8223_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_device_h_l209_c26_8223_return_output := UNARY_OP_NOT_uxn_device_h_l209_c26_8223_return_output;

     -- color_MUX[uxn_device_h_l177_c7_40ab] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l177_c7_40ab_cond <= VAR_color_MUX_uxn_device_h_l177_c7_40ab_cond;
     color_MUX_uxn_device_h_l177_c7_40ab_iftrue <= VAR_color_MUX_uxn_device_h_l177_c7_40ab_iftrue;
     color_MUX_uxn_device_h_l177_c7_40ab_iffalse <= VAR_color_MUX_uxn_device_h_l177_c7_40ab_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l177_c7_40ab_return_output := color_MUX_uxn_device_h_l177_c7_40ab_return_output;

     -- x_MUX[uxn_device_h_l170_c7_1346] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l170_c7_1346_cond <= VAR_x_MUX_uxn_device_h_l170_c7_1346_cond;
     x_MUX_uxn_device_h_l170_c7_1346_iftrue <= VAR_x_MUX_uxn_device_h_l170_c7_1346_iftrue;
     x_MUX_uxn_device_h_l170_c7_1346_iffalse <= VAR_x_MUX_uxn_device_h_l170_c7_1346_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l170_c7_1346_return_output := x_MUX_uxn_device_h_l170_c7_1346_return_output;

     -- is_auto_x_MUX[uxn_device_h_l181_c7_daa1] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l181_c7_daa1_cond <= VAR_is_auto_x_MUX_uxn_device_h_l181_c7_daa1_cond;
     is_auto_x_MUX_uxn_device_h_l181_c7_daa1_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l181_c7_daa1_iftrue;
     is_auto_x_MUX_uxn_device_h_l181_c7_daa1_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l181_c7_daa1_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l181_c7_daa1_return_output := is_auto_x_MUX_uxn_device_h_l181_c7_daa1_return_output;

     -- ctrl_MUX[uxn_device_h_l177_c7_40ab] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l177_c7_40ab_cond <= VAR_ctrl_MUX_uxn_device_h_l177_c7_40ab_cond;
     ctrl_MUX_uxn_device_h_l177_c7_40ab_iftrue <= VAR_ctrl_MUX_uxn_device_h_l177_c7_40ab_iftrue;
     ctrl_MUX_uxn_device_h_l177_c7_40ab_iffalse <= VAR_ctrl_MUX_uxn_device_h_l177_c7_40ab_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l177_c7_40ab_return_output := ctrl_MUX_uxn_device_h_l177_c7_40ab_return_output;

     -- result_u8_value_MUX[uxn_device_h_l211_c7_4ee6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l211_c7_4ee6_cond <= VAR_result_u8_value_MUX_uxn_device_h_l211_c7_4ee6_cond;
     result_u8_value_MUX_uxn_device_h_l211_c7_4ee6_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l211_c7_4ee6_iftrue;
     result_u8_value_MUX_uxn_device_h_l211_c7_4ee6_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l211_c7_4ee6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l211_c7_4ee6_return_output := result_u8_value_MUX_uxn_device_h_l211_c7_4ee6_return_output;

     -- MUX[uxn_device_h_l194_c12_7bcc] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l194_c12_7bcc_cond <= VAR_MUX_uxn_device_h_l194_c12_7bcc_cond;
     MUX_uxn_device_h_l194_c12_7bcc_iftrue <= VAR_MUX_uxn_device_h_l194_c12_7bcc_iftrue;
     MUX_uxn_device_h_l194_c12_7bcc_iffalse <= VAR_MUX_uxn_device_h_l194_c12_7bcc_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l194_c12_7bcc_return_output := MUX_uxn_device_h_l194_c12_7bcc_return_output;

     -- auto_advance_MUX[uxn_device_h_l181_c7_daa1] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l181_c7_daa1_cond <= VAR_auto_advance_MUX_uxn_device_h_l181_c7_daa1_cond;
     auto_advance_MUX_uxn_device_h_l181_c7_daa1_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l181_c7_daa1_iftrue;
     auto_advance_MUX_uxn_device_h_l181_c7_daa1_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l181_c7_daa1_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l181_c7_daa1_return_output := auto_advance_MUX_uxn_device_h_l181_c7_daa1_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l200_c7_3d80] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l200_c7_3d80_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l200_c7_3d80_cond;
     result_device_ram_address_MUX_uxn_device_h_l200_c7_3d80_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l200_c7_3d80_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l200_c7_3d80_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l200_c7_3d80_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l200_c7_3d80_return_output := result_device_ram_address_MUX_uxn_device_h_l200_c7_3d80_return_output;

     -- flip_y_MUX[uxn_device_h_l181_c7_daa1] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l181_c7_daa1_cond <= VAR_flip_y_MUX_uxn_device_h_l181_c7_daa1_cond;
     flip_y_MUX_uxn_device_h_l181_c7_daa1_iftrue <= VAR_flip_y_MUX_uxn_device_h_l181_c7_daa1_iftrue;
     flip_y_MUX_uxn_device_h_l181_c7_daa1_iffalse <= VAR_flip_y_MUX_uxn_device_h_l181_c7_daa1_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l181_c7_daa1_return_output := flip_y_MUX_uxn_device_h_l181_c7_daa1_return_output;

     -- Submodule level 3
     VAR_BIN_OP_OR_uxn_device_h_l194_c4_d454_right := VAR_MUX_uxn_device_h_l194_c12_7bcc_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l195_c4_8be7_right := VAR_MUX_uxn_device_h_l195_c12_d7d9_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l200_c7_3d80_iftrue := VAR_UNARY_OP_NOT_uxn_device_h_l209_c26_8223_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l177_c7_40ab_iffalse := VAR_auto_advance_MUX_uxn_device_h_l181_c7_daa1_return_output;
     VAR_color_MUX_uxn_device_h_l173_c7_d70f_iffalse := VAR_color_MUX_uxn_device_h_l177_c7_40ab_return_output;
     VAR_ctrl_MUX_uxn_device_h_l173_c7_d70f_iffalse := VAR_ctrl_MUX_uxn_device_h_l177_c7_40ab_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l177_c7_40ab_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_daa1_return_output;
     VAR_flip_x_MUX_uxn_device_h_l177_c7_40ab_iffalse := VAR_flip_x_MUX_uxn_device_h_l181_c7_daa1_return_output;
     VAR_flip_y_MUX_uxn_device_h_l177_c7_40ab_iffalse := VAR_flip_y_MUX_uxn_device_h_l181_c7_daa1_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l177_c7_40ab_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l181_c7_daa1_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l177_c7_40ab_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l181_c7_daa1_return_output;
     VAR_layer_MUX_uxn_device_h_l177_c7_40ab_iffalse := VAR_layer_MUX_uxn_device_h_l181_c7_daa1_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l200_c7_3d80_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l211_c7_4ee6_return_output;
     VAR_x_MUX_uxn_device_h_l164_c2_b08d_iffalse := VAR_x_MUX_uxn_device_h_l170_c7_1346_return_output;
     VAR_y_MUX_uxn_device_h_l170_c7_1346_iffalse := VAR_y_MUX_uxn_device_h_l173_c7_d70f_return_output;
     -- is_auto_x_MUX[uxn_device_h_l177_c7_40ab] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l177_c7_40ab_cond <= VAR_is_auto_x_MUX_uxn_device_h_l177_c7_40ab_cond;
     is_auto_x_MUX_uxn_device_h_l177_c7_40ab_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l177_c7_40ab_iftrue;
     is_auto_x_MUX_uxn_device_h_l177_c7_40ab_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l177_c7_40ab_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l177_c7_40ab_return_output := is_auto_x_MUX_uxn_device_h_l177_c7_40ab_return_output;

     -- y_MUX[uxn_device_h_l170_c7_1346] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l170_c7_1346_cond <= VAR_y_MUX_uxn_device_h_l170_c7_1346_cond;
     y_MUX_uxn_device_h_l170_c7_1346_iftrue <= VAR_y_MUX_uxn_device_h_l170_c7_1346_iftrue;
     y_MUX_uxn_device_h_l170_c7_1346_iffalse <= VAR_y_MUX_uxn_device_h_l170_c7_1346_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l170_c7_1346_return_output := y_MUX_uxn_device_h_l170_c7_1346_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l200_c7_3d80] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l200_c7_3d80_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l200_c7_3d80_cond;
     result_is_deo_done_MUX_uxn_device_h_l200_c7_3d80_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l200_c7_3d80_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l200_c7_3d80_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l200_c7_3d80_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l200_c7_3d80_return_output := result_is_deo_done_MUX_uxn_device_h_l200_c7_3d80_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l177_c7_40ab] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l177_c7_40ab_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l177_c7_40ab_cond;
     ctrl_mode_MUX_uxn_device_h_l177_c7_40ab_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l177_c7_40ab_iftrue;
     ctrl_mode_MUX_uxn_device_h_l177_c7_40ab_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l177_c7_40ab_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l177_c7_40ab_return_output := ctrl_mode_MUX_uxn_device_h_l177_c7_40ab_return_output;

     -- layer_MUX[uxn_device_h_l177_c7_40ab] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l177_c7_40ab_cond <= VAR_layer_MUX_uxn_device_h_l177_c7_40ab_cond;
     layer_MUX_uxn_device_h_l177_c7_40ab_iftrue <= VAR_layer_MUX_uxn_device_h_l177_c7_40ab_iftrue;
     layer_MUX_uxn_device_h_l177_c7_40ab_iffalse <= VAR_layer_MUX_uxn_device_h_l177_c7_40ab_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l177_c7_40ab_return_output := layer_MUX_uxn_device_h_l177_c7_40ab_return_output;

     -- auto_advance_MUX[uxn_device_h_l177_c7_40ab] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l177_c7_40ab_cond <= VAR_auto_advance_MUX_uxn_device_h_l177_c7_40ab_cond;
     auto_advance_MUX_uxn_device_h_l177_c7_40ab_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l177_c7_40ab_iftrue;
     auto_advance_MUX_uxn_device_h_l177_c7_40ab_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l177_c7_40ab_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l177_c7_40ab_return_output := auto_advance_MUX_uxn_device_h_l177_c7_40ab_return_output;

     -- flip_x_MUX[uxn_device_h_l177_c7_40ab] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l177_c7_40ab_cond <= VAR_flip_x_MUX_uxn_device_h_l177_c7_40ab_cond;
     flip_x_MUX_uxn_device_h_l177_c7_40ab_iftrue <= VAR_flip_x_MUX_uxn_device_h_l177_c7_40ab_iftrue;
     flip_x_MUX_uxn_device_h_l177_c7_40ab_iffalse <= VAR_flip_x_MUX_uxn_device_h_l177_c7_40ab_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l177_c7_40ab_return_output := flip_x_MUX_uxn_device_h_l177_c7_40ab_return_output;

     -- x_MUX[uxn_device_h_l164_c2_b08d] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l164_c2_b08d_cond <= VAR_x_MUX_uxn_device_h_l164_c2_b08d_cond;
     x_MUX_uxn_device_h_l164_c2_b08d_iftrue <= VAR_x_MUX_uxn_device_h_l164_c2_b08d_iftrue;
     x_MUX_uxn_device_h_l164_c2_b08d_iffalse <= VAR_x_MUX_uxn_device_h_l164_c2_b08d_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l164_c2_b08d_return_output := x_MUX_uxn_device_h_l164_c2_b08d_return_output;

     -- result_u8_value_MUX[uxn_device_h_l200_c7_3d80] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l200_c7_3d80_cond <= VAR_result_u8_value_MUX_uxn_device_h_l200_c7_3d80_cond;
     result_u8_value_MUX_uxn_device_h_l200_c7_3d80_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l200_c7_3d80_iftrue;
     result_u8_value_MUX_uxn_device_h_l200_c7_3d80_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l200_c7_3d80_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l200_c7_3d80_return_output := result_u8_value_MUX_uxn_device_h_l200_c7_3d80_return_output;

     -- ctrl_MUX[uxn_device_h_l173_c7_d70f] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l173_c7_d70f_cond <= VAR_ctrl_MUX_uxn_device_h_l173_c7_d70f_cond;
     ctrl_MUX_uxn_device_h_l173_c7_d70f_iftrue <= VAR_ctrl_MUX_uxn_device_h_l173_c7_d70f_iftrue;
     ctrl_MUX_uxn_device_h_l173_c7_d70f_iffalse <= VAR_ctrl_MUX_uxn_device_h_l173_c7_d70f_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l173_c7_d70f_return_output := ctrl_MUX_uxn_device_h_l173_c7_d70f_return_output;

     -- BIN_OP_OR[uxn_device_h_l194_c4_d454] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l194_c4_d454_left <= VAR_BIN_OP_OR_uxn_device_h_l194_c4_d454_left;
     BIN_OP_OR_uxn_device_h_l194_c4_d454_right <= VAR_BIN_OP_OR_uxn_device_h_l194_c4_d454_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l194_c4_d454_return_output := BIN_OP_OR_uxn_device_h_l194_c4_d454_return_output;

     -- is_auto_y_MUX[uxn_device_h_l177_c7_40ab] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l177_c7_40ab_cond <= VAR_is_auto_y_MUX_uxn_device_h_l177_c7_40ab_cond;
     is_auto_y_MUX_uxn_device_h_l177_c7_40ab_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l177_c7_40ab_iftrue;
     is_auto_y_MUX_uxn_device_h_l177_c7_40ab_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l177_c7_40ab_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l177_c7_40ab_return_output := is_auto_y_MUX_uxn_device_h_l177_c7_40ab_return_output;

     -- flip_y_MUX[uxn_device_h_l177_c7_40ab] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l177_c7_40ab_cond <= VAR_flip_y_MUX_uxn_device_h_l177_c7_40ab_cond;
     flip_y_MUX_uxn_device_h_l177_c7_40ab_iftrue <= VAR_flip_y_MUX_uxn_device_h_l177_c7_40ab_iftrue;
     flip_y_MUX_uxn_device_h_l177_c7_40ab_iffalse <= VAR_flip_y_MUX_uxn_device_h_l177_c7_40ab_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l177_c7_40ab_return_output := flip_y_MUX_uxn_device_h_l177_c7_40ab_return_output;

     -- color_MUX[uxn_device_h_l173_c7_d70f] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l173_c7_d70f_cond <= VAR_color_MUX_uxn_device_h_l173_c7_d70f_cond;
     color_MUX_uxn_device_h_l173_c7_d70f_iftrue <= VAR_color_MUX_uxn_device_h_l173_c7_d70f_iftrue;
     color_MUX_uxn_device_h_l173_c7_d70f_iffalse <= VAR_color_MUX_uxn_device_h_l173_c7_d70f_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l173_c7_d70f_return_output := color_MUX_uxn_device_h_l173_c7_d70f_return_output;

     -- Submodule level 4
     VAR_BIN_OP_OR_uxn_device_h_l195_c4_8be7_left := VAR_BIN_OP_OR_uxn_device_h_l194_c4_d454_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l173_c7_d70f_iffalse := VAR_auto_advance_MUX_uxn_device_h_l177_c7_40ab_return_output;
     VAR_color_MUX_uxn_device_h_l170_c7_1346_iffalse := VAR_color_MUX_uxn_device_h_l173_c7_d70f_return_output;
     VAR_ctrl_MUX_uxn_device_h_l170_c7_1346_iffalse := VAR_ctrl_MUX_uxn_device_h_l173_c7_d70f_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l173_c7_d70f_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l177_c7_40ab_return_output;
     VAR_flip_x_MUX_uxn_device_h_l173_c7_d70f_iffalse := VAR_flip_x_MUX_uxn_device_h_l177_c7_40ab_return_output;
     VAR_flip_y_MUX_uxn_device_h_l173_c7_d70f_iffalse := VAR_flip_y_MUX_uxn_device_h_l177_c7_40ab_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l173_c7_d70f_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l177_c7_40ab_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l173_c7_d70f_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l177_c7_40ab_return_output;
     VAR_layer_MUX_uxn_device_h_l173_c7_d70f_iffalse := VAR_layer_MUX_uxn_device_h_l177_c7_40ab_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l164_c2_b08d_return_output;
     VAR_y_MUX_uxn_device_h_l164_c2_b08d_iffalse := VAR_y_MUX_uxn_device_h_l170_c7_1346_return_output;
     -- result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_fa3f[uxn_device_h_l181_c7_daa1] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_fa3f_uxn_device_h_l181_c7_daa1_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_fa3f(
     result,
     VAR_result_u8_value_MUX_uxn_device_h_l200_c7_3d80_return_output,
     VAR_result_u16_addr_MUX_uxn_device_h_l200_c7_3d80_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l200_c7_3d80_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l200_c7_3d80_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l200_c7_3d80_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l200_c7_3d80_return_output);

     -- flip_y_MUX[uxn_device_h_l173_c7_d70f] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l173_c7_d70f_cond <= VAR_flip_y_MUX_uxn_device_h_l173_c7_d70f_cond;
     flip_y_MUX_uxn_device_h_l173_c7_d70f_iftrue <= VAR_flip_y_MUX_uxn_device_h_l173_c7_d70f_iftrue;
     flip_y_MUX_uxn_device_h_l173_c7_d70f_iffalse <= VAR_flip_y_MUX_uxn_device_h_l173_c7_d70f_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l173_c7_d70f_return_output := flip_y_MUX_uxn_device_h_l173_c7_d70f_return_output;

     -- flip_x_MUX[uxn_device_h_l173_c7_d70f] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l173_c7_d70f_cond <= VAR_flip_x_MUX_uxn_device_h_l173_c7_d70f_cond;
     flip_x_MUX_uxn_device_h_l173_c7_d70f_iftrue <= VAR_flip_x_MUX_uxn_device_h_l173_c7_d70f_iftrue;
     flip_x_MUX_uxn_device_h_l173_c7_d70f_iffalse <= VAR_flip_x_MUX_uxn_device_h_l173_c7_d70f_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l173_c7_d70f_return_output := flip_x_MUX_uxn_device_h_l173_c7_d70f_return_output;

     -- color_MUX[uxn_device_h_l170_c7_1346] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l170_c7_1346_cond <= VAR_color_MUX_uxn_device_h_l170_c7_1346_cond;
     color_MUX_uxn_device_h_l170_c7_1346_iftrue <= VAR_color_MUX_uxn_device_h_l170_c7_1346_iftrue;
     color_MUX_uxn_device_h_l170_c7_1346_iffalse <= VAR_color_MUX_uxn_device_h_l170_c7_1346_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l170_c7_1346_return_output := color_MUX_uxn_device_h_l170_c7_1346_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l173_c7_d70f] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l173_c7_d70f_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l173_c7_d70f_cond;
     ctrl_mode_MUX_uxn_device_h_l173_c7_d70f_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l173_c7_d70f_iftrue;
     ctrl_mode_MUX_uxn_device_h_l173_c7_d70f_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l173_c7_d70f_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l173_c7_d70f_return_output := ctrl_mode_MUX_uxn_device_h_l173_c7_d70f_return_output;

     -- y_MUX[uxn_device_h_l164_c2_b08d] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l164_c2_b08d_cond <= VAR_y_MUX_uxn_device_h_l164_c2_b08d_cond;
     y_MUX_uxn_device_h_l164_c2_b08d_iftrue <= VAR_y_MUX_uxn_device_h_l164_c2_b08d_iftrue;
     y_MUX_uxn_device_h_l164_c2_b08d_iffalse <= VAR_y_MUX_uxn_device_h_l164_c2_b08d_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l164_c2_b08d_return_output := y_MUX_uxn_device_h_l164_c2_b08d_return_output;

     -- ctrl_MUX[uxn_device_h_l170_c7_1346] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l170_c7_1346_cond <= VAR_ctrl_MUX_uxn_device_h_l170_c7_1346_cond;
     ctrl_MUX_uxn_device_h_l170_c7_1346_iftrue <= VAR_ctrl_MUX_uxn_device_h_l170_c7_1346_iftrue;
     ctrl_MUX_uxn_device_h_l170_c7_1346_iffalse <= VAR_ctrl_MUX_uxn_device_h_l170_c7_1346_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l170_c7_1346_return_output := ctrl_MUX_uxn_device_h_l170_c7_1346_return_output;

     -- is_auto_y_MUX[uxn_device_h_l173_c7_d70f] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l173_c7_d70f_cond <= VAR_is_auto_y_MUX_uxn_device_h_l173_c7_d70f_cond;
     is_auto_y_MUX_uxn_device_h_l173_c7_d70f_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l173_c7_d70f_iftrue;
     is_auto_y_MUX_uxn_device_h_l173_c7_d70f_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l173_c7_d70f_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l173_c7_d70f_return_output := is_auto_y_MUX_uxn_device_h_l173_c7_d70f_return_output;

     -- auto_advance_MUX[uxn_device_h_l173_c7_d70f] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l173_c7_d70f_cond <= VAR_auto_advance_MUX_uxn_device_h_l173_c7_d70f_cond;
     auto_advance_MUX_uxn_device_h_l173_c7_d70f_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l173_c7_d70f_iftrue;
     auto_advance_MUX_uxn_device_h_l173_c7_d70f_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l173_c7_d70f_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l173_c7_d70f_return_output := auto_advance_MUX_uxn_device_h_l173_c7_d70f_return_output;

     -- BIN_OP_OR[uxn_device_h_l195_c4_8be7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l195_c4_8be7_left <= VAR_BIN_OP_OR_uxn_device_h_l195_c4_8be7_left;
     BIN_OP_OR_uxn_device_h_l195_c4_8be7_right <= VAR_BIN_OP_OR_uxn_device_h_l195_c4_8be7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l195_c4_8be7_return_output := BIN_OP_OR_uxn_device_h_l195_c4_8be7_return_output;

     -- layer_MUX[uxn_device_h_l173_c7_d70f] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l173_c7_d70f_cond <= VAR_layer_MUX_uxn_device_h_l173_c7_d70f_cond;
     layer_MUX_uxn_device_h_l173_c7_d70f_iftrue <= VAR_layer_MUX_uxn_device_h_l173_c7_d70f_iftrue;
     layer_MUX_uxn_device_h_l173_c7_d70f_iffalse <= VAR_layer_MUX_uxn_device_h_l173_c7_d70f_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l173_c7_d70f_return_output := layer_MUX_uxn_device_h_l173_c7_d70f_return_output;

     -- is_auto_x_MUX[uxn_device_h_l173_c7_d70f] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l173_c7_d70f_cond <= VAR_is_auto_x_MUX_uxn_device_h_l173_c7_d70f_cond;
     is_auto_x_MUX_uxn_device_h_l173_c7_d70f_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l173_c7_d70f_iftrue;
     is_auto_x_MUX_uxn_device_h_l173_c7_d70f_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l173_c7_d70f_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l173_c7_d70f_return_output := is_auto_x_MUX_uxn_device_h_l173_c7_d70f_return_output;

     -- Submodule level 5
     VAR_tmp8_MUX_uxn_device_h_l193_c3_b65b_iftrue := VAR_BIN_OP_OR_uxn_device_h_l195_c4_8be7_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l170_c7_1346_iffalse := VAR_auto_advance_MUX_uxn_device_h_l173_c7_d70f_return_output;
     VAR_color_MUX_uxn_device_h_l164_c2_b08d_iffalse := VAR_color_MUX_uxn_device_h_l170_c7_1346_return_output;
     VAR_ctrl_MUX_uxn_device_h_l164_c2_b08d_iffalse := VAR_ctrl_MUX_uxn_device_h_l170_c7_1346_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l170_c7_1346_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l173_c7_d70f_return_output;
     VAR_flip_x_MUX_uxn_device_h_l170_c7_1346_iffalse := VAR_flip_x_MUX_uxn_device_h_l173_c7_d70f_return_output;
     VAR_flip_y_MUX_uxn_device_h_l170_c7_1346_iffalse := VAR_flip_y_MUX_uxn_device_h_l173_c7_d70f_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l170_c7_1346_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l173_c7_d70f_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l170_c7_1346_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l173_c7_d70f_return_output;
     VAR_layer_MUX_uxn_device_h_l170_c7_1346_iffalse := VAR_layer_MUX_uxn_device_h_l173_c7_d70f_return_output;
     VAR_result_MUX_uxn_device_h_l181_c7_daa1_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_fa3f_uxn_device_h_l181_c7_daa1_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l164_c2_b08d_return_output;
     -- is_auto_x_MUX[uxn_device_h_l170_c7_1346] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l170_c7_1346_cond <= VAR_is_auto_x_MUX_uxn_device_h_l170_c7_1346_cond;
     is_auto_x_MUX_uxn_device_h_l170_c7_1346_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l170_c7_1346_iftrue;
     is_auto_x_MUX_uxn_device_h_l170_c7_1346_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l170_c7_1346_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l170_c7_1346_return_output := is_auto_x_MUX_uxn_device_h_l170_c7_1346_return_output;

     -- tmp8_MUX[uxn_device_h_l193_c3_b65b] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l193_c3_b65b_cond <= VAR_tmp8_MUX_uxn_device_h_l193_c3_b65b_cond;
     tmp8_MUX_uxn_device_h_l193_c3_b65b_iftrue <= VAR_tmp8_MUX_uxn_device_h_l193_c3_b65b_iftrue;
     tmp8_MUX_uxn_device_h_l193_c3_b65b_iffalse <= VAR_tmp8_MUX_uxn_device_h_l193_c3_b65b_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l193_c3_b65b_return_output := tmp8_MUX_uxn_device_h_l193_c3_b65b_return_output;

     -- flip_y_MUX[uxn_device_h_l170_c7_1346] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l170_c7_1346_cond <= VAR_flip_y_MUX_uxn_device_h_l170_c7_1346_cond;
     flip_y_MUX_uxn_device_h_l170_c7_1346_iftrue <= VAR_flip_y_MUX_uxn_device_h_l170_c7_1346_iftrue;
     flip_y_MUX_uxn_device_h_l170_c7_1346_iffalse <= VAR_flip_y_MUX_uxn_device_h_l170_c7_1346_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l170_c7_1346_return_output := flip_y_MUX_uxn_device_h_l170_c7_1346_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l170_c7_1346] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l170_c7_1346_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l170_c7_1346_cond;
     ctrl_mode_MUX_uxn_device_h_l170_c7_1346_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l170_c7_1346_iftrue;
     ctrl_mode_MUX_uxn_device_h_l170_c7_1346_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l170_c7_1346_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l170_c7_1346_return_output := ctrl_mode_MUX_uxn_device_h_l170_c7_1346_return_output;

     -- is_auto_y_MUX[uxn_device_h_l170_c7_1346] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l170_c7_1346_cond <= VAR_is_auto_y_MUX_uxn_device_h_l170_c7_1346_cond;
     is_auto_y_MUX_uxn_device_h_l170_c7_1346_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l170_c7_1346_iftrue;
     is_auto_y_MUX_uxn_device_h_l170_c7_1346_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l170_c7_1346_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l170_c7_1346_return_output := is_auto_y_MUX_uxn_device_h_l170_c7_1346_return_output;

     -- auto_advance_MUX[uxn_device_h_l170_c7_1346] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l170_c7_1346_cond <= VAR_auto_advance_MUX_uxn_device_h_l170_c7_1346_cond;
     auto_advance_MUX_uxn_device_h_l170_c7_1346_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l170_c7_1346_iftrue;
     auto_advance_MUX_uxn_device_h_l170_c7_1346_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l170_c7_1346_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l170_c7_1346_return_output := auto_advance_MUX_uxn_device_h_l170_c7_1346_return_output;

     -- color_MUX[uxn_device_h_l164_c2_b08d] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l164_c2_b08d_cond <= VAR_color_MUX_uxn_device_h_l164_c2_b08d_cond;
     color_MUX_uxn_device_h_l164_c2_b08d_iftrue <= VAR_color_MUX_uxn_device_h_l164_c2_b08d_iftrue;
     color_MUX_uxn_device_h_l164_c2_b08d_iffalse <= VAR_color_MUX_uxn_device_h_l164_c2_b08d_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l164_c2_b08d_return_output := color_MUX_uxn_device_h_l164_c2_b08d_return_output;

     -- layer_MUX[uxn_device_h_l170_c7_1346] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l170_c7_1346_cond <= VAR_layer_MUX_uxn_device_h_l170_c7_1346_cond;
     layer_MUX_uxn_device_h_l170_c7_1346_iftrue <= VAR_layer_MUX_uxn_device_h_l170_c7_1346_iftrue;
     layer_MUX_uxn_device_h_l170_c7_1346_iffalse <= VAR_layer_MUX_uxn_device_h_l170_c7_1346_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l170_c7_1346_return_output := layer_MUX_uxn_device_h_l170_c7_1346_return_output;

     -- flip_x_MUX[uxn_device_h_l170_c7_1346] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l170_c7_1346_cond <= VAR_flip_x_MUX_uxn_device_h_l170_c7_1346_cond;
     flip_x_MUX_uxn_device_h_l170_c7_1346_iftrue <= VAR_flip_x_MUX_uxn_device_h_l170_c7_1346_iftrue;
     flip_x_MUX_uxn_device_h_l170_c7_1346_iffalse <= VAR_flip_x_MUX_uxn_device_h_l170_c7_1346_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l170_c7_1346_return_output := flip_x_MUX_uxn_device_h_l170_c7_1346_return_output;

     -- ctrl_MUX[uxn_device_h_l164_c2_b08d] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l164_c2_b08d_cond <= VAR_ctrl_MUX_uxn_device_h_l164_c2_b08d_cond;
     ctrl_MUX_uxn_device_h_l164_c2_b08d_iftrue <= VAR_ctrl_MUX_uxn_device_h_l164_c2_b08d_iftrue;
     ctrl_MUX_uxn_device_h_l164_c2_b08d_iffalse <= VAR_ctrl_MUX_uxn_device_h_l164_c2_b08d_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l164_c2_b08d_return_output := ctrl_MUX_uxn_device_h_l164_c2_b08d_return_output;

     -- Submodule level 6
     VAR_auto_advance_MUX_uxn_device_h_l164_c2_b08d_iffalse := VAR_auto_advance_MUX_uxn_device_h_l170_c7_1346_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_device_h_l164_c2_b08d_return_output;
     REG_VAR_ctrl := VAR_ctrl_MUX_uxn_device_h_l164_c2_b08d_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l164_c2_b08d_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l170_c7_1346_return_output;
     VAR_flip_x_MUX_uxn_device_h_l164_c2_b08d_iffalse := VAR_flip_x_MUX_uxn_device_h_l170_c7_1346_return_output;
     VAR_flip_y_MUX_uxn_device_h_l164_c2_b08d_iffalse := VAR_flip_y_MUX_uxn_device_h_l170_c7_1346_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l164_c2_b08d_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l170_c7_1346_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l164_c2_b08d_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l170_c7_1346_return_output;
     VAR_layer_MUX_uxn_device_h_l164_c2_b08d_iffalse := VAR_layer_MUX_uxn_device_h_l170_c7_1346_return_output;
     VAR_tmp8_MUX_uxn_device_h_l181_c7_daa1_iftrue := VAR_tmp8_MUX_uxn_device_h_l193_c3_b65b_return_output;
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_88f7[uxn_device_h_l181_c7_daa1] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_88f7_uxn_device_h_l181_c7_daa1_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_88f7(
     result,
     VAR_result_device_ram_address_uxn_device_h_l189_c3_e8bc,
     VAR_result_u16_addr_uxn_device_h_l190_c3_0484,
     VAR_CAST_TO_uint1_t_uxn_device_h_l185_c11_52c1_return_output,
     to_unsigned(1, 1),
     VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_b65b_return_output,
     VAR_tmp8_MUX_uxn_device_h_l193_c3_b65b_return_output);

     -- flip_y_MUX[uxn_device_h_l164_c2_b08d] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l164_c2_b08d_cond <= VAR_flip_y_MUX_uxn_device_h_l164_c2_b08d_cond;
     flip_y_MUX_uxn_device_h_l164_c2_b08d_iftrue <= VAR_flip_y_MUX_uxn_device_h_l164_c2_b08d_iftrue;
     flip_y_MUX_uxn_device_h_l164_c2_b08d_iffalse <= VAR_flip_y_MUX_uxn_device_h_l164_c2_b08d_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l164_c2_b08d_return_output := flip_y_MUX_uxn_device_h_l164_c2_b08d_return_output;

     -- flip_x_MUX[uxn_device_h_l164_c2_b08d] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l164_c2_b08d_cond <= VAR_flip_x_MUX_uxn_device_h_l164_c2_b08d_cond;
     flip_x_MUX_uxn_device_h_l164_c2_b08d_iftrue <= VAR_flip_x_MUX_uxn_device_h_l164_c2_b08d_iftrue;
     flip_x_MUX_uxn_device_h_l164_c2_b08d_iffalse <= VAR_flip_x_MUX_uxn_device_h_l164_c2_b08d_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l164_c2_b08d_return_output := flip_x_MUX_uxn_device_h_l164_c2_b08d_return_output;

     -- auto_advance_MUX[uxn_device_h_l164_c2_b08d] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l164_c2_b08d_cond <= VAR_auto_advance_MUX_uxn_device_h_l164_c2_b08d_cond;
     auto_advance_MUX_uxn_device_h_l164_c2_b08d_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l164_c2_b08d_iftrue;
     auto_advance_MUX_uxn_device_h_l164_c2_b08d_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l164_c2_b08d_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l164_c2_b08d_return_output := auto_advance_MUX_uxn_device_h_l164_c2_b08d_return_output;

     -- layer_MUX[uxn_device_h_l164_c2_b08d] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l164_c2_b08d_cond <= VAR_layer_MUX_uxn_device_h_l164_c2_b08d_cond;
     layer_MUX_uxn_device_h_l164_c2_b08d_iftrue <= VAR_layer_MUX_uxn_device_h_l164_c2_b08d_iftrue;
     layer_MUX_uxn_device_h_l164_c2_b08d_iffalse <= VAR_layer_MUX_uxn_device_h_l164_c2_b08d_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l164_c2_b08d_return_output := layer_MUX_uxn_device_h_l164_c2_b08d_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l164_c2_b08d] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l164_c2_b08d_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l164_c2_b08d_cond;
     ctrl_mode_MUX_uxn_device_h_l164_c2_b08d_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l164_c2_b08d_iftrue;
     ctrl_mode_MUX_uxn_device_h_l164_c2_b08d_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l164_c2_b08d_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l164_c2_b08d_return_output := ctrl_mode_MUX_uxn_device_h_l164_c2_b08d_return_output;

     -- tmp8_MUX[uxn_device_h_l181_c7_daa1] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l181_c7_daa1_cond <= VAR_tmp8_MUX_uxn_device_h_l181_c7_daa1_cond;
     tmp8_MUX_uxn_device_h_l181_c7_daa1_iftrue <= VAR_tmp8_MUX_uxn_device_h_l181_c7_daa1_iftrue;
     tmp8_MUX_uxn_device_h_l181_c7_daa1_iffalse <= VAR_tmp8_MUX_uxn_device_h_l181_c7_daa1_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l181_c7_daa1_return_output := tmp8_MUX_uxn_device_h_l181_c7_daa1_return_output;

     -- is_auto_x_MUX[uxn_device_h_l164_c2_b08d] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l164_c2_b08d_cond <= VAR_is_auto_x_MUX_uxn_device_h_l164_c2_b08d_cond;
     is_auto_x_MUX_uxn_device_h_l164_c2_b08d_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l164_c2_b08d_iftrue;
     is_auto_x_MUX_uxn_device_h_l164_c2_b08d_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l164_c2_b08d_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l164_c2_b08d_return_output := is_auto_x_MUX_uxn_device_h_l164_c2_b08d_return_output;

     -- is_auto_y_MUX[uxn_device_h_l164_c2_b08d] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l164_c2_b08d_cond <= VAR_is_auto_y_MUX_uxn_device_h_l164_c2_b08d_cond;
     is_auto_y_MUX_uxn_device_h_l164_c2_b08d_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l164_c2_b08d_iftrue;
     is_auto_y_MUX_uxn_device_h_l164_c2_b08d_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l164_c2_b08d_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l164_c2_b08d_return_output := is_auto_y_MUX_uxn_device_h_l164_c2_b08d_return_output;

     -- Submodule level 7
     REG_VAR_auto_advance := VAR_auto_advance_MUX_uxn_device_h_l164_c2_b08d_return_output;
     REG_VAR_ctrl_mode := VAR_ctrl_mode_MUX_uxn_device_h_l164_c2_b08d_return_output;
     REG_VAR_flip_x := VAR_flip_x_MUX_uxn_device_h_l164_c2_b08d_return_output;
     REG_VAR_flip_y := VAR_flip_y_MUX_uxn_device_h_l164_c2_b08d_return_output;
     REG_VAR_is_auto_x := VAR_is_auto_x_MUX_uxn_device_h_l164_c2_b08d_return_output;
     REG_VAR_is_auto_y := VAR_is_auto_y_MUX_uxn_device_h_l164_c2_b08d_return_output;
     REG_VAR_layer := VAR_layer_MUX_uxn_device_h_l164_c2_b08d_return_output;
     VAR_result_MUX_uxn_device_h_l181_c7_daa1_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_88f7_uxn_device_h_l181_c7_daa1_return_output;
     VAR_tmp8_MUX_uxn_device_h_l177_c7_40ab_iffalse := VAR_tmp8_MUX_uxn_device_h_l181_c7_daa1_return_output;
     -- tmp8_MUX[uxn_device_h_l177_c7_40ab] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l177_c7_40ab_cond <= VAR_tmp8_MUX_uxn_device_h_l177_c7_40ab_cond;
     tmp8_MUX_uxn_device_h_l177_c7_40ab_iftrue <= VAR_tmp8_MUX_uxn_device_h_l177_c7_40ab_iftrue;
     tmp8_MUX_uxn_device_h_l177_c7_40ab_iffalse <= VAR_tmp8_MUX_uxn_device_h_l177_c7_40ab_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l177_c7_40ab_return_output := tmp8_MUX_uxn_device_h_l177_c7_40ab_return_output;

     -- result_MUX[uxn_device_h_l181_c7_daa1] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l181_c7_daa1_cond <= VAR_result_MUX_uxn_device_h_l181_c7_daa1_cond;
     result_MUX_uxn_device_h_l181_c7_daa1_iftrue <= VAR_result_MUX_uxn_device_h_l181_c7_daa1_iftrue;
     result_MUX_uxn_device_h_l181_c7_daa1_iffalse <= VAR_result_MUX_uxn_device_h_l181_c7_daa1_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l181_c7_daa1_return_output := result_MUX_uxn_device_h_l181_c7_daa1_return_output;

     -- Submodule level 8
     VAR_result_MUX_uxn_device_h_l177_c7_40ab_iffalse := VAR_result_MUX_uxn_device_h_l181_c7_daa1_return_output;
     VAR_tmp8_MUX_uxn_device_h_l173_c7_d70f_iffalse := VAR_tmp8_MUX_uxn_device_h_l177_c7_40ab_return_output;
     -- tmp8_MUX[uxn_device_h_l173_c7_d70f] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l173_c7_d70f_cond <= VAR_tmp8_MUX_uxn_device_h_l173_c7_d70f_cond;
     tmp8_MUX_uxn_device_h_l173_c7_d70f_iftrue <= VAR_tmp8_MUX_uxn_device_h_l173_c7_d70f_iftrue;
     tmp8_MUX_uxn_device_h_l173_c7_d70f_iffalse <= VAR_tmp8_MUX_uxn_device_h_l173_c7_d70f_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l173_c7_d70f_return_output := tmp8_MUX_uxn_device_h_l173_c7_d70f_return_output;

     -- result_MUX[uxn_device_h_l177_c7_40ab] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l177_c7_40ab_cond <= VAR_result_MUX_uxn_device_h_l177_c7_40ab_cond;
     result_MUX_uxn_device_h_l177_c7_40ab_iftrue <= VAR_result_MUX_uxn_device_h_l177_c7_40ab_iftrue;
     result_MUX_uxn_device_h_l177_c7_40ab_iffalse <= VAR_result_MUX_uxn_device_h_l177_c7_40ab_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l177_c7_40ab_return_output := result_MUX_uxn_device_h_l177_c7_40ab_return_output;

     -- Submodule level 9
     VAR_result_MUX_uxn_device_h_l173_c7_d70f_iffalse := VAR_result_MUX_uxn_device_h_l177_c7_40ab_return_output;
     VAR_tmp8_MUX_uxn_device_h_l170_c7_1346_iffalse := VAR_tmp8_MUX_uxn_device_h_l173_c7_d70f_return_output;
     -- result_MUX[uxn_device_h_l173_c7_d70f] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l173_c7_d70f_cond <= VAR_result_MUX_uxn_device_h_l173_c7_d70f_cond;
     result_MUX_uxn_device_h_l173_c7_d70f_iftrue <= VAR_result_MUX_uxn_device_h_l173_c7_d70f_iftrue;
     result_MUX_uxn_device_h_l173_c7_d70f_iffalse <= VAR_result_MUX_uxn_device_h_l173_c7_d70f_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l173_c7_d70f_return_output := result_MUX_uxn_device_h_l173_c7_d70f_return_output;

     -- tmp8_MUX[uxn_device_h_l170_c7_1346] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l170_c7_1346_cond <= VAR_tmp8_MUX_uxn_device_h_l170_c7_1346_cond;
     tmp8_MUX_uxn_device_h_l170_c7_1346_iftrue <= VAR_tmp8_MUX_uxn_device_h_l170_c7_1346_iftrue;
     tmp8_MUX_uxn_device_h_l170_c7_1346_iffalse <= VAR_tmp8_MUX_uxn_device_h_l170_c7_1346_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l170_c7_1346_return_output := tmp8_MUX_uxn_device_h_l170_c7_1346_return_output;

     -- Submodule level 10
     VAR_result_MUX_uxn_device_h_l170_c7_1346_iffalse := VAR_result_MUX_uxn_device_h_l173_c7_d70f_return_output;
     VAR_tmp8_MUX_uxn_device_h_l164_c2_b08d_iffalse := VAR_tmp8_MUX_uxn_device_h_l170_c7_1346_return_output;
     -- result_MUX[uxn_device_h_l170_c7_1346] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l170_c7_1346_cond <= VAR_result_MUX_uxn_device_h_l170_c7_1346_cond;
     result_MUX_uxn_device_h_l170_c7_1346_iftrue <= VAR_result_MUX_uxn_device_h_l170_c7_1346_iftrue;
     result_MUX_uxn_device_h_l170_c7_1346_iffalse <= VAR_result_MUX_uxn_device_h_l170_c7_1346_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l170_c7_1346_return_output := result_MUX_uxn_device_h_l170_c7_1346_return_output;

     -- tmp8_MUX[uxn_device_h_l164_c2_b08d] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l164_c2_b08d_cond <= VAR_tmp8_MUX_uxn_device_h_l164_c2_b08d_cond;
     tmp8_MUX_uxn_device_h_l164_c2_b08d_iftrue <= VAR_tmp8_MUX_uxn_device_h_l164_c2_b08d_iftrue;
     tmp8_MUX_uxn_device_h_l164_c2_b08d_iffalse <= VAR_tmp8_MUX_uxn_device_h_l164_c2_b08d_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l164_c2_b08d_return_output := tmp8_MUX_uxn_device_h_l164_c2_b08d_return_output;

     -- Submodule level 11
     VAR_result_MUX_uxn_device_h_l164_c2_b08d_iffalse := VAR_result_MUX_uxn_device_h_l170_c7_1346_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_device_h_l164_c2_b08d_return_output;
     -- result_MUX[uxn_device_h_l164_c2_b08d] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l164_c2_b08d_cond <= VAR_result_MUX_uxn_device_h_l164_c2_b08d_cond;
     result_MUX_uxn_device_h_l164_c2_b08d_iftrue <= VAR_result_MUX_uxn_device_h_l164_c2_b08d_iftrue;
     result_MUX_uxn_device_h_l164_c2_b08d_iffalse <= VAR_result_MUX_uxn_device_h_l164_c2_b08d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l164_c2_b08d_return_output := result_MUX_uxn_device_h_l164_c2_b08d_return_output;

     -- Submodule level 12
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l164_c2_b08d_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l164_c2_b08d_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_x <= REG_VAR_x;
REG_COMB_y <= REG_VAR_y;
REG_COMB_ctrl <= REG_VAR_ctrl;
REG_COMB_auto_advance <= REG_VAR_auto_advance;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_color <= REG_VAR_color;
REG_COMB_ctrl_mode <= REG_VAR_ctrl_mode;
REG_COMB_flip_x <= REG_VAR_flip_x;
REG_COMB_flip_y <= REG_VAR_flip_y;
REG_COMB_layer <= REG_VAR_layer;
REG_COMB_is_auto_x <= REG_VAR_is_auto_x;
REG_COMB_is_auto_y <= REG_VAR_is_auto_y;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     x <= REG_COMB_x;
     y <= REG_COMB_y;
     ctrl <= REG_COMB_ctrl;
     auto_advance <= REG_COMB_auto_advance;
     tmp8 <= REG_COMB_tmp8;
     color <= REG_COMB_color;
     ctrl_mode <= REG_COMB_ctrl_mode;
     flip_x <= REG_COMB_flip_x;
     flip_y <= REG_COMB_flip_y;
     layer <= REG_COMB_layer;
     is_auto_x <= REG_COMB_is_auto_x;
     is_auto_y <= REG_COMB_is_auto_y;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
