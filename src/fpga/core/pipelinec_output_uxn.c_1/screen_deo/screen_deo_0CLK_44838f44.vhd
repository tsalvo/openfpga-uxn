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
-- Submodules: 351
entity screen_deo_0CLK_44838f44 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_port : in unsigned(3 downto 0);
 phase : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out device_out_result_t);
end screen_deo_0CLK_44838f44;
architecture arch of screen_deo_0CLK_44838f44 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal vram_addr : unsigned(31 downto 0) := to_unsigned(0, 32);
signal x : unsigned(15 downto 0) := to_unsigned(0, 16);
signal y : unsigned(15 downto 0) := to_unsigned(0, 16);
signal ram_addr : unsigned(15 downto 0) := to_unsigned(0, 16);
signal ctrl : unsigned(7 downto 0) := to_unsigned(0, 8);
signal auto_advance : unsigned(7 downto 0) := to_unsigned(0, 8);
signal color : unsigned(3 downto 0) := to_unsigned(0, 4);
signal is_pixel_port : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_sprite_port : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_drawing_port : unsigned(0 downto 0) := to_unsigned(0, 1);
signal ctrl_mode : unsigned(0 downto 0) := to_unsigned(0, 1);
signal flip_x : unsigned(0 downto 0) := to_unsigned(0, 1);
signal flip_y : unsigned(0 downto 0) := to_unsigned(0, 1);
signal layer : unsigned(0 downto 0) := to_unsigned(0, 1);
signal result : device_out_result_t := (
is_device_ram_write => to_unsigned(0, 1),
device_ram_address => to_unsigned(0, 8),
is_vram_write => to_unsigned(0, 1),
vram_write_layer => to_unsigned(0, 1),
vram_address => to_unsigned(0, 32),
ram_address => to_unsigned(0, 16),
u8_value => to_unsigned(0, 8),
is_deo_done => to_unsigned(0, 1))
;
signal REG_COMB_vram_addr : unsigned(31 downto 0);
signal REG_COMB_x : unsigned(15 downto 0);
signal REG_COMB_y : unsigned(15 downto 0);
signal REG_COMB_ram_addr : unsigned(15 downto 0);
signal REG_COMB_ctrl : unsigned(7 downto 0);
signal REG_COMB_auto_advance : unsigned(7 downto 0);
signal REG_COMB_color : unsigned(3 downto 0);
signal REG_COMB_is_pixel_port : unsigned(0 downto 0);
signal REG_COMB_is_sprite_port : unsigned(0 downto 0);
signal REG_COMB_is_drawing_port : unsigned(0 downto 0);
signal REG_COMB_ctrl_mode : unsigned(0 downto 0);
signal REG_COMB_flip_x : unsigned(0 downto 0);
signal REG_COMB_flip_y : unsigned(0 downto 0);
signal REG_COMB_layer : unsigned(0 downto 0);
signal REG_COMB_result : device_out_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_device_h_l42_c6_10f4]
signal BIN_OP_EQ_uxn_device_h_l42_c6_10f4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l42_c6_10f4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l42_c6_10f4_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l42_c2_c27c]
signal result_is_vram_write_MUX_uxn_device_h_l42_c2_c27c_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l42_c2_c27c_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l42_c2_c27c_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l42_c2_c27c_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l42_c2_c27c]
signal result_device_ram_address_MUX_uxn_device_h_l42_c2_c27c_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l42_c2_c27c_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l42_c2_c27c_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l42_c2_c27c_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l42_c2_c27c]
signal result_is_deo_done_MUX_uxn_device_h_l42_c2_c27c_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l42_c2_c27c_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l42_c2_c27c_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l42_c2_c27c_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l42_c2_c27c]
signal result_vram_write_layer_MUX_uxn_device_h_l42_c2_c27c_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l42_c2_c27c_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l42_c2_c27c_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l42_c2_c27c_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l42_c2_c27c]
signal result_vram_address_MUX_uxn_device_h_l42_c2_c27c_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l42_c2_c27c_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l42_c2_c27c_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l42_c2_c27c_return_output : unsigned(31 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l42_c2_c27c]
signal result_is_device_ram_write_MUX_uxn_device_h_l42_c2_c27c_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l42_c2_c27c_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l42_c2_c27c_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l42_c2_c27c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l42_c2_c27c]
signal result_u8_value_MUX_uxn_device_h_l42_c2_c27c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l42_c2_c27c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l42_c2_c27c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l42_c2_c27c_return_output : unsigned(7 downto 0);

-- vram_addr_MUX[uxn_device_h_l42_c2_c27c]
signal vram_addr_MUX_uxn_device_h_l42_c2_c27c_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l42_c2_c27c_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l42_c2_c27c_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l42_c2_c27c_return_output : unsigned(31 downto 0);

-- ctrl_MUX[uxn_device_h_l42_c2_c27c]
signal ctrl_MUX_uxn_device_h_l42_c2_c27c_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l42_c2_c27c_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l42_c2_c27c_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l42_c2_c27c_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l42_c2_c27c]
signal color_MUX_uxn_device_h_l42_c2_c27c_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l42_c2_c27c_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l42_c2_c27c_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l42_c2_c27c_return_output : unsigned(3 downto 0);

-- layer_MUX[uxn_device_h_l42_c2_c27c]
signal layer_MUX_uxn_device_h_l42_c2_c27c_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l42_c2_c27c_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l42_c2_c27c_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l42_c2_c27c_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l42_c2_c27c]
signal y_MUX_uxn_device_h_l42_c2_c27c_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l42_c2_c27c_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l42_c2_c27c_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l42_c2_c27c_return_output : unsigned(15 downto 0);

-- flip_y_MUX[uxn_device_h_l42_c2_c27c]
signal flip_y_MUX_uxn_device_h_l42_c2_c27c_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l42_c2_c27c_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l42_c2_c27c_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l42_c2_c27c_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l42_c2_c27c]
signal ram_addr_MUX_uxn_device_h_l42_c2_c27c_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l42_c2_c27c_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l42_c2_c27c_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l42_c2_c27c_return_output : unsigned(15 downto 0);

-- is_sprite_port_MUX[uxn_device_h_l42_c2_c27c]
signal is_sprite_port_MUX_uxn_device_h_l42_c2_c27c_cond : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l42_c2_c27c_iftrue : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l42_c2_c27c_iffalse : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l42_c2_c27c_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l42_c2_c27c]
signal x_MUX_uxn_device_h_l42_c2_c27c_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l42_c2_c27c_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l42_c2_c27c_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l42_c2_c27c_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l42_c2_c27c]
signal auto_advance_MUX_uxn_device_h_l42_c2_c27c_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l42_c2_c27c_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l42_c2_c27c_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l42_c2_c27c_return_output : unsigned(7 downto 0);

-- flip_x_MUX[uxn_device_h_l42_c2_c27c]
signal flip_x_MUX_uxn_device_h_l42_c2_c27c_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l42_c2_c27c_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l42_c2_c27c_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l42_c2_c27c_return_output : unsigned(0 downto 0);

-- is_pixel_port_MUX[uxn_device_h_l42_c2_c27c]
signal is_pixel_port_MUX_uxn_device_h_l42_c2_c27c_cond : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l42_c2_c27c_iftrue : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l42_c2_c27c_iffalse : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l42_c2_c27c_return_output : unsigned(0 downto 0);

-- is_drawing_port_MUX[uxn_device_h_l42_c2_c27c]
signal is_drawing_port_MUX_uxn_device_h_l42_c2_c27c_cond : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l42_c2_c27c_iftrue : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l42_c2_c27c_iffalse : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l42_c2_c27c_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l42_c2_c27c]
signal ctrl_mode_MUX_uxn_device_h_l42_c2_c27c_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l42_c2_c27c_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l42_c2_c27c_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l42_c2_c27c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l43_c19_c5ea]
signal BIN_OP_EQ_uxn_device_h_l43_c19_c5ea_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l43_c19_c5ea_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l43_c19_c5ea_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l43_c19_f016]
signal MUX_uxn_device_h_l43_c19_f016_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l43_c19_f016_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l43_c19_f016_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l43_c19_f016_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l44_c20_fd38]
signal BIN_OP_EQ_uxn_device_h_l44_c20_fd38_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l44_c20_fd38_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l44_c20_fd38_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l44_c20_9375]
signal MUX_uxn_device_h_l44_c20_9375_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l44_c20_9375_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l44_c20_9375_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l44_c20_9375_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_device_h_l45_c21_23f8]
signal BIN_OP_OR_uxn_device_h_l45_c21_23f8_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l45_c21_23f8_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l45_c21_23f8_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l49_c3_de5f]
signal result_device_ram_address_MUX_uxn_device_h_l49_c3_de5f_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l49_c3_de5f_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l49_c3_de5f_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l49_c3_de5f_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l49_c3_de5f]
signal result_is_deo_done_MUX_uxn_device_h_l49_c3_de5f_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l49_c3_de5f_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l49_c3_de5f_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l49_c3_de5f_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l50_c32_ff36]
signal MUX_uxn_device_h_l50_c32_ff36_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l50_c32_ff36_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l50_c32_ff36_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l50_c32_ff36_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l56_c11_25a0]
signal BIN_OP_EQ_uxn_device_h_l56_c11_25a0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l56_c11_25a0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l56_c11_25a0_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l56_c7_f9d9]
signal result_is_vram_write_MUX_uxn_device_h_l56_c7_f9d9_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l56_c7_f9d9_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l56_c7_f9d9_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l56_c7_f9d9_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l56_c7_f9d9]
signal result_device_ram_address_MUX_uxn_device_h_l56_c7_f9d9_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l56_c7_f9d9_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l56_c7_f9d9_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l56_c7_f9d9_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l56_c7_f9d9]
signal result_is_deo_done_MUX_uxn_device_h_l56_c7_f9d9_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l56_c7_f9d9_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l56_c7_f9d9_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l56_c7_f9d9_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l56_c7_f9d9]
signal result_vram_write_layer_MUX_uxn_device_h_l56_c7_f9d9_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l56_c7_f9d9_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l56_c7_f9d9_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l56_c7_f9d9_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l56_c7_f9d9]
signal result_vram_address_MUX_uxn_device_h_l56_c7_f9d9_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l56_c7_f9d9_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l56_c7_f9d9_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l56_c7_f9d9_return_output : unsigned(31 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l56_c7_f9d9]
signal result_is_device_ram_write_MUX_uxn_device_h_l56_c7_f9d9_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l56_c7_f9d9_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l56_c7_f9d9_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l56_c7_f9d9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l56_c7_f9d9]
signal result_u8_value_MUX_uxn_device_h_l56_c7_f9d9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l56_c7_f9d9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l56_c7_f9d9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l56_c7_f9d9_return_output : unsigned(7 downto 0);

-- vram_addr_MUX[uxn_device_h_l56_c7_f9d9]
signal vram_addr_MUX_uxn_device_h_l56_c7_f9d9_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l56_c7_f9d9_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l56_c7_f9d9_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l56_c7_f9d9_return_output : unsigned(31 downto 0);

-- ctrl_MUX[uxn_device_h_l56_c7_f9d9]
signal ctrl_MUX_uxn_device_h_l56_c7_f9d9_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l56_c7_f9d9_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l56_c7_f9d9_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l56_c7_f9d9_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l56_c7_f9d9]
signal color_MUX_uxn_device_h_l56_c7_f9d9_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l56_c7_f9d9_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l56_c7_f9d9_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l56_c7_f9d9_return_output : unsigned(3 downto 0);

-- layer_MUX[uxn_device_h_l56_c7_f9d9]
signal layer_MUX_uxn_device_h_l56_c7_f9d9_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l56_c7_f9d9_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l56_c7_f9d9_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l56_c7_f9d9_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l56_c7_f9d9]
signal y_MUX_uxn_device_h_l56_c7_f9d9_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l56_c7_f9d9_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l56_c7_f9d9_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l56_c7_f9d9_return_output : unsigned(15 downto 0);

-- flip_y_MUX[uxn_device_h_l56_c7_f9d9]
signal flip_y_MUX_uxn_device_h_l56_c7_f9d9_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l56_c7_f9d9_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l56_c7_f9d9_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l56_c7_f9d9_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l56_c7_f9d9]
signal ram_addr_MUX_uxn_device_h_l56_c7_f9d9_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l56_c7_f9d9_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l56_c7_f9d9_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l56_c7_f9d9_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l56_c7_f9d9]
signal x_MUX_uxn_device_h_l56_c7_f9d9_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l56_c7_f9d9_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l56_c7_f9d9_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l56_c7_f9d9_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l56_c7_f9d9]
signal auto_advance_MUX_uxn_device_h_l56_c7_f9d9_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l56_c7_f9d9_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l56_c7_f9d9_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l56_c7_f9d9_return_output : unsigned(7 downto 0);

-- flip_x_MUX[uxn_device_h_l56_c7_f9d9]
signal flip_x_MUX_uxn_device_h_l56_c7_f9d9_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l56_c7_f9d9_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l56_c7_f9d9_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l56_c7_f9d9_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l56_c7_f9d9]
signal ctrl_mode_MUX_uxn_device_h_l56_c7_f9d9_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l56_c7_f9d9_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l56_c7_f9d9_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l56_c7_f9d9_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l57_c3_8f9c]
signal result_device_ram_address_MUX_uxn_device_h_l57_c3_8f9c_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l57_c3_8f9c_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l57_c3_8f9c_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l57_c3_8f9c_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l58_c32_3abd]
signal MUX_uxn_device_h_l58_c32_3abd_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l58_c32_3abd_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l58_c32_3abd_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l58_c32_3abd_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l61_c11_5e8f]
signal BIN_OP_EQ_uxn_device_h_l61_c11_5e8f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l61_c11_5e8f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l61_c11_5e8f_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l61_c7_5d0a]
signal result_is_vram_write_MUX_uxn_device_h_l61_c7_5d0a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l61_c7_5d0a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l61_c7_5d0a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l61_c7_5d0a_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l61_c7_5d0a]
signal result_device_ram_address_MUX_uxn_device_h_l61_c7_5d0a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l61_c7_5d0a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l61_c7_5d0a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l61_c7_5d0a_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l61_c7_5d0a]
signal result_is_deo_done_MUX_uxn_device_h_l61_c7_5d0a_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l61_c7_5d0a_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l61_c7_5d0a_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l61_c7_5d0a_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l61_c7_5d0a]
signal result_vram_write_layer_MUX_uxn_device_h_l61_c7_5d0a_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l61_c7_5d0a_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l61_c7_5d0a_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l61_c7_5d0a_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l61_c7_5d0a]
signal result_vram_address_MUX_uxn_device_h_l61_c7_5d0a_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l61_c7_5d0a_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l61_c7_5d0a_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l61_c7_5d0a_return_output : unsigned(31 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l61_c7_5d0a]
signal result_is_device_ram_write_MUX_uxn_device_h_l61_c7_5d0a_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l61_c7_5d0a_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l61_c7_5d0a_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l61_c7_5d0a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l61_c7_5d0a]
signal result_u8_value_MUX_uxn_device_h_l61_c7_5d0a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l61_c7_5d0a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l61_c7_5d0a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l61_c7_5d0a_return_output : unsigned(7 downto 0);

-- vram_addr_MUX[uxn_device_h_l61_c7_5d0a]
signal vram_addr_MUX_uxn_device_h_l61_c7_5d0a_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l61_c7_5d0a_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l61_c7_5d0a_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l61_c7_5d0a_return_output : unsigned(31 downto 0);

-- ctrl_MUX[uxn_device_h_l61_c7_5d0a]
signal ctrl_MUX_uxn_device_h_l61_c7_5d0a_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l61_c7_5d0a_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l61_c7_5d0a_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l61_c7_5d0a_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l61_c7_5d0a]
signal color_MUX_uxn_device_h_l61_c7_5d0a_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l61_c7_5d0a_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l61_c7_5d0a_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l61_c7_5d0a_return_output : unsigned(3 downto 0);

-- layer_MUX[uxn_device_h_l61_c7_5d0a]
signal layer_MUX_uxn_device_h_l61_c7_5d0a_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l61_c7_5d0a_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l61_c7_5d0a_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l61_c7_5d0a_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l61_c7_5d0a]
signal y_MUX_uxn_device_h_l61_c7_5d0a_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l61_c7_5d0a_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l61_c7_5d0a_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l61_c7_5d0a_return_output : unsigned(15 downto 0);

-- flip_y_MUX[uxn_device_h_l61_c7_5d0a]
signal flip_y_MUX_uxn_device_h_l61_c7_5d0a_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l61_c7_5d0a_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l61_c7_5d0a_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l61_c7_5d0a_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l61_c7_5d0a]
signal ram_addr_MUX_uxn_device_h_l61_c7_5d0a_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l61_c7_5d0a_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l61_c7_5d0a_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l61_c7_5d0a_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l61_c7_5d0a]
signal x_MUX_uxn_device_h_l61_c7_5d0a_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l61_c7_5d0a_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l61_c7_5d0a_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l61_c7_5d0a_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l61_c7_5d0a]
signal auto_advance_MUX_uxn_device_h_l61_c7_5d0a_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l61_c7_5d0a_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l61_c7_5d0a_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l61_c7_5d0a_return_output : unsigned(7 downto 0);

-- flip_x_MUX[uxn_device_h_l61_c7_5d0a]
signal flip_x_MUX_uxn_device_h_l61_c7_5d0a_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l61_c7_5d0a_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l61_c7_5d0a_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l61_c7_5d0a_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l61_c7_5d0a]
signal ctrl_mode_MUX_uxn_device_h_l61_c7_5d0a_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l61_c7_5d0a_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l61_c7_5d0a_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l61_c7_5d0a_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l62_c3_6024]
signal result_device_ram_address_MUX_uxn_device_h_l62_c3_6024_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l62_c3_6024_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l62_c3_6024_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l62_c3_6024_return_output : unsigned(7 downto 0);

-- ctrl_MUX[uxn_device_h_l62_c3_6024]
signal ctrl_MUX_uxn_device_h_l62_c3_6024_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l62_c3_6024_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l62_c3_6024_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l62_c3_6024_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l62_c3_6024]
signal color_MUX_uxn_device_h_l62_c3_6024_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l62_c3_6024_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l62_c3_6024_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l62_c3_6024_return_output : unsigned(3 downto 0);

-- layer_MUX[uxn_device_h_l62_c3_6024]
signal layer_MUX_uxn_device_h_l62_c3_6024_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l62_c3_6024_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l62_c3_6024_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l62_c3_6024_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l62_c3_6024]
signal flip_y_MUX_uxn_device_h_l62_c3_6024_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l62_c3_6024_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l62_c3_6024_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l62_c3_6024_return_output : unsigned(0 downto 0);

-- flip_x_MUX[uxn_device_h_l62_c3_6024]
signal flip_x_MUX_uxn_device_h_l62_c3_6024_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l62_c3_6024_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l62_c3_6024_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l62_c3_6024_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l62_c3_6024]
signal ctrl_mode_MUX_uxn_device_h_l62_c3_6024_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l62_c3_6024_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l62_c3_6024_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l62_c3_6024_return_output : unsigned(0 downto 0);

-- CONST_SR_7[uxn_device_h_l65_c26_808b]
signal CONST_SR_7_uxn_device_h_l65_c26_808b_x : unsigned(7 downto 0);
signal CONST_SR_7_uxn_device_h_l65_c26_808b_return_output : unsigned(7 downto 0);

-- CONST_SR_6[uxn_device_h_l66_c22_77cc]
signal CONST_SR_6_uxn_device_h_l66_c22_77cc_x : unsigned(7 downto 0);
signal CONST_SR_6_uxn_device_h_l66_c22_77cc_return_output : unsigned(7 downto 0);

-- CONST_SR_5[uxn_device_h_l67_c23_34f6]
signal CONST_SR_5_uxn_device_h_l67_c23_34f6_x : unsigned(7 downto 0);
signal CONST_SR_5_uxn_device_h_l67_c23_34f6_return_output : unsigned(7 downto 0);

-- CONST_SR_4[uxn_device_h_l68_c23_0abd]
signal CONST_SR_4_uxn_device_h_l68_c23_0abd_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_device_h_l68_c23_0abd_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l72_c11_b403]
signal BIN_OP_EQ_uxn_device_h_l72_c11_b403_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l72_c11_b403_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l72_c11_b403_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l72_c7_470e]
signal result_is_vram_write_MUX_uxn_device_h_l72_c7_470e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l72_c7_470e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l72_c7_470e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l72_c7_470e_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l72_c7_470e]
signal result_device_ram_address_MUX_uxn_device_h_l72_c7_470e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l72_c7_470e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l72_c7_470e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l72_c7_470e_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l72_c7_470e]
signal result_is_deo_done_MUX_uxn_device_h_l72_c7_470e_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l72_c7_470e_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l72_c7_470e_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l72_c7_470e_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l72_c7_470e]
signal result_vram_write_layer_MUX_uxn_device_h_l72_c7_470e_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l72_c7_470e_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l72_c7_470e_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l72_c7_470e_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l72_c7_470e]
signal result_vram_address_MUX_uxn_device_h_l72_c7_470e_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l72_c7_470e_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l72_c7_470e_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l72_c7_470e_return_output : unsigned(31 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l72_c7_470e]
signal result_is_device_ram_write_MUX_uxn_device_h_l72_c7_470e_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l72_c7_470e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l72_c7_470e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l72_c7_470e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l72_c7_470e]
signal result_u8_value_MUX_uxn_device_h_l72_c7_470e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l72_c7_470e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l72_c7_470e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l72_c7_470e_return_output : unsigned(7 downto 0);

-- vram_addr_MUX[uxn_device_h_l72_c7_470e]
signal vram_addr_MUX_uxn_device_h_l72_c7_470e_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l72_c7_470e_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l72_c7_470e_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l72_c7_470e_return_output : unsigned(31 downto 0);

-- y_MUX[uxn_device_h_l72_c7_470e]
signal y_MUX_uxn_device_h_l72_c7_470e_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l72_c7_470e_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l72_c7_470e_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l72_c7_470e_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l72_c7_470e]
signal ram_addr_MUX_uxn_device_h_l72_c7_470e_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l72_c7_470e_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l72_c7_470e_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l72_c7_470e_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l72_c7_470e]
signal x_MUX_uxn_device_h_l72_c7_470e_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l72_c7_470e_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l72_c7_470e_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l72_c7_470e_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l72_c7_470e]
signal auto_advance_MUX_uxn_device_h_l72_c7_470e_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l72_c7_470e_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l72_c7_470e_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l72_c7_470e_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l73_c3_d1e7]
signal result_device_ram_address_MUX_uxn_device_h_l73_c3_d1e7_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l73_c3_d1e7_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l73_c3_d1e7_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l73_c3_d1e7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l77_c11_545d]
signal BIN_OP_EQ_uxn_device_h_l77_c11_545d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l77_c11_545d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l77_c11_545d_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l77_c7_76e7]
signal result_is_vram_write_MUX_uxn_device_h_l77_c7_76e7_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l77_c7_76e7_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l77_c7_76e7_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l77_c7_76e7_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l77_c7_76e7]
signal result_device_ram_address_MUX_uxn_device_h_l77_c7_76e7_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l77_c7_76e7_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l77_c7_76e7_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l77_c7_76e7_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l77_c7_76e7]
signal result_is_deo_done_MUX_uxn_device_h_l77_c7_76e7_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l77_c7_76e7_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l77_c7_76e7_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l77_c7_76e7_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l77_c7_76e7]
signal result_vram_write_layer_MUX_uxn_device_h_l77_c7_76e7_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l77_c7_76e7_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l77_c7_76e7_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l77_c7_76e7_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l77_c7_76e7]
signal result_vram_address_MUX_uxn_device_h_l77_c7_76e7_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l77_c7_76e7_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l77_c7_76e7_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l77_c7_76e7_return_output : unsigned(31 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l77_c7_76e7]
signal result_is_device_ram_write_MUX_uxn_device_h_l77_c7_76e7_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l77_c7_76e7_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l77_c7_76e7_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l77_c7_76e7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l77_c7_76e7]
signal result_u8_value_MUX_uxn_device_h_l77_c7_76e7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l77_c7_76e7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l77_c7_76e7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l77_c7_76e7_return_output : unsigned(7 downto 0);

-- vram_addr_MUX[uxn_device_h_l77_c7_76e7]
signal vram_addr_MUX_uxn_device_h_l77_c7_76e7_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l77_c7_76e7_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l77_c7_76e7_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l77_c7_76e7_return_output : unsigned(31 downto 0);

-- y_MUX[uxn_device_h_l77_c7_76e7]
signal y_MUX_uxn_device_h_l77_c7_76e7_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l77_c7_76e7_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l77_c7_76e7_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l77_c7_76e7_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l77_c7_76e7]
signal ram_addr_MUX_uxn_device_h_l77_c7_76e7_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l77_c7_76e7_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l77_c7_76e7_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l77_c7_76e7_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l77_c7_76e7]
signal x_MUX_uxn_device_h_l77_c7_76e7_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l77_c7_76e7_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l77_c7_76e7_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l77_c7_76e7_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l77_c7_76e7]
signal auto_advance_MUX_uxn_device_h_l77_c7_76e7_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l77_c7_76e7_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l77_c7_76e7_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l77_c7_76e7_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l78_c3_a3e7]
signal result_device_ram_address_MUX_uxn_device_h_l78_c3_a3e7_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l78_c3_a3e7_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l78_c3_a3e7_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l78_c3_a3e7_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l78_c3_a3e7]
signal x_MUX_uxn_device_h_l78_c3_a3e7_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l78_c3_a3e7_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l78_c3_a3e7_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l78_c3_a3e7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l84_c11_61bb]
signal BIN_OP_EQ_uxn_device_h_l84_c11_61bb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l84_c11_61bb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l84_c11_61bb_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l84_c7_0b55]
signal result_is_vram_write_MUX_uxn_device_h_l84_c7_0b55_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l84_c7_0b55_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l84_c7_0b55_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l84_c7_0b55_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l84_c7_0b55]
signal result_device_ram_address_MUX_uxn_device_h_l84_c7_0b55_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l84_c7_0b55_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l84_c7_0b55_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l84_c7_0b55_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l84_c7_0b55]
signal result_is_deo_done_MUX_uxn_device_h_l84_c7_0b55_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l84_c7_0b55_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l84_c7_0b55_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l84_c7_0b55_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l84_c7_0b55]
signal result_vram_write_layer_MUX_uxn_device_h_l84_c7_0b55_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l84_c7_0b55_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l84_c7_0b55_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l84_c7_0b55_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l84_c7_0b55]
signal result_vram_address_MUX_uxn_device_h_l84_c7_0b55_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l84_c7_0b55_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l84_c7_0b55_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l84_c7_0b55_return_output : unsigned(31 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l84_c7_0b55]
signal result_is_device_ram_write_MUX_uxn_device_h_l84_c7_0b55_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l84_c7_0b55_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l84_c7_0b55_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l84_c7_0b55_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l84_c7_0b55]
signal result_u8_value_MUX_uxn_device_h_l84_c7_0b55_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l84_c7_0b55_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l84_c7_0b55_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l84_c7_0b55_return_output : unsigned(7 downto 0);

-- vram_addr_MUX[uxn_device_h_l84_c7_0b55]
signal vram_addr_MUX_uxn_device_h_l84_c7_0b55_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l84_c7_0b55_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l84_c7_0b55_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l84_c7_0b55_return_output : unsigned(31 downto 0);

-- y_MUX[uxn_device_h_l84_c7_0b55]
signal y_MUX_uxn_device_h_l84_c7_0b55_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l84_c7_0b55_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l84_c7_0b55_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l84_c7_0b55_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l84_c7_0b55]
signal ram_addr_MUX_uxn_device_h_l84_c7_0b55_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l84_c7_0b55_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l84_c7_0b55_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l84_c7_0b55_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l84_c7_0b55]
signal x_MUX_uxn_device_h_l84_c7_0b55_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l84_c7_0b55_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l84_c7_0b55_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l84_c7_0b55_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l84_c7_0b55]
signal auto_advance_MUX_uxn_device_h_l84_c7_0b55_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l84_c7_0b55_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l84_c7_0b55_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l84_c7_0b55_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l85_c3_de64]
signal result_device_ram_address_MUX_uxn_device_h_l85_c3_de64_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l85_c3_de64_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l85_c3_de64_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l85_c3_de64_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l89_c11_bbd0]
signal BIN_OP_EQ_uxn_device_h_l89_c11_bbd0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l89_c11_bbd0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l89_c11_bbd0_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l89_c7_6231]
signal result_is_vram_write_MUX_uxn_device_h_l89_c7_6231_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l89_c7_6231_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l89_c7_6231_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l89_c7_6231_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l89_c7_6231]
signal result_device_ram_address_MUX_uxn_device_h_l89_c7_6231_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l89_c7_6231_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l89_c7_6231_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l89_c7_6231_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l89_c7_6231]
signal result_is_deo_done_MUX_uxn_device_h_l89_c7_6231_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l89_c7_6231_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l89_c7_6231_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l89_c7_6231_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l89_c7_6231]
signal result_vram_write_layer_MUX_uxn_device_h_l89_c7_6231_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l89_c7_6231_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l89_c7_6231_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l89_c7_6231_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l89_c7_6231]
signal result_vram_address_MUX_uxn_device_h_l89_c7_6231_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l89_c7_6231_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l89_c7_6231_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l89_c7_6231_return_output : unsigned(31 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l89_c7_6231]
signal result_is_device_ram_write_MUX_uxn_device_h_l89_c7_6231_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l89_c7_6231_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l89_c7_6231_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l89_c7_6231_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l89_c7_6231]
signal result_u8_value_MUX_uxn_device_h_l89_c7_6231_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l89_c7_6231_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l89_c7_6231_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l89_c7_6231_return_output : unsigned(7 downto 0);

-- vram_addr_MUX[uxn_device_h_l89_c7_6231]
signal vram_addr_MUX_uxn_device_h_l89_c7_6231_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l89_c7_6231_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l89_c7_6231_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l89_c7_6231_return_output : unsigned(31 downto 0);

-- y_MUX[uxn_device_h_l89_c7_6231]
signal y_MUX_uxn_device_h_l89_c7_6231_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l89_c7_6231_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l89_c7_6231_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l89_c7_6231_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l89_c7_6231]
signal ram_addr_MUX_uxn_device_h_l89_c7_6231_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l89_c7_6231_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l89_c7_6231_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l89_c7_6231_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l89_c7_6231]
signal x_MUX_uxn_device_h_l89_c7_6231_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l89_c7_6231_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l89_c7_6231_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l89_c7_6231_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l89_c7_6231]
signal auto_advance_MUX_uxn_device_h_l89_c7_6231_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l89_c7_6231_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l89_c7_6231_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l89_c7_6231_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l90_c3_5121]
signal result_device_ram_address_MUX_uxn_device_h_l90_c3_5121_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l90_c3_5121_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l90_c3_5121_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l90_c3_5121_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l90_c3_5121]
signal x_MUX_uxn_device_h_l90_c3_5121_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l90_c3_5121_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l90_c3_5121_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l90_c3_5121_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_device_h_l91_c4_d5a5]
signal BIN_OP_OR_uxn_device_h_l91_c4_d5a5_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l91_c4_d5a5_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l91_c4_d5a5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l95_c11_9959]
signal BIN_OP_EQ_uxn_device_h_l95_c11_9959_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l95_c11_9959_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l95_c11_9959_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l95_c7_f81e]
signal result_is_vram_write_MUX_uxn_device_h_l95_c7_f81e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l95_c7_f81e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l95_c7_f81e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l95_c7_f81e_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l95_c7_f81e]
signal result_device_ram_address_MUX_uxn_device_h_l95_c7_f81e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l95_c7_f81e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l95_c7_f81e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l95_c7_f81e_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l95_c7_f81e]
signal result_is_deo_done_MUX_uxn_device_h_l95_c7_f81e_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l95_c7_f81e_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l95_c7_f81e_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l95_c7_f81e_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l95_c7_f81e]
signal result_vram_write_layer_MUX_uxn_device_h_l95_c7_f81e_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l95_c7_f81e_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l95_c7_f81e_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l95_c7_f81e_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l95_c7_f81e]
signal result_vram_address_MUX_uxn_device_h_l95_c7_f81e_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l95_c7_f81e_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l95_c7_f81e_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l95_c7_f81e_return_output : unsigned(31 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l95_c7_f81e]
signal result_is_device_ram_write_MUX_uxn_device_h_l95_c7_f81e_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l95_c7_f81e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l95_c7_f81e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l95_c7_f81e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l95_c7_f81e]
signal result_u8_value_MUX_uxn_device_h_l95_c7_f81e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l95_c7_f81e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l95_c7_f81e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l95_c7_f81e_return_output : unsigned(7 downto 0);

-- vram_addr_MUX[uxn_device_h_l95_c7_f81e]
signal vram_addr_MUX_uxn_device_h_l95_c7_f81e_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l95_c7_f81e_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l95_c7_f81e_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l95_c7_f81e_return_output : unsigned(31 downto 0);

-- y_MUX[uxn_device_h_l95_c7_f81e]
signal y_MUX_uxn_device_h_l95_c7_f81e_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l95_c7_f81e_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l95_c7_f81e_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l95_c7_f81e_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l95_c7_f81e]
signal ram_addr_MUX_uxn_device_h_l95_c7_f81e_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l95_c7_f81e_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l95_c7_f81e_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l95_c7_f81e_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l95_c7_f81e]
signal x_MUX_uxn_device_h_l95_c7_f81e_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l95_c7_f81e_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l95_c7_f81e_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l95_c7_f81e_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l95_c7_f81e]
signal auto_advance_MUX_uxn_device_h_l95_c7_f81e_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l95_c7_f81e_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l95_c7_f81e_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l95_c7_f81e_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l96_c3_6c51]
signal result_device_ram_address_MUX_uxn_device_h_l96_c3_6c51_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l96_c3_6c51_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l96_c3_6c51_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l96_c3_6c51_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l100_c11_e32a]
signal BIN_OP_EQ_uxn_device_h_l100_c11_e32a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l100_c11_e32a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l100_c11_e32a_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l100_c7_ba7b]
signal result_is_vram_write_MUX_uxn_device_h_l100_c7_ba7b_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l100_c7_ba7b_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l100_c7_ba7b_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l100_c7_ba7b_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l100_c7_ba7b]
signal result_device_ram_address_MUX_uxn_device_h_l100_c7_ba7b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l100_c7_ba7b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l100_c7_ba7b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l100_c7_ba7b_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l100_c7_ba7b]
signal result_is_deo_done_MUX_uxn_device_h_l100_c7_ba7b_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l100_c7_ba7b_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l100_c7_ba7b_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l100_c7_ba7b_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l100_c7_ba7b]
signal result_vram_write_layer_MUX_uxn_device_h_l100_c7_ba7b_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l100_c7_ba7b_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l100_c7_ba7b_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l100_c7_ba7b_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l100_c7_ba7b]
signal result_vram_address_MUX_uxn_device_h_l100_c7_ba7b_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l100_c7_ba7b_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l100_c7_ba7b_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l100_c7_ba7b_return_output : unsigned(31 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l100_c7_ba7b]
signal result_is_device_ram_write_MUX_uxn_device_h_l100_c7_ba7b_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l100_c7_ba7b_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l100_c7_ba7b_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l100_c7_ba7b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l100_c7_ba7b]
signal result_u8_value_MUX_uxn_device_h_l100_c7_ba7b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l100_c7_ba7b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l100_c7_ba7b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l100_c7_ba7b_return_output : unsigned(7 downto 0);

-- vram_addr_MUX[uxn_device_h_l100_c7_ba7b]
signal vram_addr_MUX_uxn_device_h_l100_c7_ba7b_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l100_c7_ba7b_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l100_c7_ba7b_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l100_c7_ba7b_return_output : unsigned(31 downto 0);

-- y_MUX[uxn_device_h_l100_c7_ba7b]
signal y_MUX_uxn_device_h_l100_c7_ba7b_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l100_c7_ba7b_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l100_c7_ba7b_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l100_c7_ba7b_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l100_c7_ba7b]
signal ram_addr_MUX_uxn_device_h_l100_c7_ba7b_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l100_c7_ba7b_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l100_c7_ba7b_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l100_c7_ba7b_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l100_c7_ba7b]
signal x_MUX_uxn_device_h_l100_c7_ba7b_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l100_c7_ba7b_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l100_c7_ba7b_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l100_c7_ba7b_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l100_c7_ba7b]
signal auto_advance_MUX_uxn_device_h_l100_c7_ba7b_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l100_c7_ba7b_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l100_c7_ba7b_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l100_c7_ba7b_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l101_c3_18ac]
signal result_device_ram_address_MUX_uxn_device_h_l101_c3_18ac_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l101_c3_18ac_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l101_c3_18ac_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l101_c3_18ac_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l101_c3_18ac]
signal y_MUX_uxn_device_h_l101_c3_18ac_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l101_c3_18ac_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l101_c3_18ac_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l101_c3_18ac_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l107_c11_dfe7]
signal BIN_OP_EQ_uxn_device_h_l107_c11_dfe7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l107_c11_dfe7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l107_c11_dfe7_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l107_c7_5fb4]
signal result_is_vram_write_MUX_uxn_device_h_l107_c7_5fb4_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l107_c7_5fb4_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l107_c7_5fb4_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l107_c7_5fb4_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l107_c7_5fb4]
signal result_device_ram_address_MUX_uxn_device_h_l107_c7_5fb4_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l107_c7_5fb4_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l107_c7_5fb4_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l107_c7_5fb4_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l107_c7_5fb4]
signal result_is_deo_done_MUX_uxn_device_h_l107_c7_5fb4_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l107_c7_5fb4_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l107_c7_5fb4_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l107_c7_5fb4_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l107_c7_5fb4]
signal result_vram_write_layer_MUX_uxn_device_h_l107_c7_5fb4_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l107_c7_5fb4_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l107_c7_5fb4_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l107_c7_5fb4_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l107_c7_5fb4]
signal result_vram_address_MUX_uxn_device_h_l107_c7_5fb4_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l107_c7_5fb4_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l107_c7_5fb4_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l107_c7_5fb4_return_output : unsigned(31 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l107_c7_5fb4]
signal result_is_device_ram_write_MUX_uxn_device_h_l107_c7_5fb4_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l107_c7_5fb4_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l107_c7_5fb4_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l107_c7_5fb4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l107_c7_5fb4]
signal result_u8_value_MUX_uxn_device_h_l107_c7_5fb4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l107_c7_5fb4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l107_c7_5fb4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l107_c7_5fb4_return_output : unsigned(7 downto 0);

-- vram_addr_MUX[uxn_device_h_l107_c7_5fb4]
signal vram_addr_MUX_uxn_device_h_l107_c7_5fb4_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l107_c7_5fb4_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l107_c7_5fb4_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l107_c7_5fb4_return_output : unsigned(31 downto 0);

-- y_MUX[uxn_device_h_l107_c7_5fb4]
signal y_MUX_uxn_device_h_l107_c7_5fb4_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l107_c7_5fb4_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l107_c7_5fb4_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l107_c7_5fb4_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l107_c7_5fb4]
signal ram_addr_MUX_uxn_device_h_l107_c7_5fb4_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l107_c7_5fb4_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l107_c7_5fb4_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l107_c7_5fb4_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l107_c7_5fb4]
signal x_MUX_uxn_device_h_l107_c7_5fb4_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l107_c7_5fb4_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l107_c7_5fb4_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l107_c7_5fb4_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l107_c7_5fb4]
signal auto_advance_MUX_uxn_device_h_l107_c7_5fb4_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l107_c7_5fb4_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l107_c7_5fb4_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l107_c7_5fb4_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l108_c3_ef31]
signal result_device_ram_address_MUX_uxn_device_h_l108_c3_ef31_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l108_c3_ef31_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l108_c3_ef31_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l108_c3_ef31_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l112_c11_8544]
signal BIN_OP_EQ_uxn_device_h_l112_c11_8544_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l112_c11_8544_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l112_c11_8544_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l112_c7_82e8]
signal result_is_vram_write_MUX_uxn_device_h_l112_c7_82e8_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l112_c7_82e8_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l112_c7_82e8_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l112_c7_82e8_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l112_c7_82e8]
signal result_device_ram_address_MUX_uxn_device_h_l112_c7_82e8_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l112_c7_82e8_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l112_c7_82e8_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l112_c7_82e8_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l112_c7_82e8]
signal result_is_deo_done_MUX_uxn_device_h_l112_c7_82e8_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l112_c7_82e8_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l112_c7_82e8_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l112_c7_82e8_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l112_c7_82e8]
signal result_vram_write_layer_MUX_uxn_device_h_l112_c7_82e8_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l112_c7_82e8_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l112_c7_82e8_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l112_c7_82e8_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l112_c7_82e8]
signal result_vram_address_MUX_uxn_device_h_l112_c7_82e8_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l112_c7_82e8_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l112_c7_82e8_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l112_c7_82e8_return_output : unsigned(31 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l112_c7_82e8]
signal result_is_device_ram_write_MUX_uxn_device_h_l112_c7_82e8_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l112_c7_82e8_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l112_c7_82e8_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l112_c7_82e8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l112_c7_82e8]
signal result_u8_value_MUX_uxn_device_h_l112_c7_82e8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l112_c7_82e8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l112_c7_82e8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l112_c7_82e8_return_output : unsigned(7 downto 0);

-- vram_addr_MUX[uxn_device_h_l112_c7_82e8]
signal vram_addr_MUX_uxn_device_h_l112_c7_82e8_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l112_c7_82e8_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l112_c7_82e8_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l112_c7_82e8_return_output : unsigned(31 downto 0);

-- y_MUX[uxn_device_h_l112_c7_82e8]
signal y_MUX_uxn_device_h_l112_c7_82e8_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l112_c7_82e8_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l112_c7_82e8_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l112_c7_82e8_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l112_c7_82e8]
signal ram_addr_MUX_uxn_device_h_l112_c7_82e8_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l112_c7_82e8_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l112_c7_82e8_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l112_c7_82e8_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l112_c7_82e8]
signal x_MUX_uxn_device_h_l112_c7_82e8_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l112_c7_82e8_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l112_c7_82e8_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l112_c7_82e8_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l112_c7_82e8]
signal auto_advance_MUX_uxn_device_h_l112_c7_82e8_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l112_c7_82e8_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l112_c7_82e8_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l112_c7_82e8_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l113_c3_c338]
signal result_device_ram_address_MUX_uxn_device_h_l113_c3_c338_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l113_c3_c338_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l113_c3_c338_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l113_c3_c338_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l113_c3_c338]
signal y_MUX_uxn_device_h_l113_c3_c338_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l113_c3_c338_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l113_c3_c338_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l113_c3_c338_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_device_h_l114_c4_7cc1]
signal BIN_OP_OR_uxn_device_h_l114_c4_7cc1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l114_c4_7cc1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l114_c4_7cc1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l118_c11_03cb]
signal BIN_OP_EQ_uxn_device_h_l118_c11_03cb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l118_c11_03cb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l118_c11_03cb_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l118_c7_d5ea]
signal result_is_vram_write_MUX_uxn_device_h_l118_c7_d5ea_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l118_c7_d5ea_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l118_c7_d5ea_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l118_c7_d5ea_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l118_c7_d5ea]
signal result_device_ram_address_MUX_uxn_device_h_l118_c7_d5ea_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l118_c7_d5ea_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l118_c7_d5ea_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l118_c7_d5ea_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l118_c7_d5ea]
signal result_is_deo_done_MUX_uxn_device_h_l118_c7_d5ea_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l118_c7_d5ea_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l118_c7_d5ea_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l118_c7_d5ea_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l118_c7_d5ea]
signal result_vram_write_layer_MUX_uxn_device_h_l118_c7_d5ea_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l118_c7_d5ea_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l118_c7_d5ea_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l118_c7_d5ea_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l118_c7_d5ea]
signal result_vram_address_MUX_uxn_device_h_l118_c7_d5ea_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l118_c7_d5ea_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l118_c7_d5ea_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l118_c7_d5ea_return_output : unsigned(31 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l118_c7_d5ea]
signal result_is_device_ram_write_MUX_uxn_device_h_l118_c7_d5ea_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l118_c7_d5ea_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l118_c7_d5ea_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l118_c7_d5ea_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l118_c7_d5ea]
signal result_u8_value_MUX_uxn_device_h_l118_c7_d5ea_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l118_c7_d5ea_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l118_c7_d5ea_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l118_c7_d5ea_return_output : unsigned(7 downto 0);

-- vram_addr_MUX[uxn_device_h_l118_c7_d5ea]
signal vram_addr_MUX_uxn_device_h_l118_c7_d5ea_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l118_c7_d5ea_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l118_c7_d5ea_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l118_c7_d5ea_return_output : unsigned(31 downto 0);

-- ram_addr_MUX[uxn_device_h_l118_c7_d5ea]
signal ram_addr_MUX_uxn_device_h_l118_c7_d5ea_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l118_c7_d5ea_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l118_c7_d5ea_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l118_c7_d5ea_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l118_c7_d5ea]
signal x_MUX_uxn_device_h_l118_c7_d5ea_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l118_c7_d5ea_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l118_c7_d5ea_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l118_c7_d5ea_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l118_c7_d5ea]
signal auto_advance_MUX_uxn_device_h_l118_c7_d5ea_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l118_c7_d5ea_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l118_c7_d5ea_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l118_c7_d5ea_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l119_c3_4341]
signal result_device_ram_address_MUX_uxn_device_h_l119_c3_4341_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l119_c3_4341_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l119_c3_4341_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l119_c3_4341_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l119_c3_4341]
signal result_is_deo_done_MUX_uxn_device_h_l119_c3_4341_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l119_c3_4341_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l119_c3_4341_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l119_c3_4341_return_output : unsigned(0 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l120_c27_178e]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l120_c27_178e_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l120_c27_178e_right : unsigned(8 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l120_c27_178e_return_output : unsigned(24 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l120_c27_9ccd]
signal BIN_OP_PLUS_uxn_device_h_l120_c27_9ccd_left : unsigned(24 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l120_c27_9ccd_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l120_c27_9ccd_return_output : unsigned(25 downto 0);

-- BIN_OP_GT[uxn_device_h_l120_c27_02fe]
signal BIN_OP_GT_uxn_device_h_l120_c27_02fe_left : unsigned(25 downto 0);
signal BIN_OP_GT_uxn_device_h_l120_c27_02fe_right : unsigned(17 downto 0);
signal BIN_OP_GT_uxn_device_h_l120_c27_02fe_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l120_c27_2a91]
signal MUX_uxn_device_h_l120_c27_2a91_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l120_c27_2a91_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l120_c27_2a91_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l120_c27_2a91_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l124_c11_e7bd]
signal BIN_OP_EQ_uxn_device_h_l124_c11_e7bd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l124_c11_e7bd_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l124_c11_e7bd_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l124_c7_3d44]
signal result_is_vram_write_MUX_uxn_device_h_l124_c7_3d44_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l124_c7_3d44_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l124_c7_3d44_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l124_c7_3d44_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l124_c7_3d44]
signal result_device_ram_address_MUX_uxn_device_h_l124_c7_3d44_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l124_c7_3d44_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l124_c7_3d44_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l124_c7_3d44_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l124_c7_3d44]
signal result_is_deo_done_MUX_uxn_device_h_l124_c7_3d44_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l124_c7_3d44_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l124_c7_3d44_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l124_c7_3d44_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l124_c7_3d44]
signal result_vram_write_layer_MUX_uxn_device_h_l124_c7_3d44_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l124_c7_3d44_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l124_c7_3d44_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l124_c7_3d44_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l124_c7_3d44]
signal result_vram_address_MUX_uxn_device_h_l124_c7_3d44_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l124_c7_3d44_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l124_c7_3d44_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l124_c7_3d44_return_output : unsigned(31 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l124_c7_3d44]
signal result_is_device_ram_write_MUX_uxn_device_h_l124_c7_3d44_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l124_c7_3d44_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l124_c7_3d44_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l124_c7_3d44_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l124_c7_3d44]
signal result_u8_value_MUX_uxn_device_h_l124_c7_3d44_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l124_c7_3d44_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l124_c7_3d44_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l124_c7_3d44_return_output : unsigned(7 downto 0);

-- vram_addr_MUX[uxn_device_h_l124_c7_3d44]
signal vram_addr_MUX_uxn_device_h_l124_c7_3d44_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l124_c7_3d44_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l124_c7_3d44_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l124_c7_3d44_return_output : unsigned(31 downto 0);

-- ram_addr_MUX[uxn_device_h_l124_c7_3d44]
signal ram_addr_MUX_uxn_device_h_l124_c7_3d44_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l124_c7_3d44_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l124_c7_3d44_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l124_c7_3d44_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l124_c7_3d44]
signal x_MUX_uxn_device_h_l124_c7_3d44_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l124_c7_3d44_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l124_c7_3d44_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l124_c7_3d44_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l124_c7_3d44]
signal auto_advance_MUX_uxn_device_h_l124_c7_3d44_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l124_c7_3d44_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l124_c7_3d44_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l124_c7_3d44_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l125_c3_2150]
signal result_device_ram_address_MUX_uxn_device_h_l125_c3_2150_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l125_c3_2150_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l125_c3_2150_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l125_c3_2150_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l125_c3_2150]
signal result_vram_write_layer_MUX_uxn_device_h_l125_c3_2150_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l125_c3_2150_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l125_c3_2150_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l125_c3_2150_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l125_c3_2150]
signal result_vram_address_MUX_uxn_device_h_l125_c3_2150_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l125_c3_2150_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l125_c3_2150_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l125_c3_2150_return_output : unsigned(31 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l125_c3_2150]
signal result_is_vram_write_MUX_uxn_device_h_l125_c3_2150_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l125_c3_2150_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l125_c3_2150_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l125_c3_2150_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l125_c3_2150]
signal result_u8_value_MUX_uxn_device_h_l125_c3_2150_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l125_c3_2150_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l125_c3_2150_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l125_c3_2150_return_output : unsigned(7 downto 0);

-- vram_addr_MUX[uxn_device_h_l125_c3_2150]
signal vram_addr_MUX_uxn_device_h_l125_c3_2150_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l125_c3_2150_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l125_c3_2150_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l125_c3_2150_return_output : unsigned(31 downto 0);

-- auto_advance_MUX[uxn_device_h_l125_c3_2150]
signal auto_advance_MUX_uxn_device_h_l125_c3_2150_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l125_c3_2150_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l125_c3_2150_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l125_c3_2150_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l128_c32_8870]
signal BIN_OP_AND_uxn_device_h_l128_c32_8870_left : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l128_c32_8870_right : unsigned(1 downto 0);
signal BIN_OP_AND_uxn_device_h_l128_c32_8870_return_output : unsigned(3 downto 0);

-- result_vram_address_MUX[uxn_device_h_l131_c4_1268]
signal result_vram_address_MUX_uxn_device_h_l131_c4_1268_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l131_c4_1268_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l131_c4_1268_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l131_c4_1268_return_output : unsigned(31 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l131_c4_1268]
signal result_is_vram_write_MUX_uxn_device_h_l131_c4_1268_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l131_c4_1268_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l131_c4_1268_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l131_c4_1268_return_output : unsigned(0 downto 0);

-- vram_addr_MUX[uxn_device_h_l131_c4_1268]
signal vram_addr_MUX_uxn_device_h_l131_c4_1268_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l131_c4_1268_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l131_c4_1268_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l131_c4_1268_return_output : unsigned(31 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l132_c18_50dd]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l132_c18_50dd_left : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l132_c18_50dd_right : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l132_c18_50dd_return_output : unsigned(63 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l132_c18_3dfa]
signal BIN_OP_PLUS_uxn_device_h_l132_c18_3dfa_left : unsigned(63 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l132_c18_3dfa_right : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l132_c18_3dfa_return_output : unsigned(64 downto 0);

-- BIN_OP_AND[uxn_device_h_l133_c5_ae09]
signal BIN_OP_AND_uxn_device_h_l133_c5_ae09_left : unsigned(31 downto 0);
signal BIN_OP_AND_uxn_device_h_l133_c5_ae09_right : unsigned(17 downto 0);
signal BIN_OP_AND_uxn_device_h_l133_c5_ae09_return_output : unsigned(31 downto 0);

-- MUX[uxn_device_h_l134_c19_0b0f]
signal MUX_uxn_device_h_l134_c19_0b0f_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l134_c19_0b0f_iftrue : unsigned(20 downto 0);
signal MUX_uxn_device_h_l134_c19_0b0f_iffalse : unsigned(20 downto 0);
signal MUX_uxn_device_h_l134_c19_0b0f_return_output : unsigned(20 downto 0);

-- BIN_OP_OR[uxn_device_h_l134_c5_1182]
signal BIN_OP_OR_uxn_device_h_l134_c5_1182_left : unsigned(31 downto 0);
signal BIN_OP_OR_uxn_device_h_l134_c5_1182_right : unsigned(20 downto 0);
signal BIN_OP_OR_uxn_device_h_l134_c5_1182_return_output : unsigned(31 downto 0);

-- MUX[uxn_device_h_l135_c19_5967]
signal MUX_uxn_device_h_l135_c19_5967_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l135_c19_5967_iftrue : unsigned(21 downto 0);
signal MUX_uxn_device_h_l135_c19_5967_iffalse : unsigned(21 downto 0);
signal MUX_uxn_device_h_l135_c19_5967_return_output : unsigned(21 downto 0);

-- BIN_OP_OR[uxn_device_h_l135_c5_4991]
signal BIN_OP_OR_uxn_device_h_l135_c5_4991_left : unsigned(31 downto 0);
signal BIN_OP_OR_uxn_device_h_l135_c5_4991_right : unsigned(21 downto 0);
signal BIN_OP_OR_uxn_device_h_l135_c5_4991_return_output : unsigned(31 downto 0);

-- BIN_OP_OR[uxn_device_h_l136_c5_81b6]
signal BIN_OP_OR_uxn_device_h_l136_c5_81b6_left : unsigned(31 downto 0);
signal BIN_OP_OR_uxn_device_h_l136_c5_81b6_right : unsigned(31 downto 0);
signal BIN_OP_OR_uxn_device_h_l136_c5_81b6_return_output : unsigned(31 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l140_c28_6579]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l140_c28_6579_left : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l140_c28_6579_right : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l140_c28_6579_return_output : unsigned(63 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l140_c28_706a]
signal BIN_OP_PLUS_uxn_device_h_l140_c28_706a_left : unsigned(63 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l140_c28_706a_right : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l140_c28_706a_return_output : unsigned(64 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l144_c8_0544]
signal result_device_ram_address_MUX_uxn_device_h_l144_c8_0544_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l144_c8_0544_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l144_c8_0544_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l144_c8_0544_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l144_c8_0544]
signal auto_advance_MUX_uxn_device_h_l144_c8_0544_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l144_c8_0544_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l144_c8_0544_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l144_c8_0544_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l149_c11_aaf4]
signal BIN_OP_EQ_uxn_device_h_l149_c11_aaf4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l149_c11_aaf4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l149_c11_aaf4_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l149_c7_bfbe]
signal result_is_vram_write_MUX_uxn_device_h_l149_c7_bfbe_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l149_c7_bfbe_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l149_c7_bfbe_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l149_c7_bfbe_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l149_c7_bfbe]
signal result_device_ram_address_MUX_uxn_device_h_l149_c7_bfbe_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l149_c7_bfbe_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l149_c7_bfbe_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l149_c7_bfbe_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l149_c7_bfbe]
signal result_is_deo_done_MUX_uxn_device_h_l149_c7_bfbe_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l149_c7_bfbe_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l149_c7_bfbe_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l149_c7_bfbe_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l149_c7_bfbe]
signal result_vram_address_MUX_uxn_device_h_l149_c7_bfbe_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l149_c7_bfbe_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l149_c7_bfbe_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l149_c7_bfbe_return_output : unsigned(31 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l149_c7_bfbe]
signal result_is_device_ram_write_MUX_uxn_device_h_l149_c7_bfbe_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l149_c7_bfbe_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l149_c7_bfbe_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l149_c7_bfbe_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l149_c7_bfbe]
signal result_u8_value_MUX_uxn_device_h_l149_c7_bfbe_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l149_c7_bfbe_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l149_c7_bfbe_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l149_c7_bfbe_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l149_c7_bfbe]
signal ram_addr_MUX_uxn_device_h_l149_c7_bfbe_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l149_c7_bfbe_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l149_c7_bfbe_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l149_c7_bfbe_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l149_c7_bfbe]
signal x_MUX_uxn_device_h_l149_c7_bfbe_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l149_c7_bfbe_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l149_c7_bfbe_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l149_c7_bfbe_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l150_c3_5fc1]
signal result_is_vram_write_MUX_uxn_device_h_l150_c3_5fc1_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l150_c3_5fc1_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l150_c3_5fc1_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l150_c3_5fc1_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l150_c3_5fc1]
signal result_device_ram_address_MUX_uxn_device_h_l150_c3_5fc1_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l150_c3_5fc1_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l150_c3_5fc1_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l150_c3_5fc1_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l150_c3_5fc1]
signal result_is_deo_done_MUX_uxn_device_h_l150_c3_5fc1_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l150_c3_5fc1_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l150_c3_5fc1_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l150_c3_5fc1_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l150_c3_5fc1]
signal result_vram_address_MUX_uxn_device_h_l150_c3_5fc1_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l150_c3_5fc1_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l150_c3_5fc1_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l150_c3_5fc1_return_output : unsigned(31 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l150_c3_5fc1]
signal result_is_device_ram_write_MUX_uxn_device_h_l150_c3_5fc1_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l150_c3_5fc1_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l150_c3_5fc1_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l150_c3_5fc1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l150_c3_5fc1]
signal result_u8_value_MUX_uxn_device_h_l150_c3_5fc1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l150_c3_5fc1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l150_c3_5fc1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l150_c3_5fc1_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l150_c3_5fc1]
signal x_MUX_uxn_device_h_l150_c3_5fc1_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l150_c3_5fc1_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l150_c3_5fc1_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l150_c3_5fc1_return_output : unsigned(15 downto 0);

-- UNARY_OP_NOT[uxn_device_h_l155_c9_9342]
signal UNARY_OP_NOT_uxn_device_h_l155_c9_9342_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_device_h_l155_c9_9342_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l155_c4_93e4]
signal result_is_deo_done_MUX_uxn_device_h_l155_c4_93e4_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l155_c4_93e4_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l155_c4_93e4_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l155_c4_93e4_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l155_c4_93e4]
signal result_is_device_ram_write_MUX_uxn_device_h_l155_c4_93e4_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l155_c4_93e4_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l155_c4_93e4_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l155_c4_93e4_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l155_c4_93e4]
signal result_device_ram_address_MUX_uxn_device_h_l155_c4_93e4_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l155_c4_93e4_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l155_c4_93e4_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l155_c4_93e4_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l155_c4_93e4]
signal result_u8_value_MUX_uxn_device_h_l155_c4_93e4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l155_c4_93e4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l155_c4_93e4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l155_c4_93e4_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l155_c4_93e4]
signal x_MUX_uxn_device_h_l155_c4_93e4_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l155_c4_93e4_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l155_c4_93e4_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l155_c4_93e4_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_device_h_l156_c9_d0d7]
signal BIN_OP_AND_uxn_device_h_l156_c9_d0d7_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l156_c9_d0d7_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l156_c9_d0d7_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l156_c5_f4d5]
signal result_is_device_ram_write_MUX_uxn_device_h_l156_c5_f4d5_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l156_c5_f4d5_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l156_c5_f4d5_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l156_c5_f4d5_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l156_c5_f4d5]
signal result_device_ram_address_MUX_uxn_device_h_l156_c5_f4d5_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l156_c5_f4d5_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l156_c5_f4d5_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l156_c5_f4d5_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l156_c5_f4d5]
signal result_u8_value_MUX_uxn_device_h_l156_c5_f4d5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l156_c5_f4d5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l156_c5_f4d5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l156_c5_f4d5_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l156_c5_f4d5]
signal x_MUX_uxn_device_h_l156_c5_f4d5_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l156_c5_f4d5_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l156_c5_f4d5_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l156_c5_f4d5_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l157_c6_6fb1]
signal BIN_OP_PLUS_uxn_device_h_l157_c6_6fb1_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l157_c6_6fb1_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l157_c6_6fb1_return_output : unsigned(16 downto 0);

-- CONST_SR_8[uxn_device_h_l160_c34_45ca]
signal CONST_SR_8_uxn_device_h_l160_c34_45ca_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l160_c34_45ca_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l166_c8_942b]
signal result_device_ram_address_MUX_uxn_device_h_l166_c8_942b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l166_c8_942b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l166_c8_942b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l166_c8_942b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l170_c11_d097]
signal BIN_OP_EQ_uxn_device_h_l170_c11_d097_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l170_c11_d097_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l170_c11_d097_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l170_c7_b03c]
signal result_is_deo_done_MUX_uxn_device_h_l170_c7_b03c_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l170_c7_b03c_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l170_c7_b03c_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l170_c7_b03c_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l170_c7_b03c]
signal result_is_device_ram_write_MUX_uxn_device_h_l170_c7_b03c_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l170_c7_b03c_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l170_c7_b03c_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l170_c7_b03c_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l170_c7_b03c]
signal result_device_ram_address_MUX_uxn_device_h_l170_c7_b03c_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l170_c7_b03c_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l170_c7_b03c_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l170_c7_b03c_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l170_c7_b03c]
signal result_u8_value_MUX_uxn_device_h_l170_c7_b03c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l170_c7_b03c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l170_c7_b03c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l170_c7_b03c_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l170_c7_b03c]
signal ram_addr_MUX_uxn_device_h_l170_c7_b03c_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l170_c7_b03c_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l170_c7_b03c_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l170_c7_b03c_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l171_c3_99f3]
signal result_is_device_ram_write_MUX_uxn_device_h_l171_c3_99f3_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l171_c3_99f3_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l171_c3_99f3_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l171_c3_99f3_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l171_c3_99f3]
signal result_device_ram_address_MUX_uxn_device_h_l171_c3_99f3_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l171_c3_99f3_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l171_c3_99f3_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l171_c3_99f3_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l171_c3_99f3]
signal result_u8_value_MUX_uxn_device_h_l171_c3_99f3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l171_c3_99f3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l171_c3_99f3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l171_c3_99f3_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l172_c8_b586]
signal BIN_OP_AND_uxn_device_h_l172_c8_b586_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l172_c8_b586_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l172_c8_b586_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l172_c4_ae83]
signal result_is_device_ram_write_MUX_uxn_device_h_l172_c4_ae83_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l172_c4_ae83_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l172_c4_ae83_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l172_c4_ae83_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l172_c4_ae83]
signal result_device_ram_address_MUX_uxn_device_h_l172_c4_ae83_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l172_c4_ae83_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l172_c4_ae83_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l172_c4_ae83_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l172_c4_ae83]
signal result_u8_value_MUX_uxn_device_h_l172_c4_ae83_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l172_c4_ae83_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l172_c4_ae83_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l172_c4_ae83_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l178_c3_85d0]
signal result_device_ram_address_MUX_uxn_device_h_l178_c3_85d0_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l178_c3_85d0_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l178_c3_85d0_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l178_c3_85d0_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l178_c3_85d0]
signal ram_addr_MUX_uxn_device_h_l178_c3_85d0_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l178_c3_85d0_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l178_c3_85d0_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l178_c3_85d0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l184_c11_e7fe]
signal BIN_OP_EQ_uxn_device_h_l184_c11_e7fe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l184_c11_e7fe_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l184_c11_e7fe_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l184_c7_c45b]
signal result_is_deo_done_MUX_uxn_device_h_l184_c7_c45b_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l184_c7_c45b_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l184_c7_c45b_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l184_c7_c45b_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l184_c7_c45b]
signal result_is_device_ram_write_MUX_uxn_device_h_l184_c7_c45b_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l184_c7_c45b_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l184_c7_c45b_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l184_c7_c45b_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l184_c7_c45b]
signal result_device_ram_address_MUX_uxn_device_h_l184_c7_c45b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l184_c7_c45b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l184_c7_c45b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l184_c7_c45b_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l184_c7_c45b]
signal result_u8_value_MUX_uxn_device_h_l184_c7_c45b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l184_c7_c45b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l184_c7_c45b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l184_c7_c45b_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l184_c7_c45b]
signal ram_addr_MUX_uxn_device_h_l184_c7_c45b_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l184_c7_c45b_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l184_c7_c45b_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l184_c7_c45b_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l185_c3_b7f1]
signal result_is_device_ram_write_MUX_uxn_device_h_l185_c3_b7f1_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l185_c3_b7f1_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l185_c3_b7f1_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l185_c3_b7f1_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l185_c3_b7f1]
signal result_device_ram_address_MUX_uxn_device_h_l185_c3_b7f1_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l185_c3_b7f1_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l185_c3_b7f1_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l185_c3_b7f1_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l185_c3_b7f1]
signal result_u8_value_MUX_uxn_device_h_l185_c3_b7f1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l185_c3_b7f1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l185_c3_b7f1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l185_c3_b7f1_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l186_c8_bb02]
signal BIN_OP_AND_uxn_device_h_l186_c8_bb02_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l186_c8_bb02_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l186_c8_bb02_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l186_c4_f747]
signal result_is_device_ram_write_MUX_uxn_device_h_l186_c4_f747_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l186_c4_f747_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l186_c4_f747_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l186_c4_f747_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l186_c4_f747]
signal result_device_ram_address_MUX_uxn_device_h_l186_c4_f747_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l186_c4_f747_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l186_c4_f747_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l186_c4_f747_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l186_c4_f747]
signal result_u8_value_MUX_uxn_device_h_l186_c4_f747_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l186_c4_f747_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l186_c4_f747_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l186_c4_f747_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_device_h_l189_c33_cd3a]
signal CONST_SR_8_uxn_device_h_l189_c33_cd3a_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l189_c33_cd3a_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l192_c3_ab93]
signal result_device_ram_address_MUX_uxn_device_h_l192_c3_ab93_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l192_c3_ab93_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l192_c3_ab93_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l192_c3_ab93_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l196_c11_0992]
signal BIN_OP_EQ_uxn_device_h_l196_c11_0992_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l196_c11_0992_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_device_h_l196_c11_0992_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l196_c7_1f25]
signal result_is_deo_done_MUX_uxn_device_h_l196_c7_1f25_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l196_c7_1f25_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l196_c7_1f25_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l196_c7_1f25_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l196_c7_1f25]
signal result_is_device_ram_write_MUX_uxn_device_h_l196_c7_1f25_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l196_c7_1f25_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l196_c7_1f25_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l196_c7_1f25_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l196_c7_1f25]
signal result_device_ram_address_MUX_uxn_device_h_l196_c7_1f25_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l196_c7_1f25_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l196_c7_1f25_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l196_c7_1f25_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l196_c7_1f25]
signal result_u8_value_MUX_uxn_device_h_l196_c7_1f25_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l196_c7_1f25_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l196_c7_1f25_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l196_c7_1f25_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l196_c7_1f25]
signal ram_addr_MUX_uxn_device_h_l196_c7_1f25_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l196_c7_1f25_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l196_c7_1f25_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l196_c7_1f25_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l197_c3_e13e]
signal result_is_device_ram_write_MUX_uxn_device_h_l197_c3_e13e_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l197_c3_e13e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l197_c3_e13e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l197_c3_e13e_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l197_c3_e13e]
signal result_device_ram_address_MUX_uxn_device_h_l197_c3_e13e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l197_c3_e13e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l197_c3_e13e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l197_c3_e13e_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l197_c3_e13e]
signal result_u8_value_MUX_uxn_device_h_l197_c3_e13e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l197_c3_e13e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l197_c3_e13e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l197_c3_e13e_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l198_c8_a07b]
signal BIN_OP_AND_uxn_device_h_l198_c8_a07b_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l198_c8_a07b_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l198_c8_a07b_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l198_c4_f395]
signal result_is_device_ram_write_MUX_uxn_device_h_l198_c4_f395_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l198_c4_f395_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l198_c4_f395_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l198_c4_f395_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l198_c4_f395]
signal result_device_ram_address_MUX_uxn_device_h_l198_c4_f395_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l198_c4_f395_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l198_c4_f395_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l198_c4_f395_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l198_c4_f395]
signal result_u8_value_MUX_uxn_device_h_l198_c4_f395_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l198_c4_f395_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l198_c4_f395_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l198_c4_f395_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l204_c3_197f]
signal result_is_deo_done_MUX_uxn_device_h_l204_c3_197f_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l204_c3_197f_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l204_c3_197f_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l204_c3_197f_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l204_c3_197f]
signal ram_addr_MUX_uxn_device_h_l204_c3_197f_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l204_c3_197f_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l204_c3_197f_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l204_c3_197f_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_device_h_l205_c4_c8b7]
signal BIN_OP_OR_uxn_device_h_l205_c4_c8b7_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l205_c4_c8b7_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l205_c4_c8b7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l210_c11_f124]
signal BIN_OP_EQ_uxn_device_h_l210_c11_f124_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l210_c11_f124_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_device_h_l210_c11_f124_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l210_c7_72c7]
signal result_device_ram_address_MUX_uxn_device_h_l210_c7_72c7_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l210_c7_72c7_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l210_c7_72c7_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l210_c7_72c7_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l210_c7_72c7]
signal result_is_device_ram_write_MUX_uxn_device_h_l210_c7_72c7_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l210_c7_72c7_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l210_c7_72c7_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l210_c7_72c7_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l210_c7_72c7]
signal result_is_deo_done_MUX_uxn_device_h_l210_c7_72c7_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l210_c7_72c7_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l210_c7_72c7_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l210_c7_72c7_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l211_c3_8d0f]
signal result_device_ram_address_MUX_uxn_device_h_l211_c3_8d0f_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l211_c3_8d0f_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l211_c3_8d0f_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l211_c3_8d0f_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l211_c3_8d0f]
signal result_is_device_ram_write_MUX_uxn_device_h_l211_c3_8d0f_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l211_c3_8d0f_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l211_c3_8d0f_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l211_c3_8d0f_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l211_c3_8d0f]
signal result_is_deo_done_MUX_uxn_device_h_l211_c3_8d0f_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l211_c3_8d0f_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l211_c3_8d0f_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l211_c3_8d0f_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_device_h_l80_l181_l103_DUPLICATE_f0ca
signal CONST_SL_8_uint16_t_uxn_device_h_l80_l181_l103_DUPLICATE_f0ca_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_device_h_l80_l181_l103_DUPLICATE_f0ca_return_output : unsigned(15 downto 0);

-- CONST_SR_1_uint8_t_uxn_device_h_l198_l186_DUPLICATE_bbf7
signal CONST_SR_1_uint8_t_uxn_device_h_l198_l186_DUPLICATE_bbf7_x : unsigned(7 downto 0);
signal CONST_SR_1_uint8_t_uxn_device_h_l198_l186_DUPLICATE_bbf7_return_output : unsigned(7 downto 0);

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

function CAST_TO_uint8_t_uint4_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(3 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CAST_TO_uint32_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,32)));
    return return_output;
end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_ef4b( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.is_vram_write := ref_toks_1;
      base.device_ram_address := ref_toks_2;
      base.is_deo_done := ref_toks_3;
      base.vram_write_layer := ref_toks_4;
      base.vram_address := ref_toks_5;
      base.is_device_ram_write := ref_toks_6;
      base.u8_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_device_h_l42_c6_10f4
BIN_OP_EQ_uxn_device_h_l42_c6_10f4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l42_c6_10f4_left,
BIN_OP_EQ_uxn_device_h_l42_c6_10f4_right,
BIN_OP_EQ_uxn_device_h_l42_c6_10f4_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l42_c2_c27c
result_is_vram_write_MUX_uxn_device_h_l42_c2_c27c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l42_c2_c27c_cond,
result_is_vram_write_MUX_uxn_device_h_l42_c2_c27c_iftrue,
result_is_vram_write_MUX_uxn_device_h_l42_c2_c27c_iffalse,
result_is_vram_write_MUX_uxn_device_h_l42_c2_c27c_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l42_c2_c27c
result_device_ram_address_MUX_uxn_device_h_l42_c2_c27c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l42_c2_c27c_cond,
result_device_ram_address_MUX_uxn_device_h_l42_c2_c27c_iftrue,
result_device_ram_address_MUX_uxn_device_h_l42_c2_c27c_iffalse,
result_device_ram_address_MUX_uxn_device_h_l42_c2_c27c_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l42_c2_c27c
result_is_deo_done_MUX_uxn_device_h_l42_c2_c27c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l42_c2_c27c_cond,
result_is_deo_done_MUX_uxn_device_h_l42_c2_c27c_iftrue,
result_is_deo_done_MUX_uxn_device_h_l42_c2_c27c_iffalse,
result_is_deo_done_MUX_uxn_device_h_l42_c2_c27c_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l42_c2_c27c
result_vram_write_layer_MUX_uxn_device_h_l42_c2_c27c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l42_c2_c27c_cond,
result_vram_write_layer_MUX_uxn_device_h_l42_c2_c27c_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l42_c2_c27c_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l42_c2_c27c_return_output);

-- result_vram_address_MUX_uxn_device_h_l42_c2_c27c
result_vram_address_MUX_uxn_device_h_l42_c2_c27c : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l42_c2_c27c_cond,
result_vram_address_MUX_uxn_device_h_l42_c2_c27c_iftrue,
result_vram_address_MUX_uxn_device_h_l42_c2_c27c_iffalse,
result_vram_address_MUX_uxn_device_h_l42_c2_c27c_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l42_c2_c27c
result_is_device_ram_write_MUX_uxn_device_h_l42_c2_c27c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l42_c2_c27c_cond,
result_is_device_ram_write_MUX_uxn_device_h_l42_c2_c27c_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l42_c2_c27c_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l42_c2_c27c_return_output);

-- result_u8_value_MUX_uxn_device_h_l42_c2_c27c
result_u8_value_MUX_uxn_device_h_l42_c2_c27c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l42_c2_c27c_cond,
result_u8_value_MUX_uxn_device_h_l42_c2_c27c_iftrue,
result_u8_value_MUX_uxn_device_h_l42_c2_c27c_iffalse,
result_u8_value_MUX_uxn_device_h_l42_c2_c27c_return_output);

-- vram_addr_MUX_uxn_device_h_l42_c2_c27c
vram_addr_MUX_uxn_device_h_l42_c2_c27c : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l42_c2_c27c_cond,
vram_addr_MUX_uxn_device_h_l42_c2_c27c_iftrue,
vram_addr_MUX_uxn_device_h_l42_c2_c27c_iffalse,
vram_addr_MUX_uxn_device_h_l42_c2_c27c_return_output);

-- ctrl_MUX_uxn_device_h_l42_c2_c27c
ctrl_MUX_uxn_device_h_l42_c2_c27c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l42_c2_c27c_cond,
ctrl_MUX_uxn_device_h_l42_c2_c27c_iftrue,
ctrl_MUX_uxn_device_h_l42_c2_c27c_iffalse,
ctrl_MUX_uxn_device_h_l42_c2_c27c_return_output);

-- color_MUX_uxn_device_h_l42_c2_c27c
color_MUX_uxn_device_h_l42_c2_c27c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l42_c2_c27c_cond,
color_MUX_uxn_device_h_l42_c2_c27c_iftrue,
color_MUX_uxn_device_h_l42_c2_c27c_iffalse,
color_MUX_uxn_device_h_l42_c2_c27c_return_output);

-- layer_MUX_uxn_device_h_l42_c2_c27c
layer_MUX_uxn_device_h_l42_c2_c27c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l42_c2_c27c_cond,
layer_MUX_uxn_device_h_l42_c2_c27c_iftrue,
layer_MUX_uxn_device_h_l42_c2_c27c_iffalse,
layer_MUX_uxn_device_h_l42_c2_c27c_return_output);

-- y_MUX_uxn_device_h_l42_c2_c27c
y_MUX_uxn_device_h_l42_c2_c27c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l42_c2_c27c_cond,
y_MUX_uxn_device_h_l42_c2_c27c_iftrue,
y_MUX_uxn_device_h_l42_c2_c27c_iffalse,
y_MUX_uxn_device_h_l42_c2_c27c_return_output);

-- flip_y_MUX_uxn_device_h_l42_c2_c27c
flip_y_MUX_uxn_device_h_l42_c2_c27c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l42_c2_c27c_cond,
flip_y_MUX_uxn_device_h_l42_c2_c27c_iftrue,
flip_y_MUX_uxn_device_h_l42_c2_c27c_iffalse,
flip_y_MUX_uxn_device_h_l42_c2_c27c_return_output);

-- ram_addr_MUX_uxn_device_h_l42_c2_c27c
ram_addr_MUX_uxn_device_h_l42_c2_c27c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l42_c2_c27c_cond,
ram_addr_MUX_uxn_device_h_l42_c2_c27c_iftrue,
ram_addr_MUX_uxn_device_h_l42_c2_c27c_iffalse,
ram_addr_MUX_uxn_device_h_l42_c2_c27c_return_output);

-- is_sprite_port_MUX_uxn_device_h_l42_c2_c27c
is_sprite_port_MUX_uxn_device_h_l42_c2_c27c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_sprite_port_MUX_uxn_device_h_l42_c2_c27c_cond,
is_sprite_port_MUX_uxn_device_h_l42_c2_c27c_iftrue,
is_sprite_port_MUX_uxn_device_h_l42_c2_c27c_iffalse,
is_sprite_port_MUX_uxn_device_h_l42_c2_c27c_return_output);

-- x_MUX_uxn_device_h_l42_c2_c27c
x_MUX_uxn_device_h_l42_c2_c27c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l42_c2_c27c_cond,
x_MUX_uxn_device_h_l42_c2_c27c_iftrue,
x_MUX_uxn_device_h_l42_c2_c27c_iffalse,
x_MUX_uxn_device_h_l42_c2_c27c_return_output);

-- auto_advance_MUX_uxn_device_h_l42_c2_c27c
auto_advance_MUX_uxn_device_h_l42_c2_c27c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l42_c2_c27c_cond,
auto_advance_MUX_uxn_device_h_l42_c2_c27c_iftrue,
auto_advance_MUX_uxn_device_h_l42_c2_c27c_iffalse,
auto_advance_MUX_uxn_device_h_l42_c2_c27c_return_output);

-- flip_x_MUX_uxn_device_h_l42_c2_c27c
flip_x_MUX_uxn_device_h_l42_c2_c27c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l42_c2_c27c_cond,
flip_x_MUX_uxn_device_h_l42_c2_c27c_iftrue,
flip_x_MUX_uxn_device_h_l42_c2_c27c_iffalse,
flip_x_MUX_uxn_device_h_l42_c2_c27c_return_output);

-- is_pixel_port_MUX_uxn_device_h_l42_c2_c27c
is_pixel_port_MUX_uxn_device_h_l42_c2_c27c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_pixel_port_MUX_uxn_device_h_l42_c2_c27c_cond,
is_pixel_port_MUX_uxn_device_h_l42_c2_c27c_iftrue,
is_pixel_port_MUX_uxn_device_h_l42_c2_c27c_iffalse,
is_pixel_port_MUX_uxn_device_h_l42_c2_c27c_return_output);

-- is_drawing_port_MUX_uxn_device_h_l42_c2_c27c
is_drawing_port_MUX_uxn_device_h_l42_c2_c27c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_drawing_port_MUX_uxn_device_h_l42_c2_c27c_cond,
is_drawing_port_MUX_uxn_device_h_l42_c2_c27c_iftrue,
is_drawing_port_MUX_uxn_device_h_l42_c2_c27c_iffalse,
is_drawing_port_MUX_uxn_device_h_l42_c2_c27c_return_output);

-- ctrl_mode_MUX_uxn_device_h_l42_c2_c27c
ctrl_mode_MUX_uxn_device_h_l42_c2_c27c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l42_c2_c27c_cond,
ctrl_mode_MUX_uxn_device_h_l42_c2_c27c_iftrue,
ctrl_mode_MUX_uxn_device_h_l42_c2_c27c_iffalse,
ctrl_mode_MUX_uxn_device_h_l42_c2_c27c_return_output);

-- BIN_OP_EQ_uxn_device_h_l43_c19_c5ea
BIN_OP_EQ_uxn_device_h_l43_c19_c5ea : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l43_c19_c5ea_left,
BIN_OP_EQ_uxn_device_h_l43_c19_c5ea_right,
BIN_OP_EQ_uxn_device_h_l43_c19_c5ea_return_output);

-- MUX_uxn_device_h_l43_c19_f016
MUX_uxn_device_h_l43_c19_f016 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l43_c19_f016_cond,
MUX_uxn_device_h_l43_c19_f016_iftrue,
MUX_uxn_device_h_l43_c19_f016_iffalse,
MUX_uxn_device_h_l43_c19_f016_return_output);

-- BIN_OP_EQ_uxn_device_h_l44_c20_fd38
BIN_OP_EQ_uxn_device_h_l44_c20_fd38 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l44_c20_fd38_left,
BIN_OP_EQ_uxn_device_h_l44_c20_fd38_right,
BIN_OP_EQ_uxn_device_h_l44_c20_fd38_return_output);

-- MUX_uxn_device_h_l44_c20_9375
MUX_uxn_device_h_l44_c20_9375 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l44_c20_9375_cond,
MUX_uxn_device_h_l44_c20_9375_iftrue,
MUX_uxn_device_h_l44_c20_9375_iffalse,
MUX_uxn_device_h_l44_c20_9375_return_output);

-- BIN_OP_OR_uxn_device_h_l45_c21_23f8
BIN_OP_OR_uxn_device_h_l45_c21_23f8 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l45_c21_23f8_left,
BIN_OP_OR_uxn_device_h_l45_c21_23f8_right,
BIN_OP_OR_uxn_device_h_l45_c21_23f8_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l49_c3_de5f
result_device_ram_address_MUX_uxn_device_h_l49_c3_de5f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l49_c3_de5f_cond,
result_device_ram_address_MUX_uxn_device_h_l49_c3_de5f_iftrue,
result_device_ram_address_MUX_uxn_device_h_l49_c3_de5f_iffalse,
result_device_ram_address_MUX_uxn_device_h_l49_c3_de5f_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l49_c3_de5f
result_is_deo_done_MUX_uxn_device_h_l49_c3_de5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l49_c3_de5f_cond,
result_is_deo_done_MUX_uxn_device_h_l49_c3_de5f_iftrue,
result_is_deo_done_MUX_uxn_device_h_l49_c3_de5f_iffalse,
result_is_deo_done_MUX_uxn_device_h_l49_c3_de5f_return_output);

-- MUX_uxn_device_h_l50_c32_ff36
MUX_uxn_device_h_l50_c32_ff36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l50_c32_ff36_cond,
MUX_uxn_device_h_l50_c32_ff36_iftrue,
MUX_uxn_device_h_l50_c32_ff36_iffalse,
MUX_uxn_device_h_l50_c32_ff36_return_output);

-- BIN_OP_EQ_uxn_device_h_l56_c11_25a0
BIN_OP_EQ_uxn_device_h_l56_c11_25a0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l56_c11_25a0_left,
BIN_OP_EQ_uxn_device_h_l56_c11_25a0_right,
BIN_OP_EQ_uxn_device_h_l56_c11_25a0_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l56_c7_f9d9
result_is_vram_write_MUX_uxn_device_h_l56_c7_f9d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l56_c7_f9d9_cond,
result_is_vram_write_MUX_uxn_device_h_l56_c7_f9d9_iftrue,
result_is_vram_write_MUX_uxn_device_h_l56_c7_f9d9_iffalse,
result_is_vram_write_MUX_uxn_device_h_l56_c7_f9d9_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l56_c7_f9d9
result_device_ram_address_MUX_uxn_device_h_l56_c7_f9d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l56_c7_f9d9_cond,
result_device_ram_address_MUX_uxn_device_h_l56_c7_f9d9_iftrue,
result_device_ram_address_MUX_uxn_device_h_l56_c7_f9d9_iffalse,
result_device_ram_address_MUX_uxn_device_h_l56_c7_f9d9_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l56_c7_f9d9
result_is_deo_done_MUX_uxn_device_h_l56_c7_f9d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l56_c7_f9d9_cond,
result_is_deo_done_MUX_uxn_device_h_l56_c7_f9d9_iftrue,
result_is_deo_done_MUX_uxn_device_h_l56_c7_f9d9_iffalse,
result_is_deo_done_MUX_uxn_device_h_l56_c7_f9d9_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l56_c7_f9d9
result_vram_write_layer_MUX_uxn_device_h_l56_c7_f9d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l56_c7_f9d9_cond,
result_vram_write_layer_MUX_uxn_device_h_l56_c7_f9d9_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l56_c7_f9d9_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l56_c7_f9d9_return_output);

-- result_vram_address_MUX_uxn_device_h_l56_c7_f9d9
result_vram_address_MUX_uxn_device_h_l56_c7_f9d9 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l56_c7_f9d9_cond,
result_vram_address_MUX_uxn_device_h_l56_c7_f9d9_iftrue,
result_vram_address_MUX_uxn_device_h_l56_c7_f9d9_iffalse,
result_vram_address_MUX_uxn_device_h_l56_c7_f9d9_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l56_c7_f9d9
result_is_device_ram_write_MUX_uxn_device_h_l56_c7_f9d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l56_c7_f9d9_cond,
result_is_device_ram_write_MUX_uxn_device_h_l56_c7_f9d9_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l56_c7_f9d9_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l56_c7_f9d9_return_output);

-- result_u8_value_MUX_uxn_device_h_l56_c7_f9d9
result_u8_value_MUX_uxn_device_h_l56_c7_f9d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l56_c7_f9d9_cond,
result_u8_value_MUX_uxn_device_h_l56_c7_f9d9_iftrue,
result_u8_value_MUX_uxn_device_h_l56_c7_f9d9_iffalse,
result_u8_value_MUX_uxn_device_h_l56_c7_f9d9_return_output);

-- vram_addr_MUX_uxn_device_h_l56_c7_f9d9
vram_addr_MUX_uxn_device_h_l56_c7_f9d9 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l56_c7_f9d9_cond,
vram_addr_MUX_uxn_device_h_l56_c7_f9d9_iftrue,
vram_addr_MUX_uxn_device_h_l56_c7_f9d9_iffalse,
vram_addr_MUX_uxn_device_h_l56_c7_f9d9_return_output);

-- ctrl_MUX_uxn_device_h_l56_c7_f9d9
ctrl_MUX_uxn_device_h_l56_c7_f9d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l56_c7_f9d9_cond,
ctrl_MUX_uxn_device_h_l56_c7_f9d9_iftrue,
ctrl_MUX_uxn_device_h_l56_c7_f9d9_iffalse,
ctrl_MUX_uxn_device_h_l56_c7_f9d9_return_output);

-- color_MUX_uxn_device_h_l56_c7_f9d9
color_MUX_uxn_device_h_l56_c7_f9d9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l56_c7_f9d9_cond,
color_MUX_uxn_device_h_l56_c7_f9d9_iftrue,
color_MUX_uxn_device_h_l56_c7_f9d9_iffalse,
color_MUX_uxn_device_h_l56_c7_f9d9_return_output);

-- layer_MUX_uxn_device_h_l56_c7_f9d9
layer_MUX_uxn_device_h_l56_c7_f9d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l56_c7_f9d9_cond,
layer_MUX_uxn_device_h_l56_c7_f9d9_iftrue,
layer_MUX_uxn_device_h_l56_c7_f9d9_iffalse,
layer_MUX_uxn_device_h_l56_c7_f9d9_return_output);

-- y_MUX_uxn_device_h_l56_c7_f9d9
y_MUX_uxn_device_h_l56_c7_f9d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l56_c7_f9d9_cond,
y_MUX_uxn_device_h_l56_c7_f9d9_iftrue,
y_MUX_uxn_device_h_l56_c7_f9d9_iffalse,
y_MUX_uxn_device_h_l56_c7_f9d9_return_output);

-- flip_y_MUX_uxn_device_h_l56_c7_f9d9
flip_y_MUX_uxn_device_h_l56_c7_f9d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l56_c7_f9d9_cond,
flip_y_MUX_uxn_device_h_l56_c7_f9d9_iftrue,
flip_y_MUX_uxn_device_h_l56_c7_f9d9_iffalse,
flip_y_MUX_uxn_device_h_l56_c7_f9d9_return_output);

-- ram_addr_MUX_uxn_device_h_l56_c7_f9d9
ram_addr_MUX_uxn_device_h_l56_c7_f9d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l56_c7_f9d9_cond,
ram_addr_MUX_uxn_device_h_l56_c7_f9d9_iftrue,
ram_addr_MUX_uxn_device_h_l56_c7_f9d9_iffalse,
ram_addr_MUX_uxn_device_h_l56_c7_f9d9_return_output);

-- x_MUX_uxn_device_h_l56_c7_f9d9
x_MUX_uxn_device_h_l56_c7_f9d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l56_c7_f9d9_cond,
x_MUX_uxn_device_h_l56_c7_f9d9_iftrue,
x_MUX_uxn_device_h_l56_c7_f9d9_iffalse,
x_MUX_uxn_device_h_l56_c7_f9d9_return_output);

-- auto_advance_MUX_uxn_device_h_l56_c7_f9d9
auto_advance_MUX_uxn_device_h_l56_c7_f9d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l56_c7_f9d9_cond,
auto_advance_MUX_uxn_device_h_l56_c7_f9d9_iftrue,
auto_advance_MUX_uxn_device_h_l56_c7_f9d9_iffalse,
auto_advance_MUX_uxn_device_h_l56_c7_f9d9_return_output);

-- flip_x_MUX_uxn_device_h_l56_c7_f9d9
flip_x_MUX_uxn_device_h_l56_c7_f9d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l56_c7_f9d9_cond,
flip_x_MUX_uxn_device_h_l56_c7_f9d9_iftrue,
flip_x_MUX_uxn_device_h_l56_c7_f9d9_iffalse,
flip_x_MUX_uxn_device_h_l56_c7_f9d9_return_output);

-- ctrl_mode_MUX_uxn_device_h_l56_c7_f9d9
ctrl_mode_MUX_uxn_device_h_l56_c7_f9d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l56_c7_f9d9_cond,
ctrl_mode_MUX_uxn_device_h_l56_c7_f9d9_iftrue,
ctrl_mode_MUX_uxn_device_h_l56_c7_f9d9_iffalse,
ctrl_mode_MUX_uxn_device_h_l56_c7_f9d9_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l57_c3_8f9c
result_device_ram_address_MUX_uxn_device_h_l57_c3_8f9c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l57_c3_8f9c_cond,
result_device_ram_address_MUX_uxn_device_h_l57_c3_8f9c_iftrue,
result_device_ram_address_MUX_uxn_device_h_l57_c3_8f9c_iffalse,
result_device_ram_address_MUX_uxn_device_h_l57_c3_8f9c_return_output);

-- MUX_uxn_device_h_l58_c32_3abd
MUX_uxn_device_h_l58_c32_3abd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l58_c32_3abd_cond,
MUX_uxn_device_h_l58_c32_3abd_iftrue,
MUX_uxn_device_h_l58_c32_3abd_iffalse,
MUX_uxn_device_h_l58_c32_3abd_return_output);

-- BIN_OP_EQ_uxn_device_h_l61_c11_5e8f
BIN_OP_EQ_uxn_device_h_l61_c11_5e8f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l61_c11_5e8f_left,
BIN_OP_EQ_uxn_device_h_l61_c11_5e8f_right,
BIN_OP_EQ_uxn_device_h_l61_c11_5e8f_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l61_c7_5d0a
result_is_vram_write_MUX_uxn_device_h_l61_c7_5d0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l61_c7_5d0a_cond,
result_is_vram_write_MUX_uxn_device_h_l61_c7_5d0a_iftrue,
result_is_vram_write_MUX_uxn_device_h_l61_c7_5d0a_iffalse,
result_is_vram_write_MUX_uxn_device_h_l61_c7_5d0a_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l61_c7_5d0a
result_device_ram_address_MUX_uxn_device_h_l61_c7_5d0a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l61_c7_5d0a_cond,
result_device_ram_address_MUX_uxn_device_h_l61_c7_5d0a_iftrue,
result_device_ram_address_MUX_uxn_device_h_l61_c7_5d0a_iffalse,
result_device_ram_address_MUX_uxn_device_h_l61_c7_5d0a_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l61_c7_5d0a
result_is_deo_done_MUX_uxn_device_h_l61_c7_5d0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l61_c7_5d0a_cond,
result_is_deo_done_MUX_uxn_device_h_l61_c7_5d0a_iftrue,
result_is_deo_done_MUX_uxn_device_h_l61_c7_5d0a_iffalse,
result_is_deo_done_MUX_uxn_device_h_l61_c7_5d0a_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l61_c7_5d0a
result_vram_write_layer_MUX_uxn_device_h_l61_c7_5d0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l61_c7_5d0a_cond,
result_vram_write_layer_MUX_uxn_device_h_l61_c7_5d0a_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l61_c7_5d0a_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l61_c7_5d0a_return_output);

-- result_vram_address_MUX_uxn_device_h_l61_c7_5d0a
result_vram_address_MUX_uxn_device_h_l61_c7_5d0a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l61_c7_5d0a_cond,
result_vram_address_MUX_uxn_device_h_l61_c7_5d0a_iftrue,
result_vram_address_MUX_uxn_device_h_l61_c7_5d0a_iffalse,
result_vram_address_MUX_uxn_device_h_l61_c7_5d0a_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l61_c7_5d0a
result_is_device_ram_write_MUX_uxn_device_h_l61_c7_5d0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l61_c7_5d0a_cond,
result_is_device_ram_write_MUX_uxn_device_h_l61_c7_5d0a_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l61_c7_5d0a_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l61_c7_5d0a_return_output);

-- result_u8_value_MUX_uxn_device_h_l61_c7_5d0a
result_u8_value_MUX_uxn_device_h_l61_c7_5d0a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l61_c7_5d0a_cond,
result_u8_value_MUX_uxn_device_h_l61_c7_5d0a_iftrue,
result_u8_value_MUX_uxn_device_h_l61_c7_5d0a_iffalse,
result_u8_value_MUX_uxn_device_h_l61_c7_5d0a_return_output);

-- vram_addr_MUX_uxn_device_h_l61_c7_5d0a
vram_addr_MUX_uxn_device_h_l61_c7_5d0a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l61_c7_5d0a_cond,
vram_addr_MUX_uxn_device_h_l61_c7_5d0a_iftrue,
vram_addr_MUX_uxn_device_h_l61_c7_5d0a_iffalse,
vram_addr_MUX_uxn_device_h_l61_c7_5d0a_return_output);

-- ctrl_MUX_uxn_device_h_l61_c7_5d0a
ctrl_MUX_uxn_device_h_l61_c7_5d0a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l61_c7_5d0a_cond,
ctrl_MUX_uxn_device_h_l61_c7_5d0a_iftrue,
ctrl_MUX_uxn_device_h_l61_c7_5d0a_iffalse,
ctrl_MUX_uxn_device_h_l61_c7_5d0a_return_output);

-- color_MUX_uxn_device_h_l61_c7_5d0a
color_MUX_uxn_device_h_l61_c7_5d0a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l61_c7_5d0a_cond,
color_MUX_uxn_device_h_l61_c7_5d0a_iftrue,
color_MUX_uxn_device_h_l61_c7_5d0a_iffalse,
color_MUX_uxn_device_h_l61_c7_5d0a_return_output);

-- layer_MUX_uxn_device_h_l61_c7_5d0a
layer_MUX_uxn_device_h_l61_c7_5d0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l61_c7_5d0a_cond,
layer_MUX_uxn_device_h_l61_c7_5d0a_iftrue,
layer_MUX_uxn_device_h_l61_c7_5d0a_iffalse,
layer_MUX_uxn_device_h_l61_c7_5d0a_return_output);

-- y_MUX_uxn_device_h_l61_c7_5d0a
y_MUX_uxn_device_h_l61_c7_5d0a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l61_c7_5d0a_cond,
y_MUX_uxn_device_h_l61_c7_5d0a_iftrue,
y_MUX_uxn_device_h_l61_c7_5d0a_iffalse,
y_MUX_uxn_device_h_l61_c7_5d0a_return_output);

-- flip_y_MUX_uxn_device_h_l61_c7_5d0a
flip_y_MUX_uxn_device_h_l61_c7_5d0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l61_c7_5d0a_cond,
flip_y_MUX_uxn_device_h_l61_c7_5d0a_iftrue,
flip_y_MUX_uxn_device_h_l61_c7_5d0a_iffalse,
flip_y_MUX_uxn_device_h_l61_c7_5d0a_return_output);

-- ram_addr_MUX_uxn_device_h_l61_c7_5d0a
ram_addr_MUX_uxn_device_h_l61_c7_5d0a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l61_c7_5d0a_cond,
ram_addr_MUX_uxn_device_h_l61_c7_5d0a_iftrue,
ram_addr_MUX_uxn_device_h_l61_c7_5d0a_iffalse,
ram_addr_MUX_uxn_device_h_l61_c7_5d0a_return_output);

-- x_MUX_uxn_device_h_l61_c7_5d0a
x_MUX_uxn_device_h_l61_c7_5d0a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l61_c7_5d0a_cond,
x_MUX_uxn_device_h_l61_c7_5d0a_iftrue,
x_MUX_uxn_device_h_l61_c7_5d0a_iffalse,
x_MUX_uxn_device_h_l61_c7_5d0a_return_output);

-- auto_advance_MUX_uxn_device_h_l61_c7_5d0a
auto_advance_MUX_uxn_device_h_l61_c7_5d0a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l61_c7_5d0a_cond,
auto_advance_MUX_uxn_device_h_l61_c7_5d0a_iftrue,
auto_advance_MUX_uxn_device_h_l61_c7_5d0a_iffalse,
auto_advance_MUX_uxn_device_h_l61_c7_5d0a_return_output);

-- flip_x_MUX_uxn_device_h_l61_c7_5d0a
flip_x_MUX_uxn_device_h_l61_c7_5d0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l61_c7_5d0a_cond,
flip_x_MUX_uxn_device_h_l61_c7_5d0a_iftrue,
flip_x_MUX_uxn_device_h_l61_c7_5d0a_iffalse,
flip_x_MUX_uxn_device_h_l61_c7_5d0a_return_output);

-- ctrl_mode_MUX_uxn_device_h_l61_c7_5d0a
ctrl_mode_MUX_uxn_device_h_l61_c7_5d0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l61_c7_5d0a_cond,
ctrl_mode_MUX_uxn_device_h_l61_c7_5d0a_iftrue,
ctrl_mode_MUX_uxn_device_h_l61_c7_5d0a_iffalse,
ctrl_mode_MUX_uxn_device_h_l61_c7_5d0a_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l62_c3_6024
result_device_ram_address_MUX_uxn_device_h_l62_c3_6024 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l62_c3_6024_cond,
result_device_ram_address_MUX_uxn_device_h_l62_c3_6024_iftrue,
result_device_ram_address_MUX_uxn_device_h_l62_c3_6024_iffalse,
result_device_ram_address_MUX_uxn_device_h_l62_c3_6024_return_output);

-- ctrl_MUX_uxn_device_h_l62_c3_6024
ctrl_MUX_uxn_device_h_l62_c3_6024 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l62_c3_6024_cond,
ctrl_MUX_uxn_device_h_l62_c3_6024_iftrue,
ctrl_MUX_uxn_device_h_l62_c3_6024_iffalse,
ctrl_MUX_uxn_device_h_l62_c3_6024_return_output);

-- color_MUX_uxn_device_h_l62_c3_6024
color_MUX_uxn_device_h_l62_c3_6024 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l62_c3_6024_cond,
color_MUX_uxn_device_h_l62_c3_6024_iftrue,
color_MUX_uxn_device_h_l62_c3_6024_iffalse,
color_MUX_uxn_device_h_l62_c3_6024_return_output);

-- layer_MUX_uxn_device_h_l62_c3_6024
layer_MUX_uxn_device_h_l62_c3_6024 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l62_c3_6024_cond,
layer_MUX_uxn_device_h_l62_c3_6024_iftrue,
layer_MUX_uxn_device_h_l62_c3_6024_iffalse,
layer_MUX_uxn_device_h_l62_c3_6024_return_output);

-- flip_y_MUX_uxn_device_h_l62_c3_6024
flip_y_MUX_uxn_device_h_l62_c3_6024 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l62_c3_6024_cond,
flip_y_MUX_uxn_device_h_l62_c3_6024_iftrue,
flip_y_MUX_uxn_device_h_l62_c3_6024_iffalse,
flip_y_MUX_uxn_device_h_l62_c3_6024_return_output);

-- flip_x_MUX_uxn_device_h_l62_c3_6024
flip_x_MUX_uxn_device_h_l62_c3_6024 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l62_c3_6024_cond,
flip_x_MUX_uxn_device_h_l62_c3_6024_iftrue,
flip_x_MUX_uxn_device_h_l62_c3_6024_iffalse,
flip_x_MUX_uxn_device_h_l62_c3_6024_return_output);

-- ctrl_mode_MUX_uxn_device_h_l62_c3_6024
ctrl_mode_MUX_uxn_device_h_l62_c3_6024 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l62_c3_6024_cond,
ctrl_mode_MUX_uxn_device_h_l62_c3_6024_iftrue,
ctrl_mode_MUX_uxn_device_h_l62_c3_6024_iffalse,
ctrl_mode_MUX_uxn_device_h_l62_c3_6024_return_output);

-- CONST_SR_7_uxn_device_h_l65_c26_808b
CONST_SR_7_uxn_device_h_l65_c26_808b : entity work.CONST_SR_7_uint8_t_0CLK_de264c78 port map (
CONST_SR_7_uxn_device_h_l65_c26_808b_x,
CONST_SR_7_uxn_device_h_l65_c26_808b_return_output);

-- CONST_SR_6_uxn_device_h_l66_c22_77cc
CONST_SR_6_uxn_device_h_l66_c22_77cc : entity work.CONST_SR_6_uint8_t_0CLK_de264c78 port map (
CONST_SR_6_uxn_device_h_l66_c22_77cc_x,
CONST_SR_6_uxn_device_h_l66_c22_77cc_return_output);

-- CONST_SR_5_uxn_device_h_l67_c23_34f6
CONST_SR_5_uxn_device_h_l67_c23_34f6 : entity work.CONST_SR_5_uint8_t_0CLK_de264c78 port map (
CONST_SR_5_uxn_device_h_l67_c23_34f6_x,
CONST_SR_5_uxn_device_h_l67_c23_34f6_return_output);

-- CONST_SR_4_uxn_device_h_l68_c23_0abd
CONST_SR_4_uxn_device_h_l68_c23_0abd : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_device_h_l68_c23_0abd_x,
CONST_SR_4_uxn_device_h_l68_c23_0abd_return_output);

-- BIN_OP_EQ_uxn_device_h_l72_c11_b403
BIN_OP_EQ_uxn_device_h_l72_c11_b403 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l72_c11_b403_left,
BIN_OP_EQ_uxn_device_h_l72_c11_b403_right,
BIN_OP_EQ_uxn_device_h_l72_c11_b403_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l72_c7_470e
result_is_vram_write_MUX_uxn_device_h_l72_c7_470e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l72_c7_470e_cond,
result_is_vram_write_MUX_uxn_device_h_l72_c7_470e_iftrue,
result_is_vram_write_MUX_uxn_device_h_l72_c7_470e_iffalse,
result_is_vram_write_MUX_uxn_device_h_l72_c7_470e_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l72_c7_470e
result_device_ram_address_MUX_uxn_device_h_l72_c7_470e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l72_c7_470e_cond,
result_device_ram_address_MUX_uxn_device_h_l72_c7_470e_iftrue,
result_device_ram_address_MUX_uxn_device_h_l72_c7_470e_iffalse,
result_device_ram_address_MUX_uxn_device_h_l72_c7_470e_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l72_c7_470e
result_is_deo_done_MUX_uxn_device_h_l72_c7_470e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l72_c7_470e_cond,
result_is_deo_done_MUX_uxn_device_h_l72_c7_470e_iftrue,
result_is_deo_done_MUX_uxn_device_h_l72_c7_470e_iffalse,
result_is_deo_done_MUX_uxn_device_h_l72_c7_470e_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l72_c7_470e
result_vram_write_layer_MUX_uxn_device_h_l72_c7_470e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l72_c7_470e_cond,
result_vram_write_layer_MUX_uxn_device_h_l72_c7_470e_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l72_c7_470e_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l72_c7_470e_return_output);

-- result_vram_address_MUX_uxn_device_h_l72_c7_470e
result_vram_address_MUX_uxn_device_h_l72_c7_470e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l72_c7_470e_cond,
result_vram_address_MUX_uxn_device_h_l72_c7_470e_iftrue,
result_vram_address_MUX_uxn_device_h_l72_c7_470e_iffalse,
result_vram_address_MUX_uxn_device_h_l72_c7_470e_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l72_c7_470e
result_is_device_ram_write_MUX_uxn_device_h_l72_c7_470e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l72_c7_470e_cond,
result_is_device_ram_write_MUX_uxn_device_h_l72_c7_470e_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l72_c7_470e_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l72_c7_470e_return_output);

-- result_u8_value_MUX_uxn_device_h_l72_c7_470e
result_u8_value_MUX_uxn_device_h_l72_c7_470e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l72_c7_470e_cond,
result_u8_value_MUX_uxn_device_h_l72_c7_470e_iftrue,
result_u8_value_MUX_uxn_device_h_l72_c7_470e_iffalse,
result_u8_value_MUX_uxn_device_h_l72_c7_470e_return_output);

-- vram_addr_MUX_uxn_device_h_l72_c7_470e
vram_addr_MUX_uxn_device_h_l72_c7_470e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l72_c7_470e_cond,
vram_addr_MUX_uxn_device_h_l72_c7_470e_iftrue,
vram_addr_MUX_uxn_device_h_l72_c7_470e_iffalse,
vram_addr_MUX_uxn_device_h_l72_c7_470e_return_output);

-- y_MUX_uxn_device_h_l72_c7_470e
y_MUX_uxn_device_h_l72_c7_470e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l72_c7_470e_cond,
y_MUX_uxn_device_h_l72_c7_470e_iftrue,
y_MUX_uxn_device_h_l72_c7_470e_iffalse,
y_MUX_uxn_device_h_l72_c7_470e_return_output);

-- ram_addr_MUX_uxn_device_h_l72_c7_470e
ram_addr_MUX_uxn_device_h_l72_c7_470e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l72_c7_470e_cond,
ram_addr_MUX_uxn_device_h_l72_c7_470e_iftrue,
ram_addr_MUX_uxn_device_h_l72_c7_470e_iffalse,
ram_addr_MUX_uxn_device_h_l72_c7_470e_return_output);

-- x_MUX_uxn_device_h_l72_c7_470e
x_MUX_uxn_device_h_l72_c7_470e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l72_c7_470e_cond,
x_MUX_uxn_device_h_l72_c7_470e_iftrue,
x_MUX_uxn_device_h_l72_c7_470e_iffalse,
x_MUX_uxn_device_h_l72_c7_470e_return_output);

-- auto_advance_MUX_uxn_device_h_l72_c7_470e
auto_advance_MUX_uxn_device_h_l72_c7_470e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l72_c7_470e_cond,
auto_advance_MUX_uxn_device_h_l72_c7_470e_iftrue,
auto_advance_MUX_uxn_device_h_l72_c7_470e_iffalse,
auto_advance_MUX_uxn_device_h_l72_c7_470e_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l73_c3_d1e7
result_device_ram_address_MUX_uxn_device_h_l73_c3_d1e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l73_c3_d1e7_cond,
result_device_ram_address_MUX_uxn_device_h_l73_c3_d1e7_iftrue,
result_device_ram_address_MUX_uxn_device_h_l73_c3_d1e7_iffalse,
result_device_ram_address_MUX_uxn_device_h_l73_c3_d1e7_return_output);

-- BIN_OP_EQ_uxn_device_h_l77_c11_545d
BIN_OP_EQ_uxn_device_h_l77_c11_545d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l77_c11_545d_left,
BIN_OP_EQ_uxn_device_h_l77_c11_545d_right,
BIN_OP_EQ_uxn_device_h_l77_c11_545d_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l77_c7_76e7
result_is_vram_write_MUX_uxn_device_h_l77_c7_76e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l77_c7_76e7_cond,
result_is_vram_write_MUX_uxn_device_h_l77_c7_76e7_iftrue,
result_is_vram_write_MUX_uxn_device_h_l77_c7_76e7_iffalse,
result_is_vram_write_MUX_uxn_device_h_l77_c7_76e7_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l77_c7_76e7
result_device_ram_address_MUX_uxn_device_h_l77_c7_76e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l77_c7_76e7_cond,
result_device_ram_address_MUX_uxn_device_h_l77_c7_76e7_iftrue,
result_device_ram_address_MUX_uxn_device_h_l77_c7_76e7_iffalse,
result_device_ram_address_MUX_uxn_device_h_l77_c7_76e7_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l77_c7_76e7
result_is_deo_done_MUX_uxn_device_h_l77_c7_76e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l77_c7_76e7_cond,
result_is_deo_done_MUX_uxn_device_h_l77_c7_76e7_iftrue,
result_is_deo_done_MUX_uxn_device_h_l77_c7_76e7_iffalse,
result_is_deo_done_MUX_uxn_device_h_l77_c7_76e7_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l77_c7_76e7
result_vram_write_layer_MUX_uxn_device_h_l77_c7_76e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l77_c7_76e7_cond,
result_vram_write_layer_MUX_uxn_device_h_l77_c7_76e7_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l77_c7_76e7_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l77_c7_76e7_return_output);

-- result_vram_address_MUX_uxn_device_h_l77_c7_76e7
result_vram_address_MUX_uxn_device_h_l77_c7_76e7 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l77_c7_76e7_cond,
result_vram_address_MUX_uxn_device_h_l77_c7_76e7_iftrue,
result_vram_address_MUX_uxn_device_h_l77_c7_76e7_iffalse,
result_vram_address_MUX_uxn_device_h_l77_c7_76e7_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l77_c7_76e7
result_is_device_ram_write_MUX_uxn_device_h_l77_c7_76e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l77_c7_76e7_cond,
result_is_device_ram_write_MUX_uxn_device_h_l77_c7_76e7_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l77_c7_76e7_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l77_c7_76e7_return_output);

-- result_u8_value_MUX_uxn_device_h_l77_c7_76e7
result_u8_value_MUX_uxn_device_h_l77_c7_76e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l77_c7_76e7_cond,
result_u8_value_MUX_uxn_device_h_l77_c7_76e7_iftrue,
result_u8_value_MUX_uxn_device_h_l77_c7_76e7_iffalse,
result_u8_value_MUX_uxn_device_h_l77_c7_76e7_return_output);

-- vram_addr_MUX_uxn_device_h_l77_c7_76e7
vram_addr_MUX_uxn_device_h_l77_c7_76e7 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l77_c7_76e7_cond,
vram_addr_MUX_uxn_device_h_l77_c7_76e7_iftrue,
vram_addr_MUX_uxn_device_h_l77_c7_76e7_iffalse,
vram_addr_MUX_uxn_device_h_l77_c7_76e7_return_output);

-- y_MUX_uxn_device_h_l77_c7_76e7
y_MUX_uxn_device_h_l77_c7_76e7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l77_c7_76e7_cond,
y_MUX_uxn_device_h_l77_c7_76e7_iftrue,
y_MUX_uxn_device_h_l77_c7_76e7_iffalse,
y_MUX_uxn_device_h_l77_c7_76e7_return_output);

-- ram_addr_MUX_uxn_device_h_l77_c7_76e7
ram_addr_MUX_uxn_device_h_l77_c7_76e7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l77_c7_76e7_cond,
ram_addr_MUX_uxn_device_h_l77_c7_76e7_iftrue,
ram_addr_MUX_uxn_device_h_l77_c7_76e7_iffalse,
ram_addr_MUX_uxn_device_h_l77_c7_76e7_return_output);

-- x_MUX_uxn_device_h_l77_c7_76e7
x_MUX_uxn_device_h_l77_c7_76e7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l77_c7_76e7_cond,
x_MUX_uxn_device_h_l77_c7_76e7_iftrue,
x_MUX_uxn_device_h_l77_c7_76e7_iffalse,
x_MUX_uxn_device_h_l77_c7_76e7_return_output);

-- auto_advance_MUX_uxn_device_h_l77_c7_76e7
auto_advance_MUX_uxn_device_h_l77_c7_76e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l77_c7_76e7_cond,
auto_advance_MUX_uxn_device_h_l77_c7_76e7_iftrue,
auto_advance_MUX_uxn_device_h_l77_c7_76e7_iffalse,
auto_advance_MUX_uxn_device_h_l77_c7_76e7_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l78_c3_a3e7
result_device_ram_address_MUX_uxn_device_h_l78_c3_a3e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l78_c3_a3e7_cond,
result_device_ram_address_MUX_uxn_device_h_l78_c3_a3e7_iftrue,
result_device_ram_address_MUX_uxn_device_h_l78_c3_a3e7_iffalse,
result_device_ram_address_MUX_uxn_device_h_l78_c3_a3e7_return_output);

-- x_MUX_uxn_device_h_l78_c3_a3e7
x_MUX_uxn_device_h_l78_c3_a3e7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l78_c3_a3e7_cond,
x_MUX_uxn_device_h_l78_c3_a3e7_iftrue,
x_MUX_uxn_device_h_l78_c3_a3e7_iffalse,
x_MUX_uxn_device_h_l78_c3_a3e7_return_output);

-- BIN_OP_EQ_uxn_device_h_l84_c11_61bb
BIN_OP_EQ_uxn_device_h_l84_c11_61bb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l84_c11_61bb_left,
BIN_OP_EQ_uxn_device_h_l84_c11_61bb_right,
BIN_OP_EQ_uxn_device_h_l84_c11_61bb_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l84_c7_0b55
result_is_vram_write_MUX_uxn_device_h_l84_c7_0b55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l84_c7_0b55_cond,
result_is_vram_write_MUX_uxn_device_h_l84_c7_0b55_iftrue,
result_is_vram_write_MUX_uxn_device_h_l84_c7_0b55_iffalse,
result_is_vram_write_MUX_uxn_device_h_l84_c7_0b55_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l84_c7_0b55
result_device_ram_address_MUX_uxn_device_h_l84_c7_0b55 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l84_c7_0b55_cond,
result_device_ram_address_MUX_uxn_device_h_l84_c7_0b55_iftrue,
result_device_ram_address_MUX_uxn_device_h_l84_c7_0b55_iffalse,
result_device_ram_address_MUX_uxn_device_h_l84_c7_0b55_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l84_c7_0b55
result_is_deo_done_MUX_uxn_device_h_l84_c7_0b55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l84_c7_0b55_cond,
result_is_deo_done_MUX_uxn_device_h_l84_c7_0b55_iftrue,
result_is_deo_done_MUX_uxn_device_h_l84_c7_0b55_iffalse,
result_is_deo_done_MUX_uxn_device_h_l84_c7_0b55_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l84_c7_0b55
result_vram_write_layer_MUX_uxn_device_h_l84_c7_0b55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l84_c7_0b55_cond,
result_vram_write_layer_MUX_uxn_device_h_l84_c7_0b55_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l84_c7_0b55_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l84_c7_0b55_return_output);

-- result_vram_address_MUX_uxn_device_h_l84_c7_0b55
result_vram_address_MUX_uxn_device_h_l84_c7_0b55 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l84_c7_0b55_cond,
result_vram_address_MUX_uxn_device_h_l84_c7_0b55_iftrue,
result_vram_address_MUX_uxn_device_h_l84_c7_0b55_iffalse,
result_vram_address_MUX_uxn_device_h_l84_c7_0b55_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l84_c7_0b55
result_is_device_ram_write_MUX_uxn_device_h_l84_c7_0b55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l84_c7_0b55_cond,
result_is_device_ram_write_MUX_uxn_device_h_l84_c7_0b55_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l84_c7_0b55_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l84_c7_0b55_return_output);

-- result_u8_value_MUX_uxn_device_h_l84_c7_0b55
result_u8_value_MUX_uxn_device_h_l84_c7_0b55 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l84_c7_0b55_cond,
result_u8_value_MUX_uxn_device_h_l84_c7_0b55_iftrue,
result_u8_value_MUX_uxn_device_h_l84_c7_0b55_iffalse,
result_u8_value_MUX_uxn_device_h_l84_c7_0b55_return_output);

-- vram_addr_MUX_uxn_device_h_l84_c7_0b55
vram_addr_MUX_uxn_device_h_l84_c7_0b55 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l84_c7_0b55_cond,
vram_addr_MUX_uxn_device_h_l84_c7_0b55_iftrue,
vram_addr_MUX_uxn_device_h_l84_c7_0b55_iffalse,
vram_addr_MUX_uxn_device_h_l84_c7_0b55_return_output);

-- y_MUX_uxn_device_h_l84_c7_0b55
y_MUX_uxn_device_h_l84_c7_0b55 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l84_c7_0b55_cond,
y_MUX_uxn_device_h_l84_c7_0b55_iftrue,
y_MUX_uxn_device_h_l84_c7_0b55_iffalse,
y_MUX_uxn_device_h_l84_c7_0b55_return_output);

-- ram_addr_MUX_uxn_device_h_l84_c7_0b55
ram_addr_MUX_uxn_device_h_l84_c7_0b55 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l84_c7_0b55_cond,
ram_addr_MUX_uxn_device_h_l84_c7_0b55_iftrue,
ram_addr_MUX_uxn_device_h_l84_c7_0b55_iffalse,
ram_addr_MUX_uxn_device_h_l84_c7_0b55_return_output);

-- x_MUX_uxn_device_h_l84_c7_0b55
x_MUX_uxn_device_h_l84_c7_0b55 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l84_c7_0b55_cond,
x_MUX_uxn_device_h_l84_c7_0b55_iftrue,
x_MUX_uxn_device_h_l84_c7_0b55_iffalse,
x_MUX_uxn_device_h_l84_c7_0b55_return_output);

-- auto_advance_MUX_uxn_device_h_l84_c7_0b55
auto_advance_MUX_uxn_device_h_l84_c7_0b55 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l84_c7_0b55_cond,
auto_advance_MUX_uxn_device_h_l84_c7_0b55_iftrue,
auto_advance_MUX_uxn_device_h_l84_c7_0b55_iffalse,
auto_advance_MUX_uxn_device_h_l84_c7_0b55_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l85_c3_de64
result_device_ram_address_MUX_uxn_device_h_l85_c3_de64 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l85_c3_de64_cond,
result_device_ram_address_MUX_uxn_device_h_l85_c3_de64_iftrue,
result_device_ram_address_MUX_uxn_device_h_l85_c3_de64_iffalse,
result_device_ram_address_MUX_uxn_device_h_l85_c3_de64_return_output);

-- BIN_OP_EQ_uxn_device_h_l89_c11_bbd0
BIN_OP_EQ_uxn_device_h_l89_c11_bbd0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l89_c11_bbd0_left,
BIN_OP_EQ_uxn_device_h_l89_c11_bbd0_right,
BIN_OP_EQ_uxn_device_h_l89_c11_bbd0_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l89_c7_6231
result_is_vram_write_MUX_uxn_device_h_l89_c7_6231 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l89_c7_6231_cond,
result_is_vram_write_MUX_uxn_device_h_l89_c7_6231_iftrue,
result_is_vram_write_MUX_uxn_device_h_l89_c7_6231_iffalse,
result_is_vram_write_MUX_uxn_device_h_l89_c7_6231_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l89_c7_6231
result_device_ram_address_MUX_uxn_device_h_l89_c7_6231 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l89_c7_6231_cond,
result_device_ram_address_MUX_uxn_device_h_l89_c7_6231_iftrue,
result_device_ram_address_MUX_uxn_device_h_l89_c7_6231_iffalse,
result_device_ram_address_MUX_uxn_device_h_l89_c7_6231_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l89_c7_6231
result_is_deo_done_MUX_uxn_device_h_l89_c7_6231 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l89_c7_6231_cond,
result_is_deo_done_MUX_uxn_device_h_l89_c7_6231_iftrue,
result_is_deo_done_MUX_uxn_device_h_l89_c7_6231_iffalse,
result_is_deo_done_MUX_uxn_device_h_l89_c7_6231_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l89_c7_6231
result_vram_write_layer_MUX_uxn_device_h_l89_c7_6231 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l89_c7_6231_cond,
result_vram_write_layer_MUX_uxn_device_h_l89_c7_6231_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l89_c7_6231_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l89_c7_6231_return_output);

-- result_vram_address_MUX_uxn_device_h_l89_c7_6231
result_vram_address_MUX_uxn_device_h_l89_c7_6231 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l89_c7_6231_cond,
result_vram_address_MUX_uxn_device_h_l89_c7_6231_iftrue,
result_vram_address_MUX_uxn_device_h_l89_c7_6231_iffalse,
result_vram_address_MUX_uxn_device_h_l89_c7_6231_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l89_c7_6231
result_is_device_ram_write_MUX_uxn_device_h_l89_c7_6231 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l89_c7_6231_cond,
result_is_device_ram_write_MUX_uxn_device_h_l89_c7_6231_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l89_c7_6231_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l89_c7_6231_return_output);

-- result_u8_value_MUX_uxn_device_h_l89_c7_6231
result_u8_value_MUX_uxn_device_h_l89_c7_6231 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l89_c7_6231_cond,
result_u8_value_MUX_uxn_device_h_l89_c7_6231_iftrue,
result_u8_value_MUX_uxn_device_h_l89_c7_6231_iffalse,
result_u8_value_MUX_uxn_device_h_l89_c7_6231_return_output);

-- vram_addr_MUX_uxn_device_h_l89_c7_6231
vram_addr_MUX_uxn_device_h_l89_c7_6231 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l89_c7_6231_cond,
vram_addr_MUX_uxn_device_h_l89_c7_6231_iftrue,
vram_addr_MUX_uxn_device_h_l89_c7_6231_iffalse,
vram_addr_MUX_uxn_device_h_l89_c7_6231_return_output);

-- y_MUX_uxn_device_h_l89_c7_6231
y_MUX_uxn_device_h_l89_c7_6231 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l89_c7_6231_cond,
y_MUX_uxn_device_h_l89_c7_6231_iftrue,
y_MUX_uxn_device_h_l89_c7_6231_iffalse,
y_MUX_uxn_device_h_l89_c7_6231_return_output);

-- ram_addr_MUX_uxn_device_h_l89_c7_6231
ram_addr_MUX_uxn_device_h_l89_c7_6231 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l89_c7_6231_cond,
ram_addr_MUX_uxn_device_h_l89_c7_6231_iftrue,
ram_addr_MUX_uxn_device_h_l89_c7_6231_iffalse,
ram_addr_MUX_uxn_device_h_l89_c7_6231_return_output);

-- x_MUX_uxn_device_h_l89_c7_6231
x_MUX_uxn_device_h_l89_c7_6231 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l89_c7_6231_cond,
x_MUX_uxn_device_h_l89_c7_6231_iftrue,
x_MUX_uxn_device_h_l89_c7_6231_iffalse,
x_MUX_uxn_device_h_l89_c7_6231_return_output);

-- auto_advance_MUX_uxn_device_h_l89_c7_6231
auto_advance_MUX_uxn_device_h_l89_c7_6231 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l89_c7_6231_cond,
auto_advance_MUX_uxn_device_h_l89_c7_6231_iftrue,
auto_advance_MUX_uxn_device_h_l89_c7_6231_iffalse,
auto_advance_MUX_uxn_device_h_l89_c7_6231_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l90_c3_5121
result_device_ram_address_MUX_uxn_device_h_l90_c3_5121 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l90_c3_5121_cond,
result_device_ram_address_MUX_uxn_device_h_l90_c3_5121_iftrue,
result_device_ram_address_MUX_uxn_device_h_l90_c3_5121_iffalse,
result_device_ram_address_MUX_uxn_device_h_l90_c3_5121_return_output);

-- x_MUX_uxn_device_h_l90_c3_5121
x_MUX_uxn_device_h_l90_c3_5121 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l90_c3_5121_cond,
x_MUX_uxn_device_h_l90_c3_5121_iftrue,
x_MUX_uxn_device_h_l90_c3_5121_iffalse,
x_MUX_uxn_device_h_l90_c3_5121_return_output);

-- BIN_OP_OR_uxn_device_h_l91_c4_d5a5
BIN_OP_OR_uxn_device_h_l91_c4_d5a5 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l91_c4_d5a5_left,
BIN_OP_OR_uxn_device_h_l91_c4_d5a5_right,
BIN_OP_OR_uxn_device_h_l91_c4_d5a5_return_output);

-- BIN_OP_EQ_uxn_device_h_l95_c11_9959
BIN_OP_EQ_uxn_device_h_l95_c11_9959 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l95_c11_9959_left,
BIN_OP_EQ_uxn_device_h_l95_c11_9959_right,
BIN_OP_EQ_uxn_device_h_l95_c11_9959_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l95_c7_f81e
result_is_vram_write_MUX_uxn_device_h_l95_c7_f81e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l95_c7_f81e_cond,
result_is_vram_write_MUX_uxn_device_h_l95_c7_f81e_iftrue,
result_is_vram_write_MUX_uxn_device_h_l95_c7_f81e_iffalse,
result_is_vram_write_MUX_uxn_device_h_l95_c7_f81e_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l95_c7_f81e
result_device_ram_address_MUX_uxn_device_h_l95_c7_f81e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l95_c7_f81e_cond,
result_device_ram_address_MUX_uxn_device_h_l95_c7_f81e_iftrue,
result_device_ram_address_MUX_uxn_device_h_l95_c7_f81e_iffalse,
result_device_ram_address_MUX_uxn_device_h_l95_c7_f81e_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l95_c7_f81e
result_is_deo_done_MUX_uxn_device_h_l95_c7_f81e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l95_c7_f81e_cond,
result_is_deo_done_MUX_uxn_device_h_l95_c7_f81e_iftrue,
result_is_deo_done_MUX_uxn_device_h_l95_c7_f81e_iffalse,
result_is_deo_done_MUX_uxn_device_h_l95_c7_f81e_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l95_c7_f81e
result_vram_write_layer_MUX_uxn_device_h_l95_c7_f81e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l95_c7_f81e_cond,
result_vram_write_layer_MUX_uxn_device_h_l95_c7_f81e_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l95_c7_f81e_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l95_c7_f81e_return_output);

-- result_vram_address_MUX_uxn_device_h_l95_c7_f81e
result_vram_address_MUX_uxn_device_h_l95_c7_f81e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l95_c7_f81e_cond,
result_vram_address_MUX_uxn_device_h_l95_c7_f81e_iftrue,
result_vram_address_MUX_uxn_device_h_l95_c7_f81e_iffalse,
result_vram_address_MUX_uxn_device_h_l95_c7_f81e_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l95_c7_f81e
result_is_device_ram_write_MUX_uxn_device_h_l95_c7_f81e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l95_c7_f81e_cond,
result_is_device_ram_write_MUX_uxn_device_h_l95_c7_f81e_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l95_c7_f81e_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l95_c7_f81e_return_output);

-- result_u8_value_MUX_uxn_device_h_l95_c7_f81e
result_u8_value_MUX_uxn_device_h_l95_c7_f81e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l95_c7_f81e_cond,
result_u8_value_MUX_uxn_device_h_l95_c7_f81e_iftrue,
result_u8_value_MUX_uxn_device_h_l95_c7_f81e_iffalse,
result_u8_value_MUX_uxn_device_h_l95_c7_f81e_return_output);

-- vram_addr_MUX_uxn_device_h_l95_c7_f81e
vram_addr_MUX_uxn_device_h_l95_c7_f81e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l95_c7_f81e_cond,
vram_addr_MUX_uxn_device_h_l95_c7_f81e_iftrue,
vram_addr_MUX_uxn_device_h_l95_c7_f81e_iffalse,
vram_addr_MUX_uxn_device_h_l95_c7_f81e_return_output);

-- y_MUX_uxn_device_h_l95_c7_f81e
y_MUX_uxn_device_h_l95_c7_f81e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l95_c7_f81e_cond,
y_MUX_uxn_device_h_l95_c7_f81e_iftrue,
y_MUX_uxn_device_h_l95_c7_f81e_iffalse,
y_MUX_uxn_device_h_l95_c7_f81e_return_output);

-- ram_addr_MUX_uxn_device_h_l95_c7_f81e
ram_addr_MUX_uxn_device_h_l95_c7_f81e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l95_c7_f81e_cond,
ram_addr_MUX_uxn_device_h_l95_c7_f81e_iftrue,
ram_addr_MUX_uxn_device_h_l95_c7_f81e_iffalse,
ram_addr_MUX_uxn_device_h_l95_c7_f81e_return_output);

-- x_MUX_uxn_device_h_l95_c7_f81e
x_MUX_uxn_device_h_l95_c7_f81e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l95_c7_f81e_cond,
x_MUX_uxn_device_h_l95_c7_f81e_iftrue,
x_MUX_uxn_device_h_l95_c7_f81e_iffalse,
x_MUX_uxn_device_h_l95_c7_f81e_return_output);

-- auto_advance_MUX_uxn_device_h_l95_c7_f81e
auto_advance_MUX_uxn_device_h_l95_c7_f81e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l95_c7_f81e_cond,
auto_advance_MUX_uxn_device_h_l95_c7_f81e_iftrue,
auto_advance_MUX_uxn_device_h_l95_c7_f81e_iffalse,
auto_advance_MUX_uxn_device_h_l95_c7_f81e_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l96_c3_6c51
result_device_ram_address_MUX_uxn_device_h_l96_c3_6c51 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l96_c3_6c51_cond,
result_device_ram_address_MUX_uxn_device_h_l96_c3_6c51_iftrue,
result_device_ram_address_MUX_uxn_device_h_l96_c3_6c51_iffalse,
result_device_ram_address_MUX_uxn_device_h_l96_c3_6c51_return_output);

-- BIN_OP_EQ_uxn_device_h_l100_c11_e32a
BIN_OP_EQ_uxn_device_h_l100_c11_e32a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l100_c11_e32a_left,
BIN_OP_EQ_uxn_device_h_l100_c11_e32a_right,
BIN_OP_EQ_uxn_device_h_l100_c11_e32a_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l100_c7_ba7b
result_is_vram_write_MUX_uxn_device_h_l100_c7_ba7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l100_c7_ba7b_cond,
result_is_vram_write_MUX_uxn_device_h_l100_c7_ba7b_iftrue,
result_is_vram_write_MUX_uxn_device_h_l100_c7_ba7b_iffalse,
result_is_vram_write_MUX_uxn_device_h_l100_c7_ba7b_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l100_c7_ba7b
result_device_ram_address_MUX_uxn_device_h_l100_c7_ba7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l100_c7_ba7b_cond,
result_device_ram_address_MUX_uxn_device_h_l100_c7_ba7b_iftrue,
result_device_ram_address_MUX_uxn_device_h_l100_c7_ba7b_iffalse,
result_device_ram_address_MUX_uxn_device_h_l100_c7_ba7b_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l100_c7_ba7b
result_is_deo_done_MUX_uxn_device_h_l100_c7_ba7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l100_c7_ba7b_cond,
result_is_deo_done_MUX_uxn_device_h_l100_c7_ba7b_iftrue,
result_is_deo_done_MUX_uxn_device_h_l100_c7_ba7b_iffalse,
result_is_deo_done_MUX_uxn_device_h_l100_c7_ba7b_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l100_c7_ba7b
result_vram_write_layer_MUX_uxn_device_h_l100_c7_ba7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l100_c7_ba7b_cond,
result_vram_write_layer_MUX_uxn_device_h_l100_c7_ba7b_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l100_c7_ba7b_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l100_c7_ba7b_return_output);

-- result_vram_address_MUX_uxn_device_h_l100_c7_ba7b
result_vram_address_MUX_uxn_device_h_l100_c7_ba7b : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l100_c7_ba7b_cond,
result_vram_address_MUX_uxn_device_h_l100_c7_ba7b_iftrue,
result_vram_address_MUX_uxn_device_h_l100_c7_ba7b_iffalse,
result_vram_address_MUX_uxn_device_h_l100_c7_ba7b_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l100_c7_ba7b
result_is_device_ram_write_MUX_uxn_device_h_l100_c7_ba7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l100_c7_ba7b_cond,
result_is_device_ram_write_MUX_uxn_device_h_l100_c7_ba7b_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l100_c7_ba7b_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l100_c7_ba7b_return_output);

-- result_u8_value_MUX_uxn_device_h_l100_c7_ba7b
result_u8_value_MUX_uxn_device_h_l100_c7_ba7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l100_c7_ba7b_cond,
result_u8_value_MUX_uxn_device_h_l100_c7_ba7b_iftrue,
result_u8_value_MUX_uxn_device_h_l100_c7_ba7b_iffalse,
result_u8_value_MUX_uxn_device_h_l100_c7_ba7b_return_output);

-- vram_addr_MUX_uxn_device_h_l100_c7_ba7b
vram_addr_MUX_uxn_device_h_l100_c7_ba7b : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l100_c7_ba7b_cond,
vram_addr_MUX_uxn_device_h_l100_c7_ba7b_iftrue,
vram_addr_MUX_uxn_device_h_l100_c7_ba7b_iffalse,
vram_addr_MUX_uxn_device_h_l100_c7_ba7b_return_output);

-- y_MUX_uxn_device_h_l100_c7_ba7b
y_MUX_uxn_device_h_l100_c7_ba7b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l100_c7_ba7b_cond,
y_MUX_uxn_device_h_l100_c7_ba7b_iftrue,
y_MUX_uxn_device_h_l100_c7_ba7b_iffalse,
y_MUX_uxn_device_h_l100_c7_ba7b_return_output);

-- ram_addr_MUX_uxn_device_h_l100_c7_ba7b
ram_addr_MUX_uxn_device_h_l100_c7_ba7b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l100_c7_ba7b_cond,
ram_addr_MUX_uxn_device_h_l100_c7_ba7b_iftrue,
ram_addr_MUX_uxn_device_h_l100_c7_ba7b_iffalse,
ram_addr_MUX_uxn_device_h_l100_c7_ba7b_return_output);

-- x_MUX_uxn_device_h_l100_c7_ba7b
x_MUX_uxn_device_h_l100_c7_ba7b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l100_c7_ba7b_cond,
x_MUX_uxn_device_h_l100_c7_ba7b_iftrue,
x_MUX_uxn_device_h_l100_c7_ba7b_iffalse,
x_MUX_uxn_device_h_l100_c7_ba7b_return_output);

-- auto_advance_MUX_uxn_device_h_l100_c7_ba7b
auto_advance_MUX_uxn_device_h_l100_c7_ba7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l100_c7_ba7b_cond,
auto_advance_MUX_uxn_device_h_l100_c7_ba7b_iftrue,
auto_advance_MUX_uxn_device_h_l100_c7_ba7b_iffalse,
auto_advance_MUX_uxn_device_h_l100_c7_ba7b_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l101_c3_18ac
result_device_ram_address_MUX_uxn_device_h_l101_c3_18ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l101_c3_18ac_cond,
result_device_ram_address_MUX_uxn_device_h_l101_c3_18ac_iftrue,
result_device_ram_address_MUX_uxn_device_h_l101_c3_18ac_iffalse,
result_device_ram_address_MUX_uxn_device_h_l101_c3_18ac_return_output);

-- y_MUX_uxn_device_h_l101_c3_18ac
y_MUX_uxn_device_h_l101_c3_18ac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l101_c3_18ac_cond,
y_MUX_uxn_device_h_l101_c3_18ac_iftrue,
y_MUX_uxn_device_h_l101_c3_18ac_iffalse,
y_MUX_uxn_device_h_l101_c3_18ac_return_output);

-- BIN_OP_EQ_uxn_device_h_l107_c11_dfe7
BIN_OP_EQ_uxn_device_h_l107_c11_dfe7 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l107_c11_dfe7_left,
BIN_OP_EQ_uxn_device_h_l107_c11_dfe7_right,
BIN_OP_EQ_uxn_device_h_l107_c11_dfe7_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l107_c7_5fb4
result_is_vram_write_MUX_uxn_device_h_l107_c7_5fb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l107_c7_5fb4_cond,
result_is_vram_write_MUX_uxn_device_h_l107_c7_5fb4_iftrue,
result_is_vram_write_MUX_uxn_device_h_l107_c7_5fb4_iffalse,
result_is_vram_write_MUX_uxn_device_h_l107_c7_5fb4_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l107_c7_5fb4
result_device_ram_address_MUX_uxn_device_h_l107_c7_5fb4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l107_c7_5fb4_cond,
result_device_ram_address_MUX_uxn_device_h_l107_c7_5fb4_iftrue,
result_device_ram_address_MUX_uxn_device_h_l107_c7_5fb4_iffalse,
result_device_ram_address_MUX_uxn_device_h_l107_c7_5fb4_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l107_c7_5fb4
result_is_deo_done_MUX_uxn_device_h_l107_c7_5fb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l107_c7_5fb4_cond,
result_is_deo_done_MUX_uxn_device_h_l107_c7_5fb4_iftrue,
result_is_deo_done_MUX_uxn_device_h_l107_c7_5fb4_iffalse,
result_is_deo_done_MUX_uxn_device_h_l107_c7_5fb4_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l107_c7_5fb4
result_vram_write_layer_MUX_uxn_device_h_l107_c7_5fb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l107_c7_5fb4_cond,
result_vram_write_layer_MUX_uxn_device_h_l107_c7_5fb4_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l107_c7_5fb4_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l107_c7_5fb4_return_output);

-- result_vram_address_MUX_uxn_device_h_l107_c7_5fb4
result_vram_address_MUX_uxn_device_h_l107_c7_5fb4 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l107_c7_5fb4_cond,
result_vram_address_MUX_uxn_device_h_l107_c7_5fb4_iftrue,
result_vram_address_MUX_uxn_device_h_l107_c7_5fb4_iffalse,
result_vram_address_MUX_uxn_device_h_l107_c7_5fb4_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l107_c7_5fb4
result_is_device_ram_write_MUX_uxn_device_h_l107_c7_5fb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l107_c7_5fb4_cond,
result_is_device_ram_write_MUX_uxn_device_h_l107_c7_5fb4_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l107_c7_5fb4_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l107_c7_5fb4_return_output);

-- result_u8_value_MUX_uxn_device_h_l107_c7_5fb4
result_u8_value_MUX_uxn_device_h_l107_c7_5fb4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l107_c7_5fb4_cond,
result_u8_value_MUX_uxn_device_h_l107_c7_5fb4_iftrue,
result_u8_value_MUX_uxn_device_h_l107_c7_5fb4_iffalse,
result_u8_value_MUX_uxn_device_h_l107_c7_5fb4_return_output);

-- vram_addr_MUX_uxn_device_h_l107_c7_5fb4
vram_addr_MUX_uxn_device_h_l107_c7_5fb4 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l107_c7_5fb4_cond,
vram_addr_MUX_uxn_device_h_l107_c7_5fb4_iftrue,
vram_addr_MUX_uxn_device_h_l107_c7_5fb4_iffalse,
vram_addr_MUX_uxn_device_h_l107_c7_5fb4_return_output);

-- y_MUX_uxn_device_h_l107_c7_5fb4
y_MUX_uxn_device_h_l107_c7_5fb4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l107_c7_5fb4_cond,
y_MUX_uxn_device_h_l107_c7_5fb4_iftrue,
y_MUX_uxn_device_h_l107_c7_5fb4_iffalse,
y_MUX_uxn_device_h_l107_c7_5fb4_return_output);

-- ram_addr_MUX_uxn_device_h_l107_c7_5fb4
ram_addr_MUX_uxn_device_h_l107_c7_5fb4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l107_c7_5fb4_cond,
ram_addr_MUX_uxn_device_h_l107_c7_5fb4_iftrue,
ram_addr_MUX_uxn_device_h_l107_c7_5fb4_iffalse,
ram_addr_MUX_uxn_device_h_l107_c7_5fb4_return_output);

-- x_MUX_uxn_device_h_l107_c7_5fb4
x_MUX_uxn_device_h_l107_c7_5fb4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l107_c7_5fb4_cond,
x_MUX_uxn_device_h_l107_c7_5fb4_iftrue,
x_MUX_uxn_device_h_l107_c7_5fb4_iffalse,
x_MUX_uxn_device_h_l107_c7_5fb4_return_output);

-- auto_advance_MUX_uxn_device_h_l107_c7_5fb4
auto_advance_MUX_uxn_device_h_l107_c7_5fb4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l107_c7_5fb4_cond,
auto_advance_MUX_uxn_device_h_l107_c7_5fb4_iftrue,
auto_advance_MUX_uxn_device_h_l107_c7_5fb4_iffalse,
auto_advance_MUX_uxn_device_h_l107_c7_5fb4_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l108_c3_ef31
result_device_ram_address_MUX_uxn_device_h_l108_c3_ef31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l108_c3_ef31_cond,
result_device_ram_address_MUX_uxn_device_h_l108_c3_ef31_iftrue,
result_device_ram_address_MUX_uxn_device_h_l108_c3_ef31_iffalse,
result_device_ram_address_MUX_uxn_device_h_l108_c3_ef31_return_output);

-- BIN_OP_EQ_uxn_device_h_l112_c11_8544
BIN_OP_EQ_uxn_device_h_l112_c11_8544 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l112_c11_8544_left,
BIN_OP_EQ_uxn_device_h_l112_c11_8544_right,
BIN_OP_EQ_uxn_device_h_l112_c11_8544_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l112_c7_82e8
result_is_vram_write_MUX_uxn_device_h_l112_c7_82e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l112_c7_82e8_cond,
result_is_vram_write_MUX_uxn_device_h_l112_c7_82e8_iftrue,
result_is_vram_write_MUX_uxn_device_h_l112_c7_82e8_iffalse,
result_is_vram_write_MUX_uxn_device_h_l112_c7_82e8_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l112_c7_82e8
result_device_ram_address_MUX_uxn_device_h_l112_c7_82e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l112_c7_82e8_cond,
result_device_ram_address_MUX_uxn_device_h_l112_c7_82e8_iftrue,
result_device_ram_address_MUX_uxn_device_h_l112_c7_82e8_iffalse,
result_device_ram_address_MUX_uxn_device_h_l112_c7_82e8_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l112_c7_82e8
result_is_deo_done_MUX_uxn_device_h_l112_c7_82e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l112_c7_82e8_cond,
result_is_deo_done_MUX_uxn_device_h_l112_c7_82e8_iftrue,
result_is_deo_done_MUX_uxn_device_h_l112_c7_82e8_iffalse,
result_is_deo_done_MUX_uxn_device_h_l112_c7_82e8_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l112_c7_82e8
result_vram_write_layer_MUX_uxn_device_h_l112_c7_82e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l112_c7_82e8_cond,
result_vram_write_layer_MUX_uxn_device_h_l112_c7_82e8_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l112_c7_82e8_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l112_c7_82e8_return_output);

-- result_vram_address_MUX_uxn_device_h_l112_c7_82e8
result_vram_address_MUX_uxn_device_h_l112_c7_82e8 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l112_c7_82e8_cond,
result_vram_address_MUX_uxn_device_h_l112_c7_82e8_iftrue,
result_vram_address_MUX_uxn_device_h_l112_c7_82e8_iffalse,
result_vram_address_MUX_uxn_device_h_l112_c7_82e8_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l112_c7_82e8
result_is_device_ram_write_MUX_uxn_device_h_l112_c7_82e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l112_c7_82e8_cond,
result_is_device_ram_write_MUX_uxn_device_h_l112_c7_82e8_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l112_c7_82e8_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l112_c7_82e8_return_output);

-- result_u8_value_MUX_uxn_device_h_l112_c7_82e8
result_u8_value_MUX_uxn_device_h_l112_c7_82e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l112_c7_82e8_cond,
result_u8_value_MUX_uxn_device_h_l112_c7_82e8_iftrue,
result_u8_value_MUX_uxn_device_h_l112_c7_82e8_iffalse,
result_u8_value_MUX_uxn_device_h_l112_c7_82e8_return_output);

-- vram_addr_MUX_uxn_device_h_l112_c7_82e8
vram_addr_MUX_uxn_device_h_l112_c7_82e8 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l112_c7_82e8_cond,
vram_addr_MUX_uxn_device_h_l112_c7_82e8_iftrue,
vram_addr_MUX_uxn_device_h_l112_c7_82e8_iffalse,
vram_addr_MUX_uxn_device_h_l112_c7_82e8_return_output);

-- y_MUX_uxn_device_h_l112_c7_82e8
y_MUX_uxn_device_h_l112_c7_82e8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l112_c7_82e8_cond,
y_MUX_uxn_device_h_l112_c7_82e8_iftrue,
y_MUX_uxn_device_h_l112_c7_82e8_iffalse,
y_MUX_uxn_device_h_l112_c7_82e8_return_output);

-- ram_addr_MUX_uxn_device_h_l112_c7_82e8
ram_addr_MUX_uxn_device_h_l112_c7_82e8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l112_c7_82e8_cond,
ram_addr_MUX_uxn_device_h_l112_c7_82e8_iftrue,
ram_addr_MUX_uxn_device_h_l112_c7_82e8_iffalse,
ram_addr_MUX_uxn_device_h_l112_c7_82e8_return_output);

-- x_MUX_uxn_device_h_l112_c7_82e8
x_MUX_uxn_device_h_l112_c7_82e8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l112_c7_82e8_cond,
x_MUX_uxn_device_h_l112_c7_82e8_iftrue,
x_MUX_uxn_device_h_l112_c7_82e8_iffalse,
x_MUX_uxn_device_h_l112_c7_82e8_return_output);

-- auto_advance_MUX_uxn_device_h_l112_c7_82e8
auto_advance_MUX_uxn_device_h_l112_c7_82e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l112_c7_82e8_cond,
auto_advance_MUX_uxn_device_h_l112_c7_82e8_iftrue,
auto_advance_MUX_uxn_device_h_l112_c7_82e8_iffalse,
auto_advance_MUX_uxn_device_h_l112_c7_82e8_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l113_c3_c338
result_device_ram_address_MUX_uxn_device_h_l113_c3_c338 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l113_c3_c338_cond,
result_device_ram_address_MUX_uxn_device_h_l113_c3_c338_iftrue,
result_device_ram_address_MUX_uxn_device_h_l113_c3_c338_iffalse,
result_device_ram_address_MUX_uxn_device_h_l113_c3_c338_return_output);

-- y_MUX_uxn_device_h_l113_c3_c338
y_MUX_uxn_device_h_l113_c3_c338 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l113_c3_c338_cond,
y_MUX_uxn_device_h_l113_c3_c338_iftrue,
y_MUX_uxn_device_h_l113_c3_c338_iffalse,
y_MUX_uxn_device_h_l113_c3_c338_return_output);

-- BIN_OP_OR_uxn_device_h_l114_c4_7cc1
BIN_OP_OR_uxn_device_h_l114_c4_7cc1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l114_c4_7cc1_left,
BIN_OP_OR_uxn_device_h_l114_c4_7cc1_right,
BIN_OP_OR_uxn_device_h_l114_c4_7cc1_return_output);

-- BIN_OP_EQ_uxn_device_h_l118_c11_03cb
BIN_OP_EQ_uxn_device_h_l118_c11_03cb : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l118_c11_03cb_left,
BIN_OP_EQ_uxn_device_h_l118_c11_03cb_right,
BIN_OP_EQ_uxn_device_h_l118_c11_03cb_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l118_c7_d5ea
result_is_vram_write_MUX_uxn_device_h_l118_c7_d5ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l118_c7_d5ea_cond,
result_is_vram_write_MUX_uxn_device_h_l118_c7_d5ea_iftrue,
result_is_vram_write_MUX_uxn_device_h_l118_c7_d5ea_iffalse,
result_is_vram_write_MUX_uxn_device_h_l118_c7_d5ea_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l118_c7_d5ea
result_device_ram_address_MUX_uxn_device_h_l118_c7_d5ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l118_c7_d5ea_cond,
result_device_ram_address_MUX_uxn_device_h_l118_c7_d5ea_iftrue,
result_device_ram_address_MUX_uxn_device_h_l118_c7_d5ea_iffalse,
result_device_ram_address_MUX_uxn_device_h_l118_c7_d5ea_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l118_c7_d5ea
result_is_deo_done_MUX_uxn_device_h_l118_c7_d5ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l118_c7_d5ea_cond,
result_is_deo_done_MUX_uxn_device_h_l118_c7_d5ea_iftrue,
result_is_deo_done_MUX_uxn_device_h_l118_c7_d5ea_iffalse,
result_is_deo_done_MUX_uxn_device_h_l118_c7_d5ea_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l118_c7_d5ea
result_vram_write_layer_MUX_uxn_device_h_l118_c7_d5ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l118_c7_d5ea_cond,
result_vram_write_layer_MUX_uxn_device_h_l118_c7_d5ea_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l118_c7_d5ea_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l118_c7_d5ea_return_output);

-- result_vram_address_MUX_uxn_device_h_l118_c7_d5ea
result_vram_address_MUX_uxn_device_h_l118_c7_d5ea : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l118_c7_d5ea_cond,
result_vram_address_MUX_uxn_device_h_l118_c7_d5ea_iftrue,
result_vram_address_MUX_uxn_device_h_l118_c7_d5ea_iffalse,
result_vram_address_MUX_uxn_device_h_l118_c7_d5ea_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l118_c7_d5ea
result_is_device_ram_write_MUX_uxn_device_h_l118_c7_d5ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l118_c7_d5ea_cond,
result_is_device_ram_write_MUX_uxn_device_h_l118_c7_d5ea_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l118_c7_d5ea_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l118_c7_d5ea_return_output);

-- result_u8_value_MUX_uxn_device_h_l118_c7_d5ea
result_u8_value_MUX_uxn_device_h_l118_c7_d5ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l118_c7_d5ea_cond,
result_u8_value_MUX_uxn_device_h_l118_c7_d5ea_iftrue,
result_u8_value_MUX_uxn_device_h_l118_c7_d5ea_iffalse,
result_u8_value_MUX_uxn_device_h_l118_c7_d5ea_return_output);

-- vram_addr_MUX_uxn_device_h_l118_c7_d5ea
vram_addr_MUX_uxn_device_h_l118_c7_d5ea : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l118_c7_d5ea_cond,
vram_addr_MUX_uxn_device_h_l118_c7_d5ea_iftrue,
vram_addr_MUX_uxn_device_h_l118_c7_d5ea_iffalse,
vram_addr_MUX_uxn_device_h_l118_c7_d5ea_return_output);

-- ram_addr_MUX_uxn_device_h_l118_c7_d5ea
ram_addr_MUX_uxn_device_h_l118_c7_d5ea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l118_c7_d5ea_cond,
ram_addr_MUX_uxn_device_h_l118_c7_d5ea_iftrue,
ram_addr_MUX_uxn_device_h_l118_c7_d5ea_iffalse,
ram_addr_MUX_uxn_device_h_l118_c7_d5ea_return_output);

-- x_MUX_uxn_device_h_l118_c7_d5ea
x_MUX_uxn_device_h_l118_c7_d5ea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l118_c7_d5ea_cond,
x_MUX_uxn_device_h_l118_c7_d5ea_iftrue,
x_MUX_uxn_device_h_l118_c7_d5ea_iffalse,
x_MUX_uxn_device_h_l118_c7_d5ea_return_output);

-- auto_advance_MUX_uxn_device_h_l118_c7_d5ea
auto_advance_MUX_uxn_device_h_l118_c7_d5ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l118_c7_d5ea_cond,
auto_advance_MUX_uxn_device_h_l118_c7_d5ea_iftrue,
auto_advance_MUX_uxn_device_h_l118_c7_d5ea_iffalse,
auto_advance_MUX_uxn_device_h_l118_c7_d5ea_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l119_c3_4341
result_device_ram_address_MUX_uxn_device_h_l119_c3_4341 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l119_c3_4341_cond,
result_device_ram_address_MUX_uxn_device_h_l119_c3_4341_iftrue,
result_device_ram_address_MUX_uxn_device_h_l119_c3_4341_iffalse,
result_device_ram_address_MUX_uxn_device_h_l119_c3_4341_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l119_c3_4341
result_is_deo_done_MUX_uxn_device_h_l119_c3_4341 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l119_c3_4341_cond,
result_is_deo_done_MUX_uxn_device_h_l119_c3_4341_iftrue,
result_is_deo_done_MUX_uxn_device_h_l119_c3_4341_iffalse,
result_is_deo_done_MUX_uxn_device_h_l119_c3_4341_return_output);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l120_c27_178e
BIN_OP_INFERRED_MULT_uxn_device_h_l120_c27_178e : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l120_c27_178e_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l120_c27_178e_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l120_c27_178e_return_output);

-- BIN_OP_PLUS_uxn_device_h_l120_c27_9ccd
BIN_OP_PLUS_uxn_device_h_l120_c27_9ccd : entity work.BIN_OP_PLUS_uint25_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l120_c27_9ccd_left,
BIN_OP_PLUS_uxn_device_h_l120_c27_9ccd_right,
BIN_OP_PLUS_uxn_device_h_l120_c27_9ccd_return_output);

-- BIN_OP_GT_uxn_device_h_l120_c27_02fe
BIN_OP_GT_uxn_device_h_l120_c27_02fe : entity work.BIN_OP_GT_uint26_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_device_h_l120_c27_02fe_left,
BIN_OP_GT_uxn_device_h_l120_c27_02fe_right,
BIN_OP_GT_uxn_device_h_l120_c27_02fe_return_output);

-- MUX_uxn_device_h_l120_c27_2a91
MUX_uxn_device_h_l120_c27_2a91 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l120_c27_2a91_cond,
MUX_uxn_device_h_l120_c27_2a91_iftrue,
MUX_uxn_device_h_l120_c27_2a91_iffalse,
MUX_uxn_device_h_l120_c27_2a91_return_output);

-- BIN_OP_EQ_uxn_device_h_l124_c11_e7bd
BIN_OP_EQ_uxn_device_h_l124_c11_e7bd : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l124_c11_e7bd_left,
BIN_OP_EQ_uxn_device_h_l124_c11_e7bd_right,
BIN_OP_EQ_uxn_device_h_l124_c11_e7bd_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l124_c7_3d44
result_is_vram_write_MUX_uxn_device_h_l124_c7_3d44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l124_c7_3d44_cond,
result_is_vram_write_MUX_uxn_device_h_l124_c7_3d44_iftrue,
result_is_vram_write_MUX_uxn_device_h_l124_c7_3d44_iffalse,
result_is_vram_write_MUX_uxn_device_h_l124_c7_3d44_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l124_c7_3d44
result_device_ram_address_MUX_uxn_device_h_l124_c7_3d44 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l124_c7_3d44_cond,
result_device_ram_address_MUX_uxn_device_h_l124_c7_3d44_iftrue,
result_device_ram_address_MUX_uxn_device_h_l124_c7_3d44_iffalse,
result_device_ram_address_MUX_uxn_device_h_l124_c7_3d44_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l124_c7_3d44
result_is_deo_done_MUX_uxn_device_h_l124_c7_3d44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l124_c7_3d44_cond,
result_is_deo_done_MUX_uxn_device_h_l124_c7_3d44_iftrue,
result_is_deo_done_MUX_uxn_device_h_l124_c7_3d44_iffalse,
result_is_deo_done_MUX_uxn_device_h_l124_c7_3d44_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l124_c7_3d44
result_vram_write_layer_MUX_uxn_device_h_l124_c7_3d44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l124_c7_3d44_cond,
result_vram_write_layer_MUX_uxn_device_h_l124_c7_3d44_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l124_c7_3d44_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l124_c7_3d44_return_output);

-- result_vram_address_MUX_uxn_device_h_l124_c7_3d44
result_vram_address_MUX_uxn_device_h_l124_c7_3d44 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l124_c7_3d44_cond,
result_vram_address_MUX_uxn_device_h_l124_c7_3d44_iftrue,
result_vram_address_MUX_uxn_device_h_l124_c7_3d44_iffalse,
result_vram_address_MUX_uxn_device_h_l124_c7_3d44_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l124_c7_3d44
result_is_device_ram_write_MUX_uxn_device_h_l124_c7_3d44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l124_c7_3d44_cond,
result_is_device_ram_write_MUX_uxn_device_h_l124_c7_3d44_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l124_c7_3d44_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l124_c7_3d44_return_output);

-- result_u8_value_MUX_uxn_device_h_l124_c7_3d44
result_u8_value_MUX_uxn_device_h_l124_c7_3d44 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l124_c7_3d44_cond,
result_u8_value_MUX_uxn_device_h_l124_c7_3d44_iftrue,
result_u8_value_MUX_uxn_device_h_l124_c7_3d44_iffalse,
result_u8_value_MUX_uxn_device_h_l124_c7_3d44_return_output);

-- vram_addr_MUX_uxn_device_h_l124_c7_3d44
vram_addr_MUX_uxn_device_h_l124_c7_3d44 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l124_c7_3d44_cond,
vram_addr_MUX_uxn_device_h_l124_c7_3d44_iftrue,
vram_addr_MUX_uxn_device_h_l124_c7_3d44_iffalse,
vram_addr_MUX_uxn_device_h_l124_c7_3d44_return_output);

-- ram_addr_MUX_uxn_device_h_l124_c7_3d44
ram_addr_MUX_uxn_device_h_l124_c7_3d44 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l124_c7_3d44_cond,
ram_addr_MUX_uxn_device_h_l124_c7_3d44_iftrue,
ram_addr_MUX_uxn_device_h_l124_c7_3d44_iffalse,
ram_addr_MUX_uxn_device_h_l124_c7_3d44_return_output);

-- x_MUX_uxn_device_h_l124_c7_3d44
x_MUX_uxn_device_h_l124_c7_3d44 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l124_c7_3d44_cond,
x_MUX_uxn_device_h_l124_c7_3d44_iftrue,
x_MUX_uxn_device_h_l124_c7_3d44_iffalse,
x_MUX_uxn_device_h_l124_c7_3d44_return_output);

-- auto_advance_MUX_uxn_device_h_l124_c7_3d44
auto_advance_MUX_uxn_device_h_l124_c7_3d44 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l124_c7_3d44_cond,
auto_advance_MUX_uxn_device_h_l124_c7_3d44_iftrue,
auto_advance_MUX_uxn_device_h_l124_c7_3d44_iffalse,
auto_advance_MUX_uxn_device_h_l124_c7_3d44_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l125_c3_2150
result_device_ram_address_MUX_uxn_device_h_l125_c3_2150 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l125_c3_2150_cond,
result_device_ram_address_MUX_uxn_device_h_l125_c3_2150_iftrue,
result_device_ram_address_MUX_uxn_device_h_l125_c3_2150_iffalse,
result_device_ram_address_MUX_uxn_device_h_l125_c3_2150_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l125_c3_2150
result_vram_write_layer_MUX_uxn_device_h_l125_c3_2150 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l125_c3_2150_cond,
result_vram_write_layer_MUX_uxn_device_h_l125_c3_2150_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l125_c3_2150_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l125_c3_2150_return_output);

-- result_vram_address_MUX_uxn_device_h_l125_c3_2150
result_vram_address_MUX_uxn_device_h_l125_c3_2150 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l125_c3_2150_cond,
result_vram_address_MUX_uxn_device_h_l125_c3_2150_iftrue,
result_vram_address_MUX_uxn_device_h_l125_c3_2150_iffalse,
result_vram_address_MUX_uxn_device_h_l125_c3_2150_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l125_c3_2150
result_is_vram_write_MUX_uxn_device_h_l125_c3_2150 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l125_c3_2150_cond,
result_is_vram_write_MUX_uxn_device_h_l125_c3_2150_iftrue,
result_is_vram_write_MUX_uxn_device_h_l125_c3_2150_iffalse,
result_is_vram_write_MUX_uxn_device_h_l125_c3_2150_return_output);

-- result_u8_value_MUX_uxn_device_h_l125_c3_2150
result_u8_value_MUX_uxn_device_h_l125_c3_2150 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l125_c3_2150_cond,
result_u8_value_MUX_uxn_device_h_l125_c3_2150_iftrue,
result_u8_value_MUX_uxn_device_h_l125_c3_2150_iffalse,
result_u8_value_MUX_uxn_device_h_l125_c3_2150_return_output);

-- vram_addr_MUX_uxn_device_h_l125_c3_2150
vram_addr_MUX_uxn_device_h_l125_c3_2150 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l125_c3_2150_cond,
vram_addr_MUX_uxn_device_h_l125_c3_2150_iftrue,
vram_addr_MUX_uxn_device_h_l125_c3_2150_iffalse,
vram_addr_MUX_uxn_device_h_l125_c3_2150_return_output);

-- auto_advance_MUX_uxn_device_h_l125_c3_2150
auto_advance_MUX_uxn_device_h_l125_c3_2150 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l125_c3_2150_cond,
auto_advance_MUX_uxn_device_h_l125_c3_2150_iftrue,
auto_advance_MUX_uxn_device_h_l125_c3_2150_iffalse,
auto_advance_MUX_uxn_device_h_l125_c3_2150_return_output);

-- BIN_OP_AND_uxn_device_h_l128_c32_8870
BIN_OP_AND_uxn_device_h_l128_c32_8870 : entity work.BIN_OP_AND_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l128_c32_8870_left,
BIN_OP_AND_uxn_device_h_l128_c32_8870_right,
BIN_OP_AND_uxn_device_h_l128_c32_8870_return_output);

-- result_vram_address_MUX_uxn_device_h_l131_c4_1268
result_vram_address_MUX_uxn_device_h_l131_c4_1268 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l131_c4_1268_cond,
result_vram_address_MUX_uxn_device_h_l131_c4_1268_iftrue,
result_vram_address_MUX_uxn_device_h_l131_c4_1268_iffalse,
result_vram_address_MUX_uxn_device_h_l131_c4_1268_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l131_c4_1268
result_is_vram_write_MUX_uxn_device_h_l131_c4_1268 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l131_c4_1268_cond,
result_is_vram_write_MUX_uxn_device_h_l131_c4_1268_iftrue,
result_is_vram_write_MUX_uxn_device_h_l131_c4_1268_iffalse,
result_is_vram_write_MUX_uxn_device_h_l131_c4_1268_return_output);

-- vram_addr_MUX_uxn_device_h_l131_c4_1268
vram_addr_MUX_uxn_device_h_l131_c4_1268 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l131_c4_1268_cond,
vram_addr_MUX_uxn_device_h_l131_c4_1268_iftrue,
vram_addr_MUX_uxn_device_h_l131_c4_1268_iffalse,
vram_addr_MUX_uxn_device_h_l131_c4_1268_return_output);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l132_c18_50dd
BIN_OP_INFERRED_MULT_uxn_device_h_l132_c18_50dd : entity work.BIN_OP_INFERRED_MULT_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l132_c18_50dd_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l132_c18_50dd_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l132_c18_50dd_return_output);

-- BIN_OP_PLUS_uxn_device_h_l132_c18_3dfa
BIN_OP_PLUS_uxn_device_h_l132_c18_3dfa : entity work.BIN_OP_PLUS_uint64_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l132_c18_3dfa_left,
BIN_OP_PLUS_uxn_device_h_l132_c18_3dfa_right,
BIN_OP_PLUS_uxn_device_h_l132_c18_3dfa_return_output);

-- BIN_OP_AND_uxn_device_h_l133_c5_ae09
BIN_OP_AND_uxn_device_h_l133_c5_ae09 : entity work.BIN_OP_AND_uint32_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l133_c5_ae09_left,
BIN_OP_AND_uxn_device_h_l133_c5_ae09_right,
BIN_OP_AND_uxn_device_h_l133_c5_ae09_return_output);

-- MUX_uxn_device_h_l134_c19_0b0f
MUX_uxn_device_h_l134_c19_0b0f : entity work.MUX_uint1_t_uint21_t_uint21_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l134_c19_0b0f_cond,
MUX_uxn_device_h_l134_c19_0b0f_iftrue,
MUX_uxn_device_h_l134_c19_0b0f_iffalse,
MUX_uxn_device_h_l134_c19_0b0f_return_output);

-- BIN_OP_OR_uxn_device_h_l134_c5_1182
BIN_OP_OR_uxn_device_h_l134_c5_1182 : entity work.BIN_OP_OR_uint32_t_uint21_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l134_c5_1182_left,
BIN_OP_OR_uxn_device_h_l134_c5_1182_right,
BIN_OP_OR_uxn_device_h_l134_c5_1182_return_output);

-- MUX_uxn_device_h_l135_c19_5967
MUX_uxn_device_h_l135_c19_5967 : entity work.MUX_uint1_t_uint22_t_uint22_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l135_c19_5967_cond,
MUX_uxn_device_h_l135_c19_5967_iftrue,
MUX_uxn_device_h_l135_c19_5967_iffalse,
MUX_uxn_device_h_l135_c19_5967_return_output);

-- BIN_OP_OR_uxn_device_h_l135_c5_4991
BIN_OP_OR_uxn_device_h_l135_c5_4991 : entity work.BIN_OP_OR_uint32_t_uint22_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l135_c5_4991_left,
BIN_OP_OR_uxn_device_h_l135_c5_4991_right,
BIN_OP_OR_uxn_device_h_l135_c5_4991_return_output);

-- BIN_OP_OR_uxn_device_h_l136_c5_81b6
BIN_OP_OR_uxn_device_h_l136_c5_81b6 : entity work.BIN_OP_OR_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l136_c5_81b6_left,
BIN_OP_OR_uxn_device_h_l136_c5_81b6_right,
BIN_OP_OR_uxn_device_h_l136_c5_81b6_return_output);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l140_c28_6579
BIN_OP_INFERRED_MULT_uxn_device_h_l140_c28_6579 : entity work.BIN_OP_INFERRED_MULT_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l140_c28_6579_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l140_c28_6579_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l140_c28_6579_return_output);

-- BIN_OP_PLUS_uxn_device_h_l140_c28_706a
BIN_OP_PLUS_uxn_device_h_l140_c28_706a : entity work.BIN_OP_PLUS_uint64_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l140_c28_706a_left,
BIN_OP_PLUS_uxn_device_h_l140_c28_706a_right,
BIN_OP_PLUS_uxn_device_h_l140_c28_706a_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l144_c8_0544
result_device_ram_address_MUX_uxn_device_h_l144_c8_0544 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l144_c8_0544_cond,
result_device_ram_address_MUX_uxn_device_h_l144_c8_0544_iftrue,
result_device_ram_address_MUX_uxn_device_h_l144_c8_0544_iffalse,
result_device_ram_address_MUX_uxn_device_h_l144_c8_0544_return_output);

-- auto_advance_MUX_uxn_device_h_l144_c8_0544
auto_advance_MUX_uxn_device_h_l144_c8_0544 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l144_c8_0544_cond,
auto_advance_MUX_uxn_device_h_l144_c8_0544_iftrue,
auto_advance_MUX_uxn_device_h_l144_c8_0544_iffalse,
auto_advance_MUX_uxn_device_h_l144_c8_0544_return_output);

-- BIN_OP_EQ_uxn_device_h_l149_c11_aaf4
BIN_OP_EQ_uxn_device_h_l149_c11_aaf4 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l149_c11_aaf4_left,
BIN_OP_EQ_uxn_device_h_l149_c11_aaf4_right,
BIN_OP_EQ_uxn_device_h_l149_c11_aaf4_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l149_c7_bfbe
result_is_vram_write_MUX_uxn_device_h_l149_c7_bfbe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l149_c7_bfbe_cond,
result_is_vram_write_MUX_uxn_device_h_l149_c7_bfbe_iftrue,
result_is_vram_write_MUX_uxn_device_h_l149_c7_bfbe_iffalse,
result_is_vram_write_MUX_uxn_device_h_l149_c7_bfbe_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l149_c7_bfbe
result_device_ram_address_MUX_uxn_device_h_l149_c7_bfbe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l149_c7_bfbe_cond,
result_device_ram_address_MUX_uxn_device_h_l149_c7_bfbe_iftrue,
result_device_ram_address_MUX_uxn_device_h_l149_c7_bfbe_iffalse,
result_device_ram_address_MUX_uxn_device_h_l149_c7_bfbe_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l149_c7_bfbe
result_is_deo_done_MUX_uxn_device_h_l149_c7_bfbe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l149_c7_bfbe_cond,
result_is_deo_done_MUX_uxn_device_h_l149_c7_bfbe_iftrue,
result_is_deo_done_MUX_uxn_device_h_l149_c7_bfbe_iffalse,
result_is_deo_done_MUX_uxn_device_h_l149_c7_bfbe_return_output);

-- result_vram_address_MUX_uxn_device_h_l149_c7_bfbe
result_vram_address_MUX_uxn_device_h_l149_c7_bfbe : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l149_c7_bfbe_cond,
result_vram_address_MUX_uxn_device_h_l149_c7_bfbe_iftrue,
result_vram_address_MUX_uxn_device_h_l149_c7_bfbe_iffalse,
result_vram_address_MUX_uxn_device_h_l149_c7_bfbe_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l149_c7_bfbe
result_is_device_ram_write_MUX_uxn_device_h_l149_c7_bfbe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l149_c7_bfbe_cond,
result_is_device_ram_write_MUX_uxn_device_h_l149_c7_bfbe_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l149_c7_bfbe_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l149_c7_bfbe_return_output);

-- result_u8_value_MUX_uxn_device_h_l149_c7_bfbe
result_u8_value_MUX_uxn_device_h_l149_c7_bfbe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l149_c7_bfbe_cond,
result_u8_value_MUX_uxn_device_h_l149_c7_bfbe_iftrue,
result_u8_value_MUX_uxn_device_h_l149_c7_bfbe_iffalse,
result_u8_value_MUX_uxn_device_h_l149_c7_bfbe_return_output);

-- ram_addr_MUX_uxn_device_h_l149_c7_bfbe
ram_addr_MUX_uxn_device_h_l149_c7_bfbe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l149_c7_bfbe_cond,
ram_addr_MUX_uxn_device_h_l149_c7_bfbe_iftrue,
ram_addr_MUX_uxn_device_h_l149_c7_bfbe_iffalse,
ram_addr_MUX_uxn_device_h_l149_c7_bfbe_return_output);

-- x_MUX_uxn_device_h_l149_c7_bfbe
x_MUX_uxn_device_h_l149_c7_bfbe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l149_c7_bfbe_cond,
x_MUX_uxn_device_h_l149_c7_bfbe_iftrue,
x_MUX_uxn_device_h_l149_c7_bfbe_iffalse,
x_MUX_uxn_device_h_l149_c7_bfbe_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l150_c3_5fc1
result_is_vram_write_MUX_uxn_device_h_l150_c3_5fc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l150_c3_5fc1_cond,
result_is_vram_write_MUX_uxn_device_h_l150_c3_5fc1_iftrue,
result_is_vram_write_MUX_uxn_device_h_l150_c3_5fc1_iffalse,
result_is_vram_write_MUX_uxn_device_h_l150_c3_5fc1_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l150_c3_5fc1
result_device_ram_address_MUX_uxn_device_h_l150_c3_5fc1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l150_c3_5fc1_cond,
result_device_ram_address_MUX_uxn_device_h_l150_c3_5fc1_iftrue,
result_device_ram_address_MUX_uxn_device_h_l150_c3_5fc1_iffalse,
result_device_ram_address_MUX_uxn_device_h_l150_c3_5fc1_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l150_c3_5fc1
result_is_deo_done_MUX_uxn_device_h_l150_c3_5fc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l150_c3_5fc1_cond,
result_is_deo_done_MUX_uxn_device_h_l150_c3_5fc1_iftrue,
result_is_deo_done_MUX_uxn_device_h_l150_c3_5fc1_iffalse,
result_is_deo_done_MUX_uxn_device_h_l150_c3_5fc1_return_output);

-- result_vram_address_MUX_uxn_device_h_l150_c3_5fc1
result_vram_address_MUX_uxn_device_h_l150_c3_5fc1 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l150_c3_5fc1_cond,
result_vram_address_MUX_uxn_device_h_l150_c3_5fc1_iftrue,
result_vram_address_MUX_uxn_device_h_l150_c3_5fc1_iffalse,
result_vram_address_MUX_uxn_device_h_l150_c3_5fc1_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l150_c3_5fc1
result_is_device_ram_write_MUX_uxn_device_h_l150_c3_5fc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l150_c3_5fc1_cond,
result_is_device_ram_write_MUX_uxn_device_h_l150_c3_5fc1_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l150_c3_5fc1_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l150_c3_5fc1_return_output);

-- result_u8_value_MUX_uxn_device_h_l150_c3_5fc1
result_u8_value_MUX_uxn_device_h_l150_c3_5fc1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l150_c3_5fc1_cond,
result_u8_value_MUX_uxn_device_h_l150_c3_5fc1_iftrue,
result_u8_value_MUX_uxn_device_h_l150_c3_5fc1_iffalse,
result_u8_value_MUX_uxn_device_h_l150_c3_5fc1_return_output);

-- x_MUX_uxn_device_h_l150_c3_5fc1
x_MUX_uxn_device_h_l150_c3_5fc1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l150_c3_5fc1_cond,
x_MUX_uxn_device_h_l150_c3_5fc1_iftrue,
x_MUX_uxn_device_h_l150_c3_5fc1_iffalse,
x_MUX_uxn_device_h_l150_c3_5fc1_return_output);

-- UNARY_OP_NOT_uxn_device_h_l155_c9_9342
UNARY_OP_NOT_uxn_device_h_l155_c9_9342 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_device_h_l155_c9_9342_expr,
UNARY_OP_NOT_uxn_device_h_l155_c9_9342_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l155_c4_93e4
result_is_deo_done_MUX_uxn_device_h_l155_c4_93e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l155_c4_93e4_cond,
result_is_deo_done_MUX_uxn_device_h_l155_c4_93e4_iftrue,
result_is_deo_done_MUX_uxn_device_h_l155_c4_93e4_iffalse,
result_is_deo_done_MUX_uxn_device_h_l155_c4_93e4_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l155_c4_93e4
result_is_device_ram_write_MUX_uxn_device_h_l155_c4_93e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l155_c4_93e4_cond,
result_is_device_ram_write_MUX_uxn_device_h_l155_c4_93e4_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l155_c4_93e4_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l155_c4_93e4_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l155_c4_93e4
result_device_ram_address_MUX_uxn_device_h_l155_c4_93e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l155_c4_93e4_cond,
result_device_ram_address_MUX_uxn_device_h_l155_c4_93e4_iftrue,
result_device_ram_address_MUX_uxn_device_h_l155_c4_93e4_iffalse,
result_device_ram_address_MUX_uxn_device_h_l155_c4_93e4_return_output);

-- result_u8_value_MUX_uxn_device_h_l155_c4_93e4
result_u8_value_MUX_uxn_device_h_l155_c4_93e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l155_c4_93e4_cond,
result_u8_value_MUX_uxn_device_h_l155_c4_93e4_iftrue,
result_u8_value_MUX_uxn_device_h_l155_c4_93e4_iffalse,
result_u8_value_MUX_uxn_device_h_l155_c4_93e4_return_output);

-- x_MUX_uxn_device_h_l155_c4_93e4
x_MUX_uxn_device_h_l155_c4_93e4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l155_c4_93e4_cond,
x_MUX_uxn_device_h_l155_c4_93e4_iftrue,
x_MUX_uxn_device_h_l155_c4_93e4_iffalse,
x_MUX_uxn_device_h_l155_c4_93e4_return_output);

-- BIN_OP_AND_uxn_device_h_l156_c9_d0d7
BIN_OP_AND_uxn_device_h_l156_c9_d0d7 : entity work.BIN_OP_AND_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l156_c9_d0d7_left,
BIN_OP_AND_uxn_device_h_l156_c9_d0d7_right,
BIN_OP_AND_uxn_device_h_l156_c9_d0d7_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l156_c5_f4d5
result_is_device_ram_write_MUX_uxn_device_h_l156_c5_f4d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l156_c5_f4d5_cond,
result_is_device_ram_write_MUX_uxn_device_h_l156_c5_f4d5_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l156_c5_f4d5_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l156_c5_f4d5_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l156_c5_f4d5
result_device_ram_address_MUX_uxn_device_h_l156_c5_f4d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l156_c5_f4d5_cond,
result_device_ram_address_MUX_uxn_device_h_l156_c5_f4d5_iftrue,
result_device_ram_address_MUX_uxn_device_h_l156_c5_f4d5_iffalse,
result_device_ram_address_MUX_uxn_device_h_l156_c5_f4d5_return_output);

-- result_u8_value_MUX_uxn_device_h_l156_c5_f4d5
result_u8_value_MUX_uxn_device_h_l156_c5_f4d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l156_c5_f4d5_cond,
result_u8_value_MUX_uxn_device_h_l156_c5_f4d5_iftrue,
result_u8_value_MUX_uxn_device_h_l156_c5_f4d5_iffalse,
result_u8_value_MUX_uxn_device_h_l156_c5_f4d5_return_output);

-- x_MUX_uxn_device_h_l156_c5_f4d5
x_MUX_uxn_device_h_l156_c5_f4d5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l156_c5_f4d5_cond,
x_MUX_uxn_device_h_l156_c5_f4d5_iftrue,
x_MUX_uxn_device_h_l156_c5_f4d5_iffalse,
x_MUX_uxn_device_h_l156_c5_f4d5_return_output);

-- BIN_OP_PLUS_uxn_device_h_l157_c6_6fb1
BIN_OP_PLUS_uxn_device_h_l157_c6_6fb1 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l157_c6_6fb1_left,
BIN_OP_PLUS_uxn_device_h_l157_c6_6fb1_right,
BIN_OP_PLUS_uxn_device_h_l157_c6_6fb1_return_output);

-- CONST_SR_8_uxn_device_h_l160_c34_45ca
CONST_SR_8_uxn_device_h_l160_c34_45ca : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l160_c34_45ca_x,
CONST_SR_8_uxn_device_h_l160_c34_45ca_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l166_c8_942b
result_device_ram_address_MUX_uxn_device_h_l166_c8_942b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l166_c8_942b_cond,
result_device_ram_address_MUX_uxn_device_h_l166_c8_942b_iftrue,
result_device_ram_address_MUX_uxn_device_h_l166_c8_942b_iffalse,
result_device_ram_address_MUX_uxn_device_h_l166_c8_942b_return_output);

-- BIN_OP_EQ_uxn_device_h_l170_c11_d097
BIN_OP_EQ_uxn_device_h_l170_c11_d097 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l170_c11_d097_left,
BIN_OP_EQ_uxn_device_h_l170_c11_d097_right,
BIN_OP_EQ_uxn_device_h_l170_c11_d097_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l170_c7_b03c
result_is_deo_done_MUX_uxn_device_h_l170_c7_b03c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l170_c7_b03c_cond,
result_is_deo_done_MUX_uxn_device_h_l170_c7_b03c_iftrue,
result_is_deo_done_MUX_uxn_device_h_l170_c7_b03c_iffalse,
result_is_deo_done_MUX_uxn_device_h_l170_c7_b03c_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l170_c7_b03c
result_is_device_ram_write_MUX_uxn_device_h_l170_c7_b03c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l170_c7_b03c_cond,
result_is_device_ram_write_MUX_uxn_device_h_l170_c7_b03c_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l170_c7_b03c_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l170_c7_b03c_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l170_c7_b03c
result_device_ram_address_MUX_uxn_device_h_l170_c7_b03c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l170_c7_b03c_cond,
result_device_ram_address_MUX_uxn_device_h_l170_c7_b03c_iftrue,
result_device_ram_address_MUX_uxn_device_h_l170_c7_b03c_iffalse,
result_device_ram_address_MUX_uxn_device_h_l170_c7_b03c_return_output);

-- result_u8_value_MUX_uxn_device_h_l170_c7_b03c
result_u8_value_MUX_uxn_device_h_l170_c7_b03c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l170_c7_b03c_cond,
result_u8_value_MUX_uxn_device_h_l170_c7_b03c_iftrue,
result_u8_value_MUX_uxn_device_h_l170_c7_b03c_iffalse,
result_u8_value_MUX_uxn_device_h_l170_c7_b03c_return_output);

-- ram_addr_MUX_uxn_device_h_l170_c7_b03c
ram_addr_MUX_uxn_device_h_l170_c7_b03c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l170_c7_b03c_cond,
ram_addr_MUX_uxn_device_h_l170_c7_b03c_iftrue,
ram_addr_MUX_uxn_device_h_l170_c7_b03c_iffalse,
ram_addr_MUX_uxn_device_h_l170_c7_b03c_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l171_c3_99f3
result_is_device_ram_write_MUX_uxn_device_h_l171_c3_99f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l171_c3_99f3_cond,
result_is_device_ram_write_MUX_uxn_device_h_l171_c3_99f3_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l171_c3_99f3_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l171_c3_99f3_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l171_c3_99f3
result_device_ram_address_MUX_uxn_device_h_l171_c3_99f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l171_c3_99f3_cond,
result_device_ram_address_MUX_uxn_device_h_l171_c3_99f3_iftrue,
result_device_ram_address_MUX_uxn_device_h_l171_c3_99f3_iffalse,
result_device_ram_address_MUX_uxn_device_h_l171_c3_99f3_return_output);

-- result_u8_value_MUX_uxn_device_h_l171_c3_99f3
result_u8_value_MUX_uxn_device_h_l171_c3_99f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l171_c3_99f3_cond,
result_u8_value_MUX_uxn_device_h_l171_c3_99f3_iftrue,
result_u8_value_MUX_uxn_device_h_l171_c3_99f3_iffalse,
result_u8_value_MUX_uxn_device_h_l171_c3_99f3_return_output);

-- BIN_OP_AND_uxn_device_h_l172_c8_b586
BIN_OP_AND_uxn_device_h_l172_c8_b586 : entity work.BIN_OP_AND_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l172_c8_b586_left,
BIN_OP_AND_uxn_device_h_l172_c8_b586_right,
BIN_OP_AND_uxn_device_h_l172_c8_b586_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l172_c4_ae83
result_is_device_ram_write_MUX_uxn_device_h_l172_c4_ae83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l172_c4_ae83_cond,
result_is_device_ram_write_MUX_uxn_device_h_l172_c4_ae83_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l172_c4_ae83_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l172_c4_ae83_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l172_c4_ae83
result_device_ram_address_MUX_uxn_device_h_l172_c4_ae83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l172_c4_ae83_cond,
result_device_ram_address_MUX_uxn_device_h_l172_c4_ae83_iftrue,
result_device_ram_address_MUX_uxn_device_h_l172_c4_ae83_iffalse,
result_device_ram_address_MUX_uxn_device_h_l172_c4_ae83_return_output);

-- result_u8_value_MUX_uxn_device_h_l172_c4_ae83
result_u8_value_MUX_uxn_device_h_l172_c4_ae83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l172_c4_ae83_cond,
result_u8_value_MUX_uxn_device_h_l172_c4_ae83_iftrue,
result_u8_value_MUX_uxn_device_h_l172_c4_ae83_iffalse,
result_u8_value_MUX_uxn_device_h_l172_c4_ae83_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l178_c3_85d0
result_device_ram_address_MUX_uxn_device_h_l178_c3_85d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l178_c3_85d0_cond,
result_device_ram_address_MUX_uxn_device_h_l178_c3_85d0_iftrue,
result_device_ram_address_MUX_uxn_device_h_l178_c3_85d0_iffalse,
result_device_ram_address_MUX_uxn_device_h_l178_c3_85d0_return_output);

-- ram_addr_MUX_uxn_device_h_l178_c3_85d0
ram_addr_MUX_uxn_device_h_l178_c3_85d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l178_c3_85d0_cond,
ram_addr_MUX_uxn_device_h_l178_c3_85d0_iftrue,
ram_addr_MUX_uxn_device_h_l178_c3_85d0_iffalse,
ram_addr_MUX_uxn_device_h_l178_c3_85d0_return_output);

-- BIN_OP_EQ_uxn_device_h_l184_c11_e7fe
BIN_OP_EQ_uxn_device_h_l184_c11_e7fe : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l184_c11_e7fe_left,
BIN_OP_EQ_uxn_device_h_l184_c11_e7fe_right,
BIN_OP_EQ_uxn_device_h_l184_c11_e7fe_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l184_c7_c45b
result_is_deo_done_MUX_uxn_device_h_l184_c7_c45b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l184_c7_c45b_cond,
result_is_deo_done_MUX_uxn_device_h_l184_c7_c45b_iftrue,
result_is_deo_done_MUX_uxn_device_h_l184_c7_c45b_iffalse,
result_is_deo_done_MUX_uxn_device_h_l184_c7_c45b_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l184_c7_c45b
result_is_device_ram_write_MUX_uxn_device_h_l184_c7_c45b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l184_c7_c45b_cond,
result_is_device_ram_write_MUX_uxn_device_h_l184_c7_c45b_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l184_c7_c45b_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l184_c7_c45b_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l184_c7_c45b
result_device_ram_address_MUX_uxn_device_h_l184_c7_c45b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l184_c7_c45b_cond,
result_device_ram_address_MUX_uxn_device_h_l184_c7_c45b_iftrue,
result_device_ram_address_MUX_uxn_device_h_l184_c7_c45b_iffalse,
result_device_ram_address_MUX_uxn_device_h_l184_c7_c45b_return_output);

-- result_u8_value_MUX_uxn_device_h_l184_c7_c45b
result_u8_value_MUX_uxn_device_h_l184_c7_c45b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l184_c7_c45b_cond,
result_u8_value_MUX_uxn_device_h_l184_c7_c45b_iftrue,
result_u8_value_MUX_uxn_device_h_l184_c7_c45b_iffalse,
result_u8_value_MUX_uxn_device_h_l184_c7_c45b_return_output);

-- ram_addr_MUX_uxn_device_h_l184_c7_c45b
ram_addr_MUX_uxn_device_h_l184_c7_c45b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l184_c7_c45b_cond,
ram_addr_MUX_uxn_device_h_l184_c7_c45b_iftrue,
ram_addr_MUX_uxn_device_h_l184_c7_c45b_iffalse,
ram_addr_MUX_uxn_device_h_l184_c7_c45b_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l185_c3_b7f1
result_is_device_ram_write_MUX_uxn_device_h_l185_c3_b7f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l185_c3_b7f1_cond,
result_is_device_ram_write_MUX_uxn_device_h_l185_c3_b7f1_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l185_c3_b7f1_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l185_c3_b7f1_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l185_c3_b7f1
result_device_ram_address_MUX_uxn_device_h_l185_c3_b7f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l185_c3_b7f1_cond,
result_device_ram_address_MUX_uxn_device_h_l185_c3_b7f1_iftrue,
result_device_ram_address_MUX_uxn_device_h_l185_c3_b7f1_iffalse,
result_device_ram_address_MUX_uxn_device_h_l185_c3_b7f1_return_output);

-- result_u8_value_MUX_uxn_device_h_l185_c3_b7f1
result_u8_value_MUX_uxn_device_h_l185_c3_b7f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l185_c3_b7f1_cond,
result_u8_value_MUX_uxn_device_h_l185_c3_b7f1_iftrue,
result_u8_value_MUX_uxn_device_h_l185_c3_b7f1_iffalse,
result_u8_value_MUX_uxn_device_h_l185_c3_b7f1_return_output);

-- BIN_OP_AND_uxn_device_h_l186_c8_bb02
BIN_OP_AND_uxn_device_h_l186_c8_bb02 : entity work.BIN_OP_AND_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l186_c8_bb02_left,
BIN_OP_AND_uxn_device_h_l186_c8_bb02_right,
BIN_OP_AND_uxn_device_h_l186_c8_bb02_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l186_c4_f747
result_is_device_ram_write_MUX_uxn_device_h_l186_c4_f747 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l186_c4_f747_cond,
result_is_device_ram_write_MUX_uxn_device_h_l186_c4_f747_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l186_c4_f747_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l186_c4_f747_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l186_c4_f747
result_device_ram_address_MUX_uxn_device_h_l186_c4_f747 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l186_c4_f747_cond,
result_device_ram_address_MUX_uxn_device_h_l186_c4_f747_iftrue,
result_device_ram_address_MUX_uxn_device_h_l186_c4_f747_iffalse,
result_device_ram_address_MUX_uxn_device_h_l186_c4_f747_return_output);

-- result_u8_value_MUX_uxn_device_h_l186_c4_f747
result_u8_value_MUX_uxn_device_h_l186_c4_f747 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l186_c4_f747_cond,
result_u8_value_MUX_uxn_device_h_l186_c4_f747_iftrue,
result_u8_value_MUX_uxn_device_h_l186_c4_f747_iffalse,
result_u8_value_MUX_uxn_device_h_l186_c4_f747_return_output);

-- CONST_SR_8_uxn_device_h_l189_c33_cd3a
CONST_SR_8_uxn_device_h_l189_c33_cd3a : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l189_c33_cd3a_x,
CONST_SR_8_uxn_device_h_l189_c33_cd3a_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l192_c3_ab93
result_device_ram_address_MUX_uxn_device_h_l192_c3_ab93 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l192_c3_ab93_cond,
result_device_ram_address_MUX_uxn_device_h_l192_c3_ab93_iftrue,
result_device_ram_address_MUX_uxn_device_h_l192_c3_ab93_iffalse,
result_device_ram_address_MUX_uxn_device_h_l192_c3_ab93_return_output);

-- BIN_OP_EQ_uxn_device_h_l196_c11_0992
BIN_OP_EQ_uxn_device_h_l196_c11_0992 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l196_c11_0992_left,
BIN_OP_EQ_uxn_device_h_l196_c11_0992_right,
BIN_OP_EQ_uxn_device_h_l196_c11_0992_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l196_c7_1f25
result_is_deo_done_MUX_uxn_device_h_l196_c7_1f25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l196_c7_1f25_cond,
result_is_deo_done_MUX_uxn_device_h_l196_c7_1f25_iftrue,
result_is_deo_done_MUX_uxn_device_h_l196_c7_1f25_iffalse,
result_is_deo_done_MUX_uxn_device_h_l196_c7_1f25_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l196_c7_1f25
result_is_device_ram_write_MUX_uxn_device_h_l196_c7_1f25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l196_c7_1f25_cond,
result_is_device_ram_write_MUX_uxn_device_h_l196_c7_1f25_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l196_c7_1f25_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l196_c7_1f25_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l196_c7_1f25
result_device_ram_address_MUX_uxn_device_h_l196_c7_1f25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l196_c7_1f25_cond,
result_device_ram_address_MUX_uxn_device_h_l196_c7_1f25_iftrue,
result_device_ram_address_MUX_uxn_device_h_l196_c7_1f25_iffalse,
result_device_ram_address_MUX_uxn_device_h_l196_c7_1f25_return_output);

-- result_u8_value_MUX_uxn_device_h_l196_c7_1f25
result_u8_value_MUX_uxn_device_h_l196_c7_1f25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l196_c7_1f25_cond,
result_u8_value_MUX_uxn_device_h_l196_c7_1f25_iftrue,
result_u8_value_MUX_uxn_device_h_l196_c7_1f25_iffalse,
result_u8_value_MUX_uxn_device_h_l196_c7_1f25_return_output);

-- ram_addr_MUX_uxn_device_h_l196_c7_1f25
ram_addr_MUX_uxn_device_h_l196_c7_1f25 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l196_c7_1f25_cond,
ram_addr_MUX_uxn_device_h_l196_c7_1f25_iftrue,
ram_addr_MUX_uxn_device_h_l196_c7_1f25_iffalse,
ram_addr_MUX_uxn_device_h_l196_c7_1f25_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l197_c3_e13e
result_is_device_ram_write_MUX_uxn_device_h_l197_c3_e13e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l197_c3_e13e_cond,
result_is_device_ram_write_MUX_uxn_device_h_l197_c3_e13e_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l197_c3_e13e_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l197_c3_e13e_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l197_c3_e13e
result_device_ram_address_MUX_uxn_device_h_l197_c3_e13e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l197_c3_e13e_cond,
result_device_ram_address_MUX_uxn_device_h_l197_c3_e13e_iftrue,
result_device_ram_address_MUX_uxn_device_h_l197_c3_e13e_iffalse,
result_device_ram_address_MUX_uxn_device_h_l197_c3_e13e_return_output);

-- result_u8_value_MUX_uxn_device_h_l197_c3_e13e
result_u8_value_MUX_uxn_device_h_l197_c3_e13e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l197_c3_e13e_cond,
result_u8_value_MUX_uxn_device_h_l197_c3_e13e_iftrue,
result_u8_value_MUX_uxn_device_h_l197_c3_e13e_iffalse,
result_u8_value_MUX_uxn_device_h_l197_c3_e13e_return_output);

-- BIN_OP_AND_uxn_device_h_l198_c8_a07b
BIN_OP_AND_uxn_device_h_l198_c8_a07b : entity work.BIN_OP_AND_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l198_c8_a07b_left,
BIN_OP_AND_uxn_device_h_l198_c8_a07b_right,
BIN_OP_AND_uxn_device_h_l198_c8_a07b_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l198_c4_f395
result_is_device_ram_write_MUX_uxn_device_h_l198_c4_f395 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l198_c4_f395_cond,
result_is_device_ram_write_MUX_uxn_device_h_l198_c4_f395_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l198_c4_f395_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l198_c4_f395_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l198_c4_f395
result_device_ram_address_MUX_uxn_device_h_l198_c4_f395 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l198_c4_f395_cond,
result_device_ram_address_MUX_uxn_device_h_l198_c4_f395_iftrue,
result_device_ram_address_MUX_uxn_device_h_l198_c4_f395_iffalse,
result_device_ram_address_MUX_uxn_device_h_l198_c4_f395_return_output);

-- result_u8_value_MUX_uxn_device_h_l198_c4_f395
result_u8_value_MUX_uxn_device_h_l198_c4_f395 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l198_c4_f395_cond,
result_u8_value_MUX_uxn_device_h_l198_c4_f395_iftrue,
result_u8_value_MUX_uxn_device_h_l198_c4_f395_iffalse,
result_u8_value_MUX_uxn_device_h_l198_c4_f395_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l204_c3_197f
result_is_deo_done_MUX_uxn_device_h_l204_c3_197f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l204_c3_197f_cond,
result_is_deo_done_MUX_uxn_device_h_l204_c3_197f_iftrue,
result_is_deo_done_MUX_uxn_device_h_l204_c3_197f_iffalse,
result_is_deo_done_MUX_uxn_device_h_l204_c3_197f_return_output);

-- ram_addr_MUX_uxn_device_h_l204_c3_197f
ram_addr_MUX_uxn_device_h_l204_c3_197f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l204_c3_197f_cond,
ram_addr_MUX_uxn_device_h_l204_c3_197f_iftrue,
ram_addr_MUX_uxn_device_h_l204_c3_197f_iffalse,
ram_addr_MUX_uxn_device_h_l204_c3_197f_return_output);

-- BIN_OP_OR_uxn_device_h_l205_c4_c8b7
BIN_OP_OR_uxn_device_h_l205_c4_c8b7 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l205_c4_c8b7_left,
BIN_OP_OR_uxn_device_h_l205_c4_c8b7_right,
BIN_OP_OR_uxn_device_h_l205_c4_c8b7_return_output);

-- BIN_OP_EQ_uxn_device_h_l210_c11_f124
BIN_OP_EQ_uxn_device_h_l210_c11_f124 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l210_c11_f124_left,
BIN_OP_EQ_uxn_device_h_l210_c11_f124_right,
BIN_OP_EQ_uxn_device_h_l210_c11_f124_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l210_c7_72c7
result_device_ram_address_MUX_uxn_device_h_l210_c7_72c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l210_c7_72c7_cond,
result_device_ram_address_MUX_uxn_device_h_l210_c7_72c7_iftrue,
result_device_ram_address_MUX_uxn_device_h_l210_c7_72c7_iffalse,
result_device_ram_address_MUX_uxn_device_h_l210_c7_72c7_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l210_c7_72c7
result_is_device_ram_write_MUX_uxn_device_h_l210_c7_72c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l210_c7_72c7_cond,
result_is_device_ram_write_MUX_uxn_device_h_l210_c7_72c7_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l210_c7_72c7_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l210_c7_72c7_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l210_c7_72c7
result_is_deo_done_MUX_uxn_device_h_l210_c7_72c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l210_c7_72c7_cond,
result_is_deo_done_MUX_uxn_device_h_l210_c7_72c7_iftrue,
result_is_deo_done_MUX_uxn_device_h_l210_c7_72c7_iffalse,
result_is_deo_done_MUX_uxn_device_h_l210_c7_72c7_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l211_c3_8d0f
result_device_ram_address_MUX_uxn_device_h_l211_c3_8d0f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l211_c3_8d0f_cond,
result_device_ram_address_MUX_uxn_device_h_l211_c3_8d0f_iftrue,
result_device_ram_address_MUX_uxn_device_h_l211_c3_8d0f_iffalse,
result_device_ram_address_MUX_uxn_device_h_l211_c3_8d0f_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l211_c3_8d0f
result_is_device_ram_write_MUX_uxn_device_h_l211_c3_8d0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l211_c3_8d0f_cond,
result_is_device_ram_write_MUX_uxn_device_h_l211_c3_8d0f_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l211_c3_8d0f_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l211_c3_8d0f_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l211_c3_8d0f
result_is_deo_done_MUX_uxn_device_h_l211_c3_8d0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l211_c3_8d0f_cond,
result_is_deo_done_MUX_uxn_device_h_l211_c3_8d0f_iftrue,
result_is_deo_done_MUX_uxn_device_h_l211_c3_8d0f_iffalse,
result_is_deo_done_MUX_uxn_device_h_l211_c3_8d0f_return_output);

-- CONST_SL_8_uint16_t_uxn_device_h_l80_l181_l103_DUPLICATE_f0ca
CONST_SL_8_uint16_t_uxn_device_h_l80_l181_l103_DUPLICATE_f0ca : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_device_h_l80_l181_l103_DUPLICATE_f0ca_x,
CONST_SL_8_uint16_t_uxn_device_h_l80_l181_l103_DUPLICATE_f0ca_return_output);

-- CONST_SR_1_uint8_t_uxn_device_h_l198_l186_DUPLICATE_bbf7
CONST_SR_1_uint8_t_uxn_device_h_l198_l186_DUPLICATE_bbf7 : entity work.CONST_SR_1_uint8_t_0CLK_de264c78 port map (
CONST_SR_1_uint8_t_uxn_device_h_l198_l186_DUPLICATE_bbf7_x,
CONST_SR_1_uint8_t_uxn_device_h_l198_l186_DUPLICATE_bbf7_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 device_port,
 phase,
 previous_device_ram_read,
 previous_ram_read,
 -- Registers
 vram_addr,
 x,
 y,
 ram_addr,
 ctrl,
 auto_advance,
 color,
 is_pixel_port,
 is_sprite_port,
 is_drawing_port,
 ctrl_mode,
 flip_x,
 flip_y,
 layer,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_device_h_l42_c6_10f4_return_output,
 result_is_vram_write_MUX_uxn_device_h_l42_c2_c27c_return_output,
 result_device_ram_address_MUX_uxn_device_h_l42_c2_c27c_return_output,
 result_is_deo_done_MUX_uxn_device_h_l42_c2_c27c_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l42_c2_c27c_return_output,
 result_vram_address_MUX_uxn_device_h_l42_c2_c27c_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l42_c2_c27c_return_output,
 result_u8_value_MUX_uxn_device_h_l42_c2_c27c_return_output,
 vram_addr_MUX_uxn_device_h_l42_c2_c27c_return_output,
 ctrl_MUX_uxn_device_h_l42_c2_c27c_return_output,
 color_MUX_uxn_device_h_l42_c2_c27c_return_output,
 layer_MUX_uxn_device_h_l42_c2_c27c_return_output,
 y_MUX_uxn_device_h_l42_c2_c27c_return_output,
 flip_y_MUX_uxn_device_h_l42_c2_c27c_return_output,
 ram_addr_MUX_uxn_device_h_l42_c2_c27c_return_output,
 is_sprite_port_MUX_uxn_device_h_l42_c2_c27c_return_output,
 x_MUX_uxn_device_h_l42_c2_c27c_return_output,
 auto_advance_MUX_uxn_device_h_l42_c2_c27c_return_output,
 flip_x_MUX_uxn_device_h_l42_c2_c27c_return_output,
 is_pixel_port_MUX_uxn_device_h_l42_c2_c27c_return_output,
 is_drawing_port_MUX_uxn_device_h_l42_c2_c27c_return_output,
 ctrl_mode_MUX_uxn_device_h_l42_c2_c27c_return_output,
 BIN_OP_EQ_uxn_device_h_l43_c19_c5ea_return_output,
 MUX_uxn_device_h_l43_c19_f016_return_output,
 BIN_OP_EQ_uxn_device_h_l44_c20_fd38_return_output,
 MUX_uxn_device_h_l44_c20_9375_return_output,
 BIN_OP_OR_uxn_device_h_l45_c21_23f8_return_output,
 result_device_ram_address_MUX_uxn_device_h_l49_c3_de5f_return_output,
 result_is_deo_done_MUX_uxn_device_h_l49_c3_de5f_return_output,
 MUX_uxn_device_h_l50_c32_ff36_return_output,
 BIN_OP_EQ_uxn_device_h_l56_c11_25a0_return_output,
 result_is_vram_write_MUX_uxn_device_h_l56_c7_f9d9_return_output,
 result_device_ram_address_MUX_uxn_device_h_l56_c7_f9d9_return_output,
 result_is_deo_done_MUX_uxn_device_h_l56_c7_f9d9_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l56_c7_f9d9_return_output,
 result_vram_address_MUX_uxn_device_h_l56_c7_f9d9_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l56_c7_f9d9_return_output,
 result_u8_value_MUX_uxn_device_h_l56_c7_f9d9_return_output,
 vram_addr_MUX_uxn_device_h_l56_c7_f9d9_return_output,
 ctrl_MUX_uxn_device_h_l56_c7_f9d9_return_output,
 color_MUX_uxn_device_h_l56_c7_f9d9_return_output,
 layer_MUX_uxn_device_h_l56_c7_f9d9_return_output,
 y_MUX_uxn_device_h_l56_c7_f9d9_return_output,
 flip_y_MUX_uxn_device_h_l56_c7_f9d9_return_output,
 ram_addr_MUX_uxn_device_h_l56_c7_f9d9_return_output,
 x_MUX_uxn_device_h_l56_c7_f9d9_return_output,
 auto_advance_MUX_uxn_device_h_l56_c7_f9d9_return_output,
 flip_x_MUX_uxn_device_h_l56_c7_f9d9_return_output,
 ctrl_mode_MUX_uxn_device_h_l56_c7_f9d9_return_output,
 result_device_ram_address_MUX_uxn_device_h_l57_c3_8f9c_return_output,
 MUX_uxn_device_h_l58_c32_3abd_return_output,
 BIN_OP_EQ_uxn_device_h_l61_c11_5e8f_return_output,
 result_is_vram_write_MUX_uxn_device_h_l61_c7_5d0a_return_output,
 result_device_ram_address_MUX_uxn_device_h_l61_c7_5d0a_return_output,
 result_is_deo_done_MUX_uxn_device_h_l61_c7_5d0a_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l61_c7_5d0a_return_output,
 result_vram_address_MUX_uxn_device_h_l61_c7_5d0a_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l61_c7_5d0a_return_output,
 result_u8_value_MUX_uxn_device_h_l61_c7_5d0a_return_output,
 vram_addr_MUX_uxn_device_h_l61_c7_5d0a_return_output,
 ctrl_MUX_uxn_device_h_l61_c7_5d0a_return_output,
 color_MUX_uxn_device_h_l61_c7_5d0a_return_output,
 layer_MUX_uxn_device_h_l61_c7_5d0a_return_output,
 y_MUX_uxn_device_h_l61_c7_5d0a_return_output,
 flip_y_MUX_uxn_device_h_l61_c7_5d0a_return_output,
 ram_addr_MUX_uxn_device_h_l61_c7_5d0a_return_output,
 x_MUX_uxn_device_h_l61_c7_5d0a_return_output,
 auto_advance_MUX_uxn_device_h_l61_c7_5d0a_return_output,
 flip_x_MUX_uxn_device_h_l61_c7_5d0a_return_output,
 ctrl_mode_MUX_uxn_device_h_l61_c7_5d0a_return_output,
 result_device_ram_address_MUX_uxn_device_h_l62_c3_6024_return_output,
 ctrl_MUX_uxn_device_h_l62_c3_6024_return_output,
 color_MUX_uxn_device_h_l62_c3_6024_return_output,
 layer_MUX_uxn_device_h_l62_c3_6024_return_output,
 flip_y_MUX_uxn_device_h_l62_c3_6024_return_output,
 flip_x_MUX_uxn_device_h_l62_c3_6024_return_output,
 ctrl_mode_MUX_uxn_device_h_l62_c3_6024_return_output,
 CONST_SR_7_uxn_device_h_l65_c26_808b_return_output,
 CONST_SR_6_uxn_device_h_l66_c22_77cc_return_output,
 CONST_SR_5_uxn_device_h_l67_c23_34f6_return_output,
 CONST_SR_4_uxn_device_h_l68_c23_0abd_return_output,
 BIN_OP_EQ_uxn_device_h_l72_c11_b403_return_output,
 result_is_vram_write_MUX_uxn_device_h_l72_c7_470e_return_output,
 result_device_ram_address_MUX_uxn_device_h_l72_c7_470e_return_output,
 result_is_deo_done_MUX_uxn_device_h_l72_c7_470e_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l72_c7_470e_return_output,
 result_vram_address_MUX_uxn_device_h_l72_c7_470e_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l72_c7_470e_return_output,
 result_u8_value_MUX_uxn_device_h_l72_c7_470e_return_output,
 vram_addr_MUX_uxn_device_h_l72_c7_470e_return_output,
 y_MUX_uxn_device_h_l72_c7_470e_return_output,
 ram_addr_MUX_uxn_device_h_l72_c7_470e_return_output,
 x_MUX_uxn_device_h_l72_c7_470e_return_output,
 auto_advance_MUX_uxn_device_h_l72_c7_470e_return_output,
 result_device_ram_address_MUX_uxn_device_h_l73_c3_d1e7_return_output,
 BIN_OP_EQ_uxn_device_h_l77_c11_545d_return_output,
 result_is_vram_write_MUX_uxn_device_h_l77_c7_76e7_return_output,
 result_device_ram_address_MUX_uxn_device_h_l77_c7_76e7_return_output,
 result_is_deo_done_MUX_uxn_device_h_l77_c7_76e7_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l77_c7_76e7_return_output,
 result_vram_address_MUX_uxn_device_h_l77_c7_76e7_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l77_c7_76e7_return_output,
 result_u8_value_MUX_uxn_device_h_l77_c7_76e7_return_output,
 vram_addr_MUX_uxn_device_h_l77_c7_76e7_return_output,
 y_MUX_uxn_device_h_l77_c7_76e7_return_output,
 ram_addr_MUX_uxn_device_h_l77_c7_76e7_return_output,
 x_MUX_uxn_device_h_l77_c7_76e7_return_output,
 auto_advance_MUX_uxn_device_h_l77_c7_76e7_return_output,
 result_device_ram_address_MUX_uxn_device_h_l78_c3_a3e7_return_output,
 x_MUX_uxn_device_h_l78_c3_a3e7_return_output,
 BIN_OP_EQ_uxn_device_h_l84_c11_61bb_return_output,
 result_is_vram_write_MUX_uxn_device_h_l84_c7_0b55_return_output,
 result_device_ram_address_MUX_uxn_device_h_l84_c7_0b55_return_output,
 result_is_deo_done_MUX_uxn_device_h_l84_c7_0b55_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l84_c7_0b55_return_output,
 result_vram_address_MUX_uxn_device_h_l84_c7_0b55_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l84_c7_0b55_return_output,
 result_u8_value_MUX_uxn_device_h_l84_c7_0b55_return_output,
 vram_addr_MUX_uxn_device_h_l84_c7_0b55_return_output,
 y_MUX_uxn_device_h_l84_c7_0b55_return_output,
 ram_addr_MUX_uxn_device_h_l84_c7_0b55_return_output,
 x_MUX_uxn_device_h_l84_c7_0b55_return_output,
 auto_advance_MUX_uxn_device_h_l84_c7_0b55_return_output,
 result_device_ram_address_MUX_uxn_device_h_l85_c3_de64_return_output,
 BIN_OP_EQ_uxn_device_h_l89_c11_bbd0_return_output,
 result_is_vram_write_MUX_uxn_device_h_l89_c7_6231_return_output,
 result_device_ram_address_MUX_uxn_device_h_l89_c7_6231_return_output,
 result_is_deo_done_MUX_uxn_device_h_l89_c7_6231_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l89_c7_6231_return_output,
 result_vram_address_MUX_uxn_device_h_l89_c7_6231_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l89_c7_6231_return_output,
 result_u8_value_MUX_uxn_device_h_l89_c7_6231_return_output,
 vram_addr_MUX_uxn_device_h_l89_c7_6231_return_output,
 y_MUX_uxn_device_h_l89_c7_6231_return_output,
 ram_addr_MUX_uxn_device_h_l89_c7_6231_return_output,
 x_MUX_uxn_device_h_l89_c7_6231_return_output,
 auto_advance_MUX_uxn_device_h_l89_c7_6231_return_output,
 result_device_ram_address_MUX_uxn_device_h_l90_c3_5121_return_output,
 x_MUX_uxn_device_h_l90_c3_5121_return_output,
 BIN_OP_OR_uxn_device_h_l91_c4_d5a5_return_output,
 BIN_OP_EQ_uxn_device_h_l95_c11_9959_return_output,
 result_is_vram_write_MUX_uxn_device_h_l95_c7_f81e_return_output,
 result_device_ram_address_MUX_uxn_device_h_l95_c7_f81e_return_output,
 result_is_deo_done_MUX_uxn_device_h_l95_c7_f81e_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l95_c7_f81e_return_output,
 result_vram_address_MUX_uxn_device_h_l95_c7_f81e_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l95_c7_f81e_return_output,
 result_u8_value_MUX_uxn_device_h_l95_c7_f81e_return_output,
 vram_addr_MUX_uxn_device_h_l95_c7_f81e_return_output,
 y_MUX_uxn_device_h_l95_c7_f81e_return_output,
 ram_addr_MUX_uxn_device_h_l95_c7_f81e_return_output,
 x_MUX_uxn_device_h_l95_c7_f81e_return_output,
 auto_advance_MUX_uxn_device_h_l95_c7_f81e_return_output,
 result_device_ram_address_MUX_uxn_device_h_l96_c3_6c51_return_output,
 BIN_OP_EQ_uxn_device_h_l100_c11_e32a_return_output,
 result_is_vram_write_MUX_uxn_device_h_l100_c7_ba7b_return_output,
 result_device_ram_address_MUX_uxn_device_h_l100_c7_ba7b_return_output,
 result_is_deo_done_MUX_uxn_device_h_l100_c7_ba7b_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l100_c7_ba7b_return_output,
 result_vram_address_MUX_uxn_device_h_l100_c7_ba7b_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l100_c7_ba7b_return_output,
 result_u8_value_MUX_uxn_device_h_l100_c7_ba7b_return_output,
 vram_addr_MUX_uxn_device_h_l100_c7_ba7b_return_output,
 y_MUX_uxn_device_h_l100_c7_ba7b_return_output,
 ram_addr_MUX_uxn_device_h_l100_c7_ba7b_return_output,
 x_MUX_uxn_device_h_l100_c7_ba7b_return_output,
 auto_advance_MUX_uxn_device_h_l100_c7_ba7b_return_output,
 result_device_ram_address_MUX_uxn_device_h_l101_c3_18ac_return_output,
 y_MUX_uxn_device_h_l101_c3_18ac_return_output,
 BIN_OP_EQ_uxn_device_h_l107_c11_dfe7_return_output,
 result_is_vram_write_MUX_uxn_device_h_l107_c7_5fb4_return_output,
 result_device_ram_address_MUX_uxn_device_h_l107_c7_5fb4_return_output,
 result_is_deo_done_MUX_uxn_device_h_l107_c7_5fb4_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l107_c7_5fb4_return_output,
 result_vram_address_MUX_uxn_device_h_l107_c7_5fb4_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l107_c7_5fb4_return_output,
 result_u8_value_MUX_uxn_device_h_l107_c7_5fb4_return_output,
 vram_addr_MUX_uxn_device_h_l107_c7_5fb4_return_output,
 y_MUX_uxn_device_h_l107_c7_5fb4_return_output,
 ram_addr_MUX_uxn_device_h_l107_c7_5fb4_return_output,
 x_MUX_uxn_device_h_l107_c7_5fb4_return_output,
 auto_advance_MUX_uxn_device_h_l107_c7_5fb4_return_output,
 result_device_ram_address_MUX_uxn_device_h_l108_c3_ef31_return_output,
 BIN_OP_EQ_uxn_device_h_l112_c11_8544_return_output,
 result_is_vram_write_MUX_uxn_device_h_l112_c7_82e8_return_output,
 result_device_ram_address_MUX_uxn_device_h_l112_c7_82e8_return_output,
 result_is_deo_done_MUX_uxn_device_h_l112_c7_82e8_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l112_c7_82e8_return_output,
 result_vram_address_MUX_uxn_device_h_l112_c7_82e8_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l112_c7_82e8_return_output,
 result_u8_value_MUX_uxn_device_h_l112_c7_82e8_return_output,
 vram_addr_MUX_uxn_device_h_l112_c7_82e8_return_output,
 y_MUX_uxn_device_h_l112_c7_82e8_return_output,
 ram_addr_MUX_uxn_device_h_l112_c7_82e8_return_output,
 x_MUX_uxn_device_h_l112_c7_82e8_return_output,
 auto_advance_MUX_uxn_device_h_l112_c7_82e8_return_output,
 result_device_ram_address_MUX_uxn_device_h_l113_c3_c338_return_output,
 y_MUX_uxn_device_h_l113_c3_c338_return_output,
 BIN_OP_OR_uxn_device_h_l114_c4_7cc1_return_output,
 BIN_OP_EQ_uxn_device_h_l118_c11_03cb_return_output,
 result_is_vram_write_MUX_uxn_device_h_l118_c7_d5ea_return_output,
 result_device_ram_address_MUX_uxn_device_h_l118_c7_d5ea_return_output,
 result_is_deo_done_MUX_uxn_device_h_l118_c7_d5ea_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l118_c7_d5ea_return_output,
 result_vram_address_MUX_uxn_device_h_l118_c7_d5ea_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l118_c7_d5ea_return_output,
 result_u8_value_MUX_uxn_device_h_l118_c7_d5ea_return_output,
 vram_addr_MUX_uxn_device_h_l118_c7_d5ea_return_output,
 ram_addr_MUX_uxn_device_h_l118_c7_d5ea_return_output,
 x_MUX_uxn_device_h_l118_c7_d5ea_return_output,
 auto_advance_MUX_uxn_device_h_l118_c7_d5ea_return_output,
 result_device_ram_address_MUX_uxn_device_h_l119_c3_4341_return_output,
 result_is_deo_done_MUX_uxn_device_h_l119_c3_4341_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l120_c27_178e_return_output,
 BIN_OP_PLUS_uxn_device_h_l120_c27_9ccd_return_output,
 BIN_OP_GT_uxn_device_h_l120_c27_02fe_return_output,
 MUX_uxn_device_h_l120_c27_2a91_return_output,
 BIN_OP_EQ_uxn_device_h_l124_c11_e7bd_return_output,
 result_is_vram_write_MUX_uxn_device_h_l124_c7_3d44_return_output,
 result_device_ram_address_MUX_uxn_device_h_l124_c7_3d44_return_output,
 result_is_deo_done_MUX_uxn_device_h_l124_c7_3d44_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l124_c7_3d44_return_output,
 result_vram_address_MUX_uxn_device_h_l124_c7_3d44_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l124_c7_3d44_return_output,
 result_u8_value_MUX_uxn_device_h_l124_c7_3d44_return_output,
 vram_addr_MUX_uxn_device_h_l124_c7_3d44_return_output,
 ram_addr_MUX_uxn_device_h_l124_c7_3d44_return_output,
 x_MUX_uxn_device_h_l124_c7_3d44_return_output,
 auto_advance_MUX_uxn_device_h_l124_c7_3d44_return_output,
 result_device_ram_address_MUX_uxn_device_h_l125_c3_2150_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l125_c3_2150_return_output,
 result_vram_address_MUX_uxn_device_h_l125_c3_2150_return_output,
 result_is_vram_write_MUX_uxn_device_h_l125_c3_2150_return_output,
 result_u8_value_MUX_uxn_device_h_l125_c3_2150_return_output,
 vram_addr_MUX_uxn_device_h_l125_c3_2150_return_output,
 auto_advance_MUX_uxn_device_h_l125_c3_2150_return_output,
 BIN_OP_AND_uxn_device_h_l128_c32_8870_return_output,
 result_vram_address_MUX_uxn_device_h_l131_c4_1268_return_output,
 result_is_vram_write_MUX_uxn_device_h_l131_c4_1268_return_output,
 vram_addr_MUX_uxn_device_h_l131_c4_1268_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l132_c18_50dd_return_output,
 BIN_OP_PLUS_uxn_device_h_l132_c18_3dfa_return_output,
 BIN_OP_AND_uxn_device_h_l133_c5_ae09_return_output,
 MUX_uxn_device_h_l134_c19_0b0f_return_output,
 BIN_OP_OR_uxn_device_h_l134_c5_1182_return_output,
 MUX_uxn_device_h_l135_c19_5967_return_output,
 BIN_OP_OR_uxn_device_h_l135_c5_4991_return_output,
 BIN_OP_OR_uxn_device_h_l136_c5_81b6_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l140_c28_6579_return_output,
 BIN_OP_PLUS_uxn_device_h_l140_c28_706a_return_output,
 result_device_ram_address_MUX_uxn_device_h_l144_c8_0544_return_output,
 auto_advance_MUX_uxn_device_h_l144_c8_0544_return_output,
 BIN_OP_EQ_uxn_device_h_l149_c11_aaf4_return_output,
 result_is_vram_write_MUX_uxn_device_h_l149_c7_bfbe_return_output,
 result_device_ram_address_MUX_uxn_device_h_l149_c7_bfbe_return_output,
 result_is_deo_done_MUX_uxn_device_h_l149_c7_bfbe_return_output,
 result_vram_address_MUX_uxn_device_h_l149_c7_bfbe_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l149_c7_bfbe_return_output,
 result_u8_value_MUX_uxn_device_h_l149_c7_bfbe_return_output,
 ram_addr_MUX_uxn_device_h_l149_c7_bfbe_return_output,
 x_MUX_uxn_device_h_l149_c7_bfbe_return_output,
 result_is_vram_write_MUX_uxn_device_h_l150_c3_5fc1_return_output,
 result_device_ram_address_MUX_uxn_device_h_l150_c3_5fc1_return_output,
 result_is_deo_done_MUX_uxn_device_h_l150_c3_5fc1_return_output,
 result_vram_address_MUX_uxn_device_h_l150_c3_5fc1_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l150_c3_5fc1_return_output,
 result_u8_value_MUX_uxn_device_h_l150_c3_5fc1_return_output,
 x_MUX_uxn_device_h_l150_c3_5fc1_return_output,
 UNARY_OP_NOT_uxn_device_h_l155_c9_9342_return_output,
 result_is_deo_done_MUX_uxn_device_h_l155_c4_93e4_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l155_c4_93e4_return_output,
 result_device_ram_address_MUX_uxn_device_h_l155_c4_93e4_return_output,
 result_u8_value_MUX_uxn_device_h_l155_c4_93e4_return_output,
 x_MUX_uxn_device_h_l155_c4_93e4_return_output,
 BIN_OP_AND_uxn_device_h_l156_c9_d0d7_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l156_c5_f4d5_return_output,
 result_device_ram_address_MUX_uxn_device_h_l156_c5_f4d5_return_output,
 result_u8_value_MUX_uxn_device_h_l156_c5_f4d5_return_output,
 x_MUX_uxn_device_h_l156_c5_f4d5_return_output,
 BIN_OP_PLUS_uxn_device_h_l157_c6_6fb1_return_output,
 CONST_SR_8_uxn_device_h_l160_c34_45ca_return_output,
 result_device_ram_address_MUX_uxn_device_h_l166_c8_942b_return_output,
 BIN_OP_EQ_uxn_device_h_l170_c11_d097_return_output,
 result_is_deo_done_MUX_uxn_device_h_l170_c7_b03c_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l170_c7_b03c_return_output,
 result_device_ram_address_MUX_uxn_device_h_l170_c7_b03c_return_output,
 result_u8_value_MUX_uxn_device_h_l170_c7_b03c_return_output,
 ram_addr_MUX_uxn_device_h_l170_c7_b03c_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l171_c3_99f3_return_output,
 result_device_ram_address_MUX_uxn_device_h_l171_c3_99f3_return_output,
 result_u8_value_MUX_uxn_device_h_l171_c3_99f3_return_output,
 BIN_OP_AND_uxn_device_h_l172_c8_b586_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l172_c4_ae83_return_output,
 result_device_ram_address_MUX_uxn_device_h_l172_c4_ae83_return_output,
 result_u8_value_MUX_uxn_device_h_l172_c4_ae83_return_output,
 result_device_ram_address_MUX_uxn_device_h_l178_c3_85d0_return_output,
 ram_addr_MUX_uxn_device_h_l178_c3_85d0_return_output,
 BIN_OP_EQ_uxn_device_h_l184_c11_e7fe_return_output,
 result_is_deo_done_MUX_uxn_device_h_l184_c7_c45b_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l184_c7_c45b_return_output,
 result_device_ram_address_MUX_uxn_device_h_l184_c7_c45b_return_output,
 result_u8_value_MUX_uxn_device_h_l184_c7_c45b_return_output,
 ram_addr_MUX_uxn_device_h_l184_c7_c45b_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l185_c3_b7f1_return_output,
 result_device_ram_address_MUX_uxn_device_h_l185_c3_b7f1_return_output,
 result_u8_value_MUX_uxn_device_h_l185_c3_b7f1_return_output,
 BIN_OP_AND_uxn_device_h_l186_c8_bb02_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l186_c4_f747_return_output,
 result_device_ram_address_MUX_uxn_device_h_l186_c4_f747_return_output,
 result_u8_value_MUX_uxn_device_h_l186_c4_f747_return_output,
 CONST_SR_8_uxn_device_h_l189_c33_cd3a_return_output,
 result_device_ram_address_MUX_uxn_device_h_l192_c3_ab93_return_output,
 BIN_OP_EQ_uxn_device_h_l196_c11_0992_return_output,
 result_is_deo_done_MUX_uxn_device_h_l196_c7_1f25_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l196_c7_1f25_return_output,
 result_device_ram_address_MUX_uxn_device_h_l196_c7_1f25_return_output,
 result_u8_value_MUX_uxn_device_h_l196_c7_1f25_return_output,
 ram_addr_MUX_uxn_device_h_l196_c7_1f25_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l197_c3_e13e_return_output,
 result_device_ram_address_MUX_uxn_device_h_l197_c3_e13e_return_output,
 result_u8_value_MUX_uxn_device_h_l197_c3_e13e_return_output,
 BIN_OP_AND_uxn_device_h_l198_c8_a07b_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l198_c4_f395_return_output,
 result_device_ram_address_MUX_uxn_device_h_l198_c4_f395_return_output,
 result_u8_value_MUX_uxn_device_h_l198_c4_f395_return_output,
 result_is_deo_done_MUX_uxn_device_h_l204_c3_197f_return_output,
 ram_addr_MUX_uxn_device_h_l204_c3_197f_return_output,
 BIN_OP_OR_uxn_device_h_l205_c4_c8b7_return_output,
 BIN_OP_EQ_uxn_device_h_l210_c11_f124_return_output,
 result_device_ram_address_MUX_uxn_device_h_l210_c7_72c7_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l210_c7_72c7_return_output,
 result_is_deo_done_MUX_uxn_device_h_l210_c7_72c7_return_output,
 result_device_ram_address_MUX_uxn_device_h_l211_c3_8d0f_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l211_c3_8d0f_return_output,
 result_is_deo_done_MUX_uxn_device_h_l211_c3_8d0f_return_output,
 CONST_SL_8_uint16_t_uxn_device_h_l80_l181_l103_DUPLICATE_f0ca_return_output,
 CONST_SR_1_uint8_t_uxn_device_h_l198_l186_DUPLICATE_bbf7_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_port : unsigned(3 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l42_c6_10f4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l42_c6_10f4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l42_c6_10f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l42_c2_c27c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l42_c2_c27c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l56_c7_f9d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l42_c2_c27c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l42_c2_c27c_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l42_c2_c27c_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l49_c3_de5f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l42_c2_c27c_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l56_c7_f9d9_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l42_c2_c27c_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l42_c2_c27c_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l42_c2_c27c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l49_c3_de5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l42_c2_c27c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l56_c7_f9d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l42_c2_c27c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l42_c2_c27c_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l42_c2_c27c_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l42_c2_c27c_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l56_c7_f9d9_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l42_c2_c27c_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l42_c2_c27c_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l42_c2_c27c_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l42_c2_c27c_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l56_c7_f9d9_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l42_c2_c27c_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l42_c2_c27c_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c2_c27c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c2_c27c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l56_c7_f9d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c2_c27c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c2_c27c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l42_c2_c27c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l42_c2_c27c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l56_c7_f9d9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l42_c2_c27c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l42_c2_c27c_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l42_c2_c27c_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_uxn_device_h_l48_c3_31c1 : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l42_c2_c27c_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l56_c7_f9d9_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l42_c2_c27c_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l42_c2_c27c_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l42_c2_c27c_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l42_c2_c27c_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l56_c7_f9d9_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l42_c2_c27c_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l42_c2_c27c_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l42_c2_c27c_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l42_c2_c27c_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l56_c7_f9d9_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l42_c2_c27c_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l42_c2_c27c_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l42_c2_c27c_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l42_c2_c27c_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l56_c7_f9d9_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l42_c2_c27c_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l42_c2_c27c_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l42_c2_c27c_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l42_c2_c27c_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l56_c7_f9d9_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l42_c2_c27c_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l42_c2_c27c_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l42_c2_c27c_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l42_c2_c27c_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l56_c7_f9d9_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l42_c2_c27c_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l42_c2_c27c_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l42_c2_c27c_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l42_c2_c27c_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l56_c7_f9d9_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l42_c2_c27c_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l42_c2_c27c_cond : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l42_c2_c27c_iftrue : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l42_c2_c27c_iffalse : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l42_c2_c27c_return_output : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l42_c2_c27c_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l42_c2_c27c_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l42_c2_c27c_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l56_c7_f9d9_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l42_c2_c27c_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l42_c2_c27c_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l42_c2_c27c_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l42_c2_c27c_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l56_c7_f9d9_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l42_c2_c27c_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l42_c2_c27c_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l42_c2_c27c_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l42_c2_c27c_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l56_c7_f9d9_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l42_c2_c27c_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l42_c2_c27c_cond : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l42_c2_c27c_iftrue : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l42_c2_c27c_iffalse : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l42_c2_c27c_return_output : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l42_c2_c27c_cond : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l42_c2_c27c_iftrue : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l42_c2_c27c_iffalse : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l42_c2_c27c_return_output : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l42_c2_c27c_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l42_c2_c27c_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l42_c2_c27c_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l56_c7_f9d9_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l42_c2_c27c_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l42_c2_c27c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l43_c19_f016_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l43_c19_f016_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l43_c19_f016_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l43_c19_c5ea_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l43_c19_c5ea_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l43_c19_c5ea_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l43_c19_f016_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l44_c20_9375_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l44_c20_9375_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l44_c20_9375_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l44_c20_fd38_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l44_c20_fd38_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l44_c20_fd38_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l44_c20_9375_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l45_c21_23f8_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l45_c21_23f8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l45_c21_23f8_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l49_c3_de5f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l49_c3_de5f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l49_c3_de5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l49_c3_de5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l49_c3_de5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l49_c3_de5f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l50_c32_ff36_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l50_c32_ff36_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l50_c32_ff36_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l50_c32_ff36_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l56_c11_25a0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l56_c11_25a0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l56_c11_25a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l56_c7_f9d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l56_c7_f9d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l61_c7_5d0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l56_c7_f9d9_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l56_c7_f9d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l57_c3_8f9c_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l56_c7_f9d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l61_c7_5d0a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l56_c7_f9d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l56_c7_f9d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l56_c7_f9d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l61_c7_5d0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l56_c7_f9d9_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l56_c7_f9d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l56_c7_f9d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l61_c7_5d0a_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l56_c7_f9d9_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l56_c7_f9d9_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l56_c7_f9d9_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l61_c7_5d0a_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l56_c7_f9d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l56_c7_f9d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l56_c7_f9d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l61_c7_5d0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l56_c7_f9d9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l56_c7_f9d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l56_c7_f9d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l61_c7_5d0a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l56_c7_f9d9_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l56_c7_f9d9_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l56_c7_f9d9_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l61_c7_5d0a_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l56_c7_f9d9_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l56_c7_f9d9_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l56_c7_f9d9_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l61_c7_5d0a_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l56_c7_f9d9_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l56_c7_f9d9_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l56_c7_f9d9_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l61_c7_5d0a_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l56_c7_f9d9_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l56_c7_f9d9_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l56_c7_f9d9_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l61_c7_5d0a_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l56_c7_f9d9_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l56_c7_f9d9_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l56_c7_f9d9_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l61_c7_5d0a_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l56_c7_f9d9_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l56_c7_f9d9_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l56_c7_f9d9_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l61_c7_5d0a_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l56_c7_f9d9_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l56_c7_f9d9_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l56_c7_f9d9_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l61_c7_5d0a_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l56_c7_f9d9_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l56_c7_f9d9_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l56_c7_f9d9_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l61_c7_5d0a_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l56_c7_f9d9_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l56_c7_f9d9_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l56_c7_f9d9_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l61_c7_5d0a_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l56_c7_f9d9_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l56_c7_f9d9_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l56_c7_f9d9_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l61_c7_5d0a_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l56_c7_f9d9_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l56_c7_f9d9_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l56_c7_f9d9_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l61_c7_5d0a_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l56_c7_f9d9_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l57_c3_8f9c_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l57_c3_8f9c_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l57_c3_8f9c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l58_c32_3abd_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l58_c32_3abd_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l58_c32_3abd_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l58_c32_3abd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l61_c11_5e8f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l61_c11_5e8f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l61_c11_5e8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l61_c7_5d0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l61_c7_5d0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_470e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l61_c7_5d0a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l61_c7_5d0a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l62_c3_6024_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l61_c7_5d0a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_470e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l61_c7_5d0a_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l61_c7_5d0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l61_c7_5d0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_470e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l61_c7_5d0a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l61_c7_5d0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l61_c7_5d0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l72_c7_470e_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l61_c7_5d0a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l61_c7_5d0a_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l61_c7_5d0a_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l72_c7_470e_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l61_c7_5d0a_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l61_c7_5d0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l61_c7_5d0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l72_c7_470e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l61_c7_5d0a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l61_c7_5d0a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l61_c7_5d0a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l72_c7_470e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l61_c7_5d0a_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l61_c7_5d0a_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l61_c7_5d0a_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l72_c7_470e_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l61_c7_5d0a_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l61_c7_5d0a_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l62_c3_6024_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l61_c7_5d0a_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l61_c7_5d0a_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l61_c7_5d0a_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l62_c3_6024_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l61_c7_5d0a_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l61_c7_5d0a_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l61_c7_5d0a_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l62_c3_6024_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l61_c7_5d0a_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l61_c7_5d0a_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l61_c7_5d0a_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l61_c7_5d0a_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l72_c7_470e_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l61_c7_5d0a_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l61_c7_5d0a_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l62_c3_6024_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l61_c7_5d0a_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l61_c7_5d0a_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l61_c7_5d0a_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l61_c7_5d0a_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l72_c7_470e_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l61_c7_5d0a_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l61_c7_5d0a_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l61_c7_5d0a_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l72_c7_470e_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l61_c7_5d0a_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l61_c7_5d0a_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l61_c7_5d0a_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l72_c7_470e_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l61_c7_5d0a_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l61_c7_5d0a_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l62_c3_6024_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l61_c7_5d0a_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l61_c7_5d0a_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l61_c7_5d0a_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l62_c3_6024_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l61_c7_5d0a_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l61_c7_5d0a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l62_c3_6024_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l69_c4_4cb9 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l62_c3_6024_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l62_c3_6024_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l62_c3_6024_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l62_c3_6024_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l62_c3_6024_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l62_c3_6024_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l62_c3_6024_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l62_c3_6024_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l62_c3_6024_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l62_c3_6024_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l62_c3_6024_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l62_c3_6024_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l62_c3_6024_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l62_c3_6024_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l62_c3_6024_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l62_c3_6024_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l62_c3_6024_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l62_c3_6024_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l62_c3_6024_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l62_c3_6024_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l64_c12_1cdb_return_output : unsigned(3 downto 0);
 variable VAR_CONST_SR_7_uxn_device_h_l65_c26_808b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_7_uxn_device_h_l65_c26_808b_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l65_c16_d05a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_6_uxn_device_h_l66_c22_77cc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_6_uxn_device_h_l66_c22_77cc_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l66_c12_8cca_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_5_uxn_device_h_l67_c23_34f6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_5_uxn_device_h_l67_c23_34f6_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l67_c13_a28f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l68_c23_0abd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l68_c23_0abd_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l68_c13_5372_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l72_c11_b403_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l72_c11_b403_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l72_c11_b403_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_470e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_470e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l77_c7_76e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_470e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_470e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_d1e7_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_470e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l77_c7_76e7_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_470e_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_470e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_470e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l77_c7_76e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_470e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l72_c7_470e_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l72_c7_470e_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l77_c7_76e7_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l72_c7_470e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l72_c7_470e_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l72_c7_470e_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l77_c7_76e7_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l72_c7_470e_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l72_c7_470e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l72_c7_470e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l77_c7_76e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l72_c7_470e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l72_c7_470e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l72_c7_470e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l77_c7_76e7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l72_c7_470e_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l72_c7_470e_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l72_c7_470e_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l77_c7_76e7_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l72_c7_470e_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l72_c7_470e_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l72_c7_470e_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l77_c7_76e7_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l72_c7_470e_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l72_c7_470e_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l72_c7_470e_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l77_c7_76e7_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l72_c7_470e_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l72_c7_470e_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l72_c7_470e_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l77_c7_76e7_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l72_c7_470e_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l72_c7_470e_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l72_c7_470e_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l77_c7_76e7_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l72_c7_470e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_d1e7_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l74_c4_7e46 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_d1e7_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_d1e7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l77_c11_545d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l77_c11_545d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l77_c11_545d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l77_c7_76e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l77_c7_76e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l84_c7_0b55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l77_c7_76e7_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l77_c7_76e7_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l78_c3_a3e7_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l77_c7_76e7_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l84_c7_0b55_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l77_c7_76e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l77_c7_76e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l77_c7_76e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l84_c7_0b55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l77_c7_76e7_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l77_c7_76e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l77_c7_76e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l84_c7_0b55_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l77_c7_76e7_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l77_c7_76e7_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l77_c7_76e7_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l84_c7_0b55_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l77_c7_76e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l77_c7_76e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l77_c7_76e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l84_c7_0b55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l77_c7_76e7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l77_c7_76e7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l77_c7_76e7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l84_c7_0b55_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l77_c7_76e7_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l77_c7_76e7_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l77_c7_76e7_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l84_c7_0b55_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l77_c7_76e7_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l77_c7_76e7_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l77_c7_76e7_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l84_c7_0b55_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l77_c7_76e7_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l77_c7_76e7_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l77_c7_76e7_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l84_c7_0b55_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l77_c7_76e7_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l77_c7_76e7_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l78_c3_a3e7_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l77_c7_76e7_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l84_c7_0b55_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l77_c7_76e7_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l77_c7_76e7_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l77_c7_76e7_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l84_c7_0b55_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l77_c7_76e7_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l78_c3_a3e7_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l81_c4_0d50 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l78_c3_a3e7_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l78_c3_a3e7_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l78_c3_a3e7_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l78_c3_a3e7_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l78_c3_a3e7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l84_c11_61bb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l84_c11_61bb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l84_c11_61bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l84_c7_0b55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l84_c7_0b55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_6231_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l84_c7_0b55_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l84_c7_0b55_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l85_c3_de64_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l84_c7_0b55_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_6231_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l84_c7_0b55_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l84_c7_0b55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l84_c7_0b55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_6231_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l84_c7_0b55_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l84_c7_0b55_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l84_c7_0b55_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l89_c7_6231_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l84_c7_0b55_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l84_c7_0b55_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l84_c7_0b55_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l89_c7_6231_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l84_c7_0b55_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l84_c7_0b55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l84_c7_0b55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l89_c7_6231_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l84_c7_0b55_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l84_c7_0b55_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l84_c7_0b55_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l89_c7_6231_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l84_c7_0b55_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l84_c7_0b55_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l84_c7_0b55_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l89_c7_6231_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l84_c7_0b55_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l84_c7_0b55_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l84_c7_0b55_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l89_c7_6231_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l84_c7_0b55_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l84_c7_0b55_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l84_c7_0b55_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l89_c7_6231_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l84_c7_0b55_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l84_c7_0b55_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l84_c7_0b55_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l89_c7_6231_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l84_c7_0b55_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l84_c7_0b55_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l84_c7_0b55_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l89_c7_6231_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l84_c7_0b55_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l85_c3_de64_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l86_c4_f1fc : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l85_c3_de64_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l85_c3_de64_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c11_bbd0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c11_bbd0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c11_bbd0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_6231_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_6231_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l95_c7_f81e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_6231_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_6231_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_5121_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_6231_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l95_c7_f81e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_6231_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_6231_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_6231_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l95_c7_f81e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_6231_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l89_c7_6231_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l89_c7_6231_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l95_c7_f81e_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l89_c7_6231_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l89_c7_6231_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l89_c7_6231_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l95_c7_f81e_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l89_c7_6231_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l89_c7_6231_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l89_c7_6231_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l95_c7_f81e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l89_c7_6231_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l89_c7_6231_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l89_c7_6231_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l95_c7_f81e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l89_c7_6231_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l89_c7_6231_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l89_c7_6231_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l95_c7_f81e_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l89_c7_6231_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l89_c7_6231_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l89_c7_6231_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l95_c7_f81e_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l89_c7_6231_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l89_c7_6231_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l89_c7_6231_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l95_c7_f81e_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l89_c7_6231_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l89_c7_6231_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c3_5121_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l89_c7_6231_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l95_c7_f81e_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l89_c7_6231_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l89_c7_6231_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l89_c7_6231_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l95_c7_f81e_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l89_c7_6231_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_5121_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l92_c4_f108 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_5121_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_5121_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c3_5121_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c3_5121_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c3_5121_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l91_c4_d5a5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l91_c4_d5a5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l91_c4_d5a5_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l95_c11_9959_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l95_c11_9959_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l95_c11_9959_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l95_c7_f81e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l95_c7_f81e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l100_c7_ba7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l95_c7_f81e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l95_c7_f81e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l96_c3_6c51_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l95_c7_f81e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c7_ba7b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l95_c7_f81e_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l95_c7_f81e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l95_c7_f81e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c7_ba7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l95_c7_f81e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l95_c7_f81e_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l95_c7_f81e_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l100_c7_ba7b_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l95_c7_f81e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l95_c7_f81e_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l95_c7_f81e_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l100_c7_ba7b_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l95_c7_f81e_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l95_c7_f81e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l95_c7_f81e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l100_c7_ba7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l95_c7_f81e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l95_c7_f81e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l95_c7_f81e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l100_c7_ba7b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l95_c7_f81e_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l95_c7_f81e_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l95_c7_f81e_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l100_c7_ba7b_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l95_c7_f81e_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l95_c7_f81e_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l95_c7_f81e_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l100_c7_ba7b_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l95_c7_f81e_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l95_c7_f81e_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l95_c7_f81e_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l100_c7_ba7b_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l95_c7_f81e_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l95_c7_f81e_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l95_c7_f81e_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l100_c7_ba7b_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l95_c7_f81e_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l95_c7_f81e_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l95_c7_f81e_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l100_c7_ba7b_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l95_c7_f81e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l96_c3_6c51_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l97_c4_d802 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l96_c3_6c51_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l96_c3_6c51_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l100_c11_e32a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l100_c11_e32a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l100_c11_e32a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l100_c7_ba7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l100_c7_ba7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_5fb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l100_c7_ba7b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c7_ba7b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l101_c3_18ac_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c7_ba7b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_5fb4_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c7_ba7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c7_ba7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c7_ba7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_5fb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c7_ba7b_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l100_c7_ba7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l100_c7_ba7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l107_c7_5fb4_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l100_c7_ba7b_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l100_c7_ba7b_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l100_c7_ba7b_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l107_c7_5fb4_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l100_c7_ba7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l100_c7_ba7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l100_c7_ba7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l107_c7_5fb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l100_c7_ba7b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l100_c7_ba7b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l100_c7_ba7b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l107_c7_5fb4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l100_c7_ba7b_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l100_c7_ba7b_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l100_c7_ba7b_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l107_c7_5fb4_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l100_c7_ba7b_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l100_c7_ba7b_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l101_c3_18ac_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l100_c7_ba7b_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l107_c7_5fb4_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l100_c7_ba7b_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l100_c7_ba7b_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l100_c7_ba7b_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l107_c7_5fb4_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l100_c7_ba7b_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l100_c7_ba7b_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l100_c7_ba7b_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c7_5fb4_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l100_c7_ba7b_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l100_c7_ba7b_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l100_c7_ba7b_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l107_c7_5fb4_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l100_c7_ba7b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l101_c3_18ac_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l104_c4_9243 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l101_c3_18ac_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l101_c3_18ac_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l101_c3_18ac_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l101_c3_18ac_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l101_c3_18ac_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l107_c11_dfe7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l107_c11_dfe7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l107_c11_dfe7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_5fb4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_5fb4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l112_c7_82e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_5fb4_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_5fb4_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_ef31_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_5fb4_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l112_c7_82e8_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_5fb4_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_5fb4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_5fb4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l112_c7_82e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_5fb4_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l107_c7_5fb4_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l107_c7_5fb4_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l112_c7_82e8_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l107_c7_5fb4_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l107_c7_5fb4_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l107_c7_5fb4_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l112_c7_82e8_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l107_c7_5fb4_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l107_c7_5fb4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l107_c7_5fb4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l112_c7_82e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l107_c7_5fb4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l107_c7_5fb4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l107_c7_5fb4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l112_c7_82e8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l107_c7_5fb4_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l107_c7_5fb4_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l107_c7_5fb4_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l112_c7_82e8_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l107_c7_5fb4_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l107_c7_5fb4_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l107_c7_5fb4_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l112_c7_82e8_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l107_c7_5fb4_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l107_c7_5fb4_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l107_c7_5fb4_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l112_c7_82e8_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l107_c7_5fb4_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c7_5fb4_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c7_5fb4_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l112_c7_82e8_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c7_5fb4_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l107_c7_5fb4_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l107_c7_5fb4_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l112_c7_82e8_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l107_c7_5fb4_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_ef31_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l109_c4_6659 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_ef31_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_ef31_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l112_c11_8544_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l112_c11_8544_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l112_c11_8544_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l112_c7_82e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l112_c7_82e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l118_c7_d5ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l112_c7_82e8_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l112_c7_82e8_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l113_c3_c338_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l112_c7_82e8_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l118_c7_d5ea_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l112_c7_82e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l112_c7_82e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l112_c7_82e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l118_c7_d5ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l112_c7_82e8_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l112_c7_82e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l112_c7_82e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l118_c7_d5ea_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l112_c7_82e8_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l112_c7_82e8_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l112_c7_82e8_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l118_c7_d5ea_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l112_c7_82e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l112_c7_82e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l112_c7_82e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l118_c7_d5ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l112_c7_82e8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l112_c7_82e8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l112_c7_82e8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l118_c7_d5ea_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l112_c7_82e8_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l112_c7_82e8_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l112_c7_82e8_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l118_c7_d5ea_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l112_c7_82e8_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l112_c7_82e8_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l113_c3_c338_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l112_c7_82e8_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l112_c7_82e8_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l112_c7_82e8_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l112_c7_82e8_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l118_c7_d5ea_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l112_c7_82e8_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l112_c7_82e8_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l112_c7_82e8_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l118_c7_d5ea_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l112_c7_82e8_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l112_c7_82e8_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l112_c7_82e8_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l118_c7_d5ea_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l112_c7_82e8_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l113_c3_c338_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l115_c4_787d : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l113_c3_c338_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l113_c3_c338_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l113_c3_c338_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l113_c3_c338_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l113_c3_c338_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l114_c4_7cc1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l114_c4_7cc1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l114_c4_7cc1_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l118_c11_03cb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l118_c11_03cb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l118_c11_03cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l118_c7_d5ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l118_c7_d5ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_3d44_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l118_c7_d5ea_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l118_c7_d5ea_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_4341_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l118_c7_d5ea_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_3d44_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l118_c7_d5ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l118_c7_d5ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_4341_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l118_c7_d5ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_3d44_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l118_c7_d5ea_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l118_c7_d5ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l118_c7_d5ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l124_c7_3d44_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l118_c7_d5ea_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l118_c7_d5ea_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l118_c7_d5ea_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l124_c7_3d44_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l118_c7_d5ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l118_c7_d5ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l118_c7_d5ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l124_c7_3d44_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l118_c7_d5ea_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l118_c7_d5ea_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l118_c7_d5ea_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l124_c7_3d44_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l118_c7_d5ea_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l118_c7_d5ea_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l118_c7_d5ea_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l124_c7_3d44_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l118_c7_d5ea_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l118_c7_d5ea_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l118_c7_d5ea_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l124_c7_3d44_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l118_c7_d5ea_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l118_c7_d5ea_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l118_c7_d5ea_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l124_c7_3d44_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l118_c7_d5ea_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l118_c7_d5ea_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l118_c7_d5ea_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l124_c7_3d44_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l118_c7_d5ea_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_4341_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l121_c4_53ed : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_4341_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_4341_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_4341_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_4341_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_4341_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l120_c27_2a91_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l120_c27_2a91_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l120_c27_2a91_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l120_c27_178e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l120_c27_178e_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l120_c27_178e_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l120_c27_9ccd_left : unsigned(24 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l120_c27_9ccd_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l120_c27_9ccd_return_output : unsigned(25 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l120_c27_02fe_left : unsigned(25 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l120_c27_02fe_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l120_c27_02fe_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l120_c27_2a91_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l124_c11_e7bd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l124_c11_e7bd_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l124_c11_e7bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_3d44_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l125_c3_2150_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_3d44_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l149_c7_bfbe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_3d44_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_3d44_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_2150_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_3d44_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l149_c7_bfbe_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_3d44_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_3d44_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_3d44_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l149_c7_bfbe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_3d44_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l124_c7_3d44_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l125_c3_2150_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l124_c7_3d44_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l124_c7_3d44_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l124_c7_3d44_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l125_c3_2150_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l124_c7_3d44_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l149_c7_bfbe_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l124_c7_3d44_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l124_c7_3d44_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l124_c7_3d44_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c7_bfbe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l124_c7_3d44_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l124_c7_3d44_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l125_c3_2150_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l124_c7_3d44_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l149_c7_bfbe_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l124_c7_3d44_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l124_c7_3d44_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l125_c3_2150_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l124_c7_3d44_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l124_c7_3d44_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l124_c7_3d44_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l124_c7_3d44_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l149_c7_bfbe_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l124_c7_3d44_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l124_c7_3d44_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l124_c7_3d44_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l149_c7_bfbe_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l124_c7_3d44_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l124_c7_3d44_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l125_c3_2150_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l124_c7_3d44_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l124_c7_3d44_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_2150_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l127_c4_38d5 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_2150_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l144_c8_0544_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_2150_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l125_c3_2150_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l125_c3_2150_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l125_c3_2150_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l125_c3_2150_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l131_c4_1268_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l125_c3_2150_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l125_c3_2150_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l125_c3_2150_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l131_c4_1268_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l125_c3_2150_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l125_c3_2150_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l125_c3_2150_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l125_c3_2150_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l125_c3_2150_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l125_c3_2150_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l131_c4_1268_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l125_c3_2150_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l125_c3_2150_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l125_c3_2150_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l125_c3_2150_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l144_c8_0544_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l125_c3_2150_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l128_c32_8870_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l128_c32_8870_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l128_c32_8870_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l128_c22_4aa5_return_output : unsigned(7 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l131_c4_1268_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l131_c4_1268_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_uxn_device_h_l140_c5_7297 : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l131_c4_1268_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l131_c4_1268_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l131_c4_1268_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l131_c4_1268_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l131_c4_1268_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l131_c4_1268_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l131_c4_1268_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_uxn_device_h_l132_c5_a4cf : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l132_c18_50dd_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l132_c18_50dd_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l132_c18_50dd_return_output : unsigned(63 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l132_c18_3dfa_left : unsigned(63 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l132_c18_3dfa_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l132_c18_3dfa_return_output : unsigned(64 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l133_c5_ae09_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l133_c5_ae09_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l133_c5_ae09_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l134_c5_1182_left : unsigned(31 downto 0);
 variable VAR_MUX_uxn_device_h_l134_c19_0b0f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l134_c19_0b0f_iftrue : unsigned(20 downto 0);
 variable VAR_MUX_uxn_device_h_l134_c19_0b0f_iffalse : unsigned(20 downto 0);
 variable VAR_MUX_uxn_device_h_l134_c19_0b0f_return_output : unsigned(20 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l134_c5_1182_right : unsigned(20 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l134_c5_1182_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l135_c5_4991_left : unsigned(31 downto 0);
 variable VAR_MUX_uxn_device_h_l135_c19_5967_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l135_c19_5967_iftrue : unsigned(21 downto 0);
 variable VAR_MUX_uxn_device_h_l135_c19_5967_iffalse : unsigned(21 downto 0);
 variable VAR_MUX_uxn_device_h_l135_c19_5967_return_output : unsigned(21 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l135_c5_4991_right : unsigned(21 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l135_c5_4991_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l136_c5_81b6_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l136_c5_81b6_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l136_c5_81b6_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l140_c28_6579_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l140_c28_6579_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l140_c28_6579_return_output : unsigned(63 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l140_c28_706a_left : unsigned(63 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l140_c28_706a_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l140_c28_706a_return_output : unsigned(64 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l144_c8_0544_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l146_c4_6228 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l144_c8_0544_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l144_c8_0544_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l144_c8_0544_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l144_c8_0544_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l144_c8_0544_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l149_c11_aaf4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l149_c11_aaf4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l149_c11_aaf4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l149_c7_bfbe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l150_c3_5fc1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l149_c7_bfbe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l149_c7_bfbe_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l149_c7_bfbe_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l150_c3_5fc1_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l149_c7_bfbe_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l170_c7_b03c_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l149_c7_bfbe_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l149_c7_bfbe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l150_c3_5fc1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l149_c7_bfbe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l170_c7_b03c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l149_c7_bfbe_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l149_c7_bfbe_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l150_c3_5fc1_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l149_c7_bfbe_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l149_c7_bfbe_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c7_bfbe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l150_c3_5fc1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c7_bfbe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l170_c7_b03c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c7_bfbe_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l149_c7_bfbe_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l150_c3_5fc1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l149_c7_bfbe_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l170_c7_b03c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l149_c7_bfbe_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l149_c7_bfbe_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l149_c7_bfbe_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l170_c7_b03c_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l149_c7_bfbe_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l149_c7_bfbe_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l150_c3_5fc1_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l149_c7_bfbe_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l149_c7_bfbe_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l150_c3_5fc1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l150_c3_5fc1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l150_c3_5fc1_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l150_c3_5fc1_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l155_c4_93e4_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l150_c3_5fc1_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l166_c8_942b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l150_c3_5fc1_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l150_c3_5fc1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l155_c4_93e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l150_c3_5fc1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l150_c3_5fc1_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l150_c3_5fc1_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_uxn_device_h_l153_c4_f17b : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l150_c3_5fc1_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l150_c3_5fc1_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l150_c3_5fc1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l155_c4_93e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l150_c3_5fc1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l150_c3_5fc1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l150_c3_5fc1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l155_c4_93e4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l150_c3_5fc1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l150_c3_5fc1_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l150_c3_5fc1_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l155_c4_93e4_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l150_c3_5fc1_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l150_c3_5fc1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_uxn_device_h_l154_c4_047e : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l155_c9_9342_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l155_c9_9342_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l155_c4_93e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l155_c4_93e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l155_c4_93e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l155_c4_93e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l156_c5_f4d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l155_c4_93e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l155_c4_93e4_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l155_c4_93e4_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l156_c5_f4d5_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l155_c4_93e4_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l155_c4_93e4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l155_c4_93e4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l156_c5_f4d5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l155_c4_93e4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l155_c4_93e4_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l155_c4_93e4_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l156_c5_f4d5_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l155_c4_93e4_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l155_c4_93e4_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l156_c5_f4d5_interm_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l156_c9_d0d7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l156_c9_d0d7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l156_c9_d0d7_return_output : unsigned(7 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l156_c5_f4d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l156_c5_f4d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l156_c5_f4d5_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l156_c5_f4d5_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l159_c6_0604 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l156_c5_f4d5_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l156_c5_f4d5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l156_c5_f4d5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l156_c5_f4d5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l156_c5_f4d5_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l156_c5_f4d5_iftrue : unsigned(15 downto 0);
 variable VAR_x_uxn_device_h_l157_c6_112d : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l156_c5_f4d5_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l156_c5_f4d5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l157_c6_6fb1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l157_c6_6fb1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l157_c6_6fb1_return_output : unsigned(16 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l160_c34_45ca_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l160_c34_45ca_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l160_c24_4d1c_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l166_c8_942b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l167_c4_410c : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l166_c8_942b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l166_c8_942b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l170_c11_d097_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l170_c11_d097_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l170_c11_d097_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l170_c7_b03c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l170_c7_b03c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l184_c7_c45b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l170_c7_b03c_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l170_c7_b03c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l171_c3_99f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l170_c7_b03c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l184_c7_c45b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l170_c7_b03c_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l170_c7_b03c_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l178_c3_85d0_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l170_c7_b03c_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l184_c7_c45b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l170_c7_b03c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l170_c7_b03c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l171_c3_99f3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l170_c7_b03c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l184_c7_c45b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l170_c7_b03c_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l170_c7_b03c_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l178_c3_85d0_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l170_c7_b03c_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l184_c7_c45b_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l170_c7_b03c_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l171_c3_99f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l172_c4_ae83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l171_c3_99f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l171_c3_99f3_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l171_c3_99f3_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l172_c4_ae83_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l171_c3_99f3_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l171_c3_99f3_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l171_c3_99f3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l171_c3_99f3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l172_c4_ae83_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l171_c3_99f3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l171_c3_99f3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l172_c4_ae83_interm_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l172_c8_b586_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l172_c8_b586_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l172_c8_b586_return_output : unsigned(7 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l172_c4_ae83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l172_c4_ae83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l172_c4_ae83_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l172_c4_ae83_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l174_c5_0871 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l172_c4_ae83_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l172_c4_ae83_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l172_c4_ae83_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l172_c4_ae83_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l172_c4_ae83_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l175_c23_b16e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l178_c3_85d0_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l179_c4_17b5 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l178_c3_85d0_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l178_c3_85d0_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l178_c3_85d0_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l178_c3_85d0_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l178_c3_85d0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l184_c11_e7fe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l184_c11_e7fe_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l184_c11_e7fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l184_c7_c45b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l184_c7_c45b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l196_c7_1f25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l184_c7_c45b_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l184_c7_c45b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l185_c3_b7f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l184_c7_c45b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c7_1f25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l184_c7_c45b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l184_c7_c45b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l192_c3_ab93_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l184_c7_c45b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l196_c7_1f25_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l184_c7_c45b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l184_c7_c45b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l185_c3_b7f1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l184_c7_c45b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l196_c7_1f25_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l184_c7_c45b_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l184_c7_c45b_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l184_c7_c45b_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l196_c7_1f25_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l184_c7_c45b_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l185_c3_b7f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l186_c4_f747_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l185_c3_b7f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l185_c3_b7f1_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l185_c3_b7f1_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l186_c4_f747_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l185_c3_b7f1_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l185_c3_b7f1_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l185_c3_b7f1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l185_c3_b7f1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l186_c4_f747_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l185_c3_b7f1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l185_c3_b7f1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l186_c4_f747_interm_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l186_c8_bb02_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l186_c8_bb02_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l186_c8_bb02_return_output : unsigned(7 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l186_c4_f747_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l186_c4_f747_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l186_c4_f747_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l186_c4_f747_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l188_c5_1b6c : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l186_c4_f747_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l186_c4_f747_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l186_c4_f747_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l186_c4_f747_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l186_c4_f747_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l189_c33_cd3a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l189_c33_cd3a_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l189_c23_da63_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l192_c3_ab93_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l193_c4_8e9b : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l192_c3_ab93_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l192_c3_ab93_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l196_c11_0992_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l196_c11_0992_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l196_c11_0992_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l196_c7_1f25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l204_c3_197f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l196_c7_1f25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l210_c7_72c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l196_c7_1f25_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c7_1f25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c3_e13e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c7_1f25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c7_72c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c7_1f25_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l196_c7_1f25_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l197_c3_e13e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l196_c7_1f25_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l210_c7_72c7_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l196_c7_1f25_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l196_c7_1f25_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l197_c3_e13e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l196_c7_1f25_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l196_c7_1f25_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l196_c7_1f25_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l204_c3_197f_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l196_c7_1f25_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l196_c7_1f25_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c3_e13e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l198_c4_f395_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c3_e13e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c3_e13e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l197_c3_e13e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l198_c4_f395_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l197_c3_e13e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l197_c3_e13e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l197_c3_e13e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l198_c4_f395_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l197_c3_e13e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l197_c3_e13e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l198_c4_f395_interm_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l198_c8_a07b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l198_c8_a07b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l198_c8_a07b_return_output : unsigned(7 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l198_c4_f395_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l198_c4_f395_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l198_c4_f395_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l198_c4_f395_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l200_c5_dbec : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l198_c4_f395_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l198_c4_f395_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l198_c4_f395_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l198_c4_f395_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l198_c4_f395_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l201_c23_a757_return_output : unsigned(7 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l204_c3_197f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l204_c3_197f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l204_c3_197f_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l204_c3_197f_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l204_c3_197f_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l204_c3_197f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l205_c4_c8b7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l205_c4_c8b7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l205_c4_c8b7_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l210_c11_f124_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l210_c11_f124_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l210_c11_f124_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l210_c7_72c7_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l211_c3_8d0f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l210_c7_72c7_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l210_c7_72c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c7_72c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l211_c3_8d0f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c7_72c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c7_72c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l210_c7_72c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l211_c3_8d0f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l210_c7_72c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l210_c7_72c7_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l211_c3_8d0f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l213_c4_6e52 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l211_c3_8d0f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l211_c3_8d0f_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l211_c3_8d0f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l211_c3_8d0f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l211_c3_8d0f_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l211_c3_8d0f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l211_c3_8d0f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l211_c3_8d0f_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l166_l211_l198_l108_l57_l210_l62_l90_l73_l171_l113_l172_l96_l185_l186_l78_l156_l119_l155_l49_l101_l144_l197_l85_DUPLICATE_f2ba_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l61_l100_l56_l95_l42_l89_l124_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_9168_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l61_l100_l56_l95_l149_l42_l150_l89_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_4175_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l198_l150_l196_l171_l118_l112_l172_l107_l100_l95_l185_l89_l84_l77_l186_l72_l61_l56_l42_l197_l125_DUPLICATE_8478_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l61_l100_l56_l95_l149_l150_l89_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_b4f8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l61_l100_l170_l56_l211_l95_l150_l89_l124_l84_l119_l155_l204_l77_l112_l72_l107_l184_DUPLICATE_75d5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l197_l211_l150_l198_l210_l124_l118_l171_l112_l107_l100_l172_l95_l89_l84_l185_l77_l72_l61_l156_l186_l56_l155_DUPLICATE_861b_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l91_l180_l205_l79_l102_l114_DUPLICATE_f0fd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l80_l181_l103_DUPLICATE_f0ca_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l80_l181_l103_DUPLICATE_f0ca_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l132_l140_DUPLICATE_e0d8_return_output : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l140_l132_DUPLICATE_d44f_return_output : unsigned(31 downto 0);
 variable VAR_CONST_SR_1_uint8_t_uxn_device_h_l198_l186_DUPLICATE_bbf7_x : unsigned(7 downto 0);
 variable VAR_CONST_SR_1_uint8_t_uxn_device_h_l198_l186_DUPLICATE_bbf7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_ef4b_uxn_device_h_l34_l221_DUPLICATE_4463_return_output : device_out_result_t;
 -- State registers comb logic variables
variable REG_VAR_vram_addr : unsigned(31 downto 0);
variable REG_VAR_x : unsigned(15 downto 0);
variable REG_VAR_y : unsigned(15 downto 0);
variable REG_VAR_ram_addr : unsigned(15 downto 0);
variable REG_VAR_ctrl : unsigned(7 downto 0);
variable REG_VAR_auto_advance : unsigned(7 downto 0);
variable REG_VAR_color : unsigned(3 downto 0);
variable REG_VAR_is_pixel_port : unsigned(0 downto 0);
variable REG_VAR_is_sprite_port : unsigned(0 downto 0);
variable REG_VAR_is_drawing_port : unsigned(0 downto 0);
variable REG_VAR_ctrl_mode : unsigned(0 downto 0);
variable REG_VAR_flip_x : unsigned(0 downto 0);
variable REG_VAR_flip_y : unsigned(0 downto 0);
variable REG_VAR_layer : unsigned(0 downto 0);
variable REG_VAR_result : device_out_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_vram_addr := vram_addr;
  REG_VAR_x := x;
  REG_VAR_y := y;
  REG_VAR_ram_addr := ram_addr;
  REG_VAR_ctrl := ctrl;
  REG_VAR_auto_advance := auto_advance;
  REG_VAR_color := color;
  REG_VAR_is_pixel_port := is_pixel_port;
  REG_VAR_is_sprite_port := is_sprite_port;
  REG_VAR_is_drawing_port := is_drawing_port;
  REG_VAR_ctrl_mode := ctrl_mode;
  REG_VAR_flip_x := flip_x;
  REG_VAR_flip_y := flip_y;
  REG_VAR_layer := layer;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_MUX_uxn_device_h_l135_c19_5967_iffalse := resize(to_unsigned(0, 1), 22);
     VAR_BIN_OP_AND_uxn_device_h_l133_c5_ae09_right := to_unsigned(262143, 18);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l172_c4_ae83_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l213_c4_6e52 := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l211_c3_8d0f_iftrue := VAR_result_device_ram_address_uxn_device_h_l213_c4_6e52;
     VAR_BIN_OP_EQ_uxn_device_h_l44_c20_fd38_right := to_unsigned(15, 4);
     VAR_result_device_ram_address_uxn_device_h_l92_c4_f108 := resize(to_unsigned(42, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_5121_iftrue := VAR_result_device_ram_address_uxn_device_h_l92_c4_f108;
     VAR_BIN_OP_AND_uxn_device_h_l156_c9_d0d7_right := to_unsigned(1, 1);
     VAR_BIN_OP_OR_uxn_device_h_l136_c5_81b6_right := unsigned'(X"f0000000");
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l132_c18_50dd_right := to_unsigned(400, 32);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l186_c4_f747_iftrue := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l210_c7_72c7_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l97_c4_d802 := resize(to_unsigned(42, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l96_c3_6c51_iftrue := VAR_result_device_ram_address_uxn_device_h_l97_c4_d802;
     VAR_BIN_OP_EQ_uxn_device_h_l118_c11_03cb_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l149_c11_aaf4_right := to_unsigned(13, 4);
     VAR_result_device_ram_address_uxn_device_h_l104_c4_9243 := resize(to_unsigned(43, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l101_c3_18ac_iftrue := VAR_result_device_ram_address_uxn_device_h_l104_c4_9243;
     VAR_result_device_ram_address_uxn_device_h_l74_c4_7e46 := resize(to_unsigned(40, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_d1e7_iftrue := VAR_result_device_ram_address_uxn_device_h_l74_c4_7e46;
     VAR_result_device_ram_address_uxn_device_h_l127_c4_38d5 := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_2150_iftrue := VAR_result_device_ram_address_uxn_device_h_l127_c4_38d5;
     VAR_BIN_OP_AND_uxn_device_h_l186_c8_bb02_right := to_unsigned(1, 1);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l140_c28_6579_right := to_unsigned(400, 32);
     VAR_result_device_ram_address_uxn_device_h_l188_c5_1b6c := resize(to_unsigned(42, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l186_c4_f747_iftrue := VAR_result_device_ram_address_uxn_device_h_l188_c5_1b6c;
     VAR_result_is_deo_done_MUX_uxn_device_h_l49_c3_de5f_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l155_c4_93e4_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l69_c4_4cb9 := resize(to_unsigned(40, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l62_c3_6024_iftrue := VAR_result_device_ram_address_uxn_device_h_l69_c4_4cb9;
     VAR_BIN_OP_GT_uxn_device_h_l120_c27_02fe_right := to_unsigned(143999, 18);
     VAR_BIN_OP_AND_uxn_device_h_l172_c8_b586_right := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l50_c32_ff36_iffalse := resize(to_unsigned(47, 6), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l170_c11_d097_right := to_unsigned(14, 4);
     VAR_result_device_ram_address_uxn_device_h_l146_c4_6228 := resize(to_unsigned(44, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l144_c8_0544_iftrue := VAR_result_device_ram_address_uxn_device_h_l146_c4_6228;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l198_c4_f395_iftrue := to_unsigned(1, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l156_c5_f4d5_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l50_c32_ff36_iftrue := resize(to_unsigned(46, 6), 8);
     VAR_result_device_ram_address_uxn_device_h_l200_c5_dbec := resize(to_unsigned(43, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l198_c4_f395_iftrue := VAR_result_device_ram_address_uxn_device_h_l200_c5_dbec;
     VAR_MUX_uxn_device_h_l44_c20_9375_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l58_c32_3abd_iffalse := resize(to_unsigned(47, 6), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l89_c11_bbd0_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_device_h_l61_c11_5e8f_right := to_unsigned(2, 2);
     VAR_result_device_ram_address_uxn_device_h_l115_c4_787d := resize(to_unsigned(38, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l113_c3_c338_iftrue := VAR_result_device_ram_address_uxn_device_h_l115_c4_787d;
     VAR_result_device_ram_address_uxn_device_h_l81_c4_0d50 := resize(to_unsigned(41, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l78_c3_a3e7_iftrue := VAR_result_device_ram_address_uxn_device_h_l81_c4_0d50;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c2_c27c_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l121_c4_53ed := resize(to_unsigned(38, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_4341_iftrue := VAR_result_device_ram_address_uxn_device_h_l121_c4_53ed;
     VAR_vram_addr_uxn_device_h_l48_c3_31c1 := resize(to_unsigned(0, 1), 32);
     VAR_vram_addr_MUX_uxn_device_h_l42_c2_c27c_iftrue := VAR_vram_addr_uxn_device_h_l48_c3_31c1;
     VAR_BIN_OP_AND_uxn_device_h_l198_c8_a07b_right := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l86_c4_f1fc := resize(to_unsigned(41, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l85_c3_de64_iftrue := VAR_result_device_ram_address_uxn_device_h_l86_c4_f1fc;
     VAR_BIN_OP_EQ_uxn_device_h_l210_c11_f124_right := to_unsigned(17, 5);
     VAR_BIN_OP_EQ_uxn_device_h_l100_c11_e32a_right := to_unsigned(8, 4);
     VAR_MUX_uxn_device_h_l44_c20_9375_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l179_c4_17b5 := resize(to_unsigned(45, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l178_c3_85d0_iftrue := VAR_result_device_ram_address_uxn_device_h_l179_c4_17b5;
     VAR_result_is_vram_write_MUX_uxn_device_h_l131_c4_1268_iffalse := to_unsigned(1, 1);
     VAR_result_vram_address_uxn_device_h_l153_c4_f17b := resize(to_unsigned(0, 1), 32);
     VAR_result_vram_address_MUX_uxn_device_h_l150_c3_5fc1_iftrue := VAR_result_vram_address_uxn_device_h_l153_c4_f17b;
     VAR_result_device_ram_address_uxn_device_h_l174_c5_0871 := resize(to_unsigned(41, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l172_c4_ae83_iftrue := VAR_result_device_ram_address_uxn_device_h_l174_c5_0871;
     VAR_MUX_uxn_device_h_l58_c32_3abd_iftrue := resize(to_unsigned(46, 6), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l124_c11_e7bd_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l107_c11_dfe7_right := to_unsigned(9, 4);
     VAR_result_u8_value_uxn_device_h_l154_c4_047e := resize(to_unsigned(0, 1), 8);
     VAR_result_u8_value_MUX_uxn_device_h_l155_c4_93e4_iffalse := VAR_result_u8_value_uxn_device_h_l154_c4_047e;
     VAR_result_u8_value_MUX_uxn_device_h_l156_c5_f4d5_iffalse := VAR_result_u8_value_uxn_device_h_l154_c4_047e;
     VAR_MUX_uxn_device_h_l134_c19_0b0f_iftrue := to_unsigned(1048576, 21);
     VAR_result_device_ram_address_uxn_device_h_l193_c4_8e9b := resize(to_unsigned(45, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l192_c3_ab93_iftrue := VAR_result_device_ram_address_uxn_device_h_l193_c4_8e9b;
     VAR_result_is_vram_write_MUX_uxn_device_h_l131_c4_1268_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l112_c11_8544_right := to_unsigned(10, 4);
     VAR_MUX_uxn_device_h_l120_c27_2a91_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l43_c19_c5ea_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l95_c11_9959_right := to_unsigned(7, 3);
     VAR_BIN_OP_AND_uxn_device_h_l128_c32_8870_right := to_unsigned(3, 2);
     VAR_result_is_deo_done_MUX_uxn_device_h_l211_c3_8d0f_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l159_c6_0604 := resize(to_unsigned(40, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l156_c5_f4d5_iftrue := VAR_result_device_ram_address_uxn_device_h_l159_c6_0604;
     VAR_BIN_OP_EQ_uxn_device_h_l184_c11_e7fe_right := to_unsigned(15, 4);
     VAR_MUX_uxn_device_h_l43_c19_f016_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l84_c11_61bb_right := to_unsigned(5, 3);
     VAR_result_device_ram_address_uxn_device_h_l167_c4_410c := resize(to_unsigned(44, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l166_c8_942b_iftrue := VAR_result_device_ram_address_uxn_device_h_l167_c4_410c;
     VAR_BIN_OP_EQ_uxn_device_h_l72_c11_b403_right := to_unsigned(3, 2);
     VAR_MUX_uxn_device_h_l135_c19_5967_iftrue := to_unsigned(2097152, 22);
     VAR_result_is_vram_write_MUX_uxn_device_h_l150_c3_5fc1_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l42_c2_c27c_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l120_c27_2a91_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l109_c4_6659 := resize(to_unsigned(43, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_ef31_iftrue := VAR_result_device_ram_address_uxn_device_h_l109_c4_6659;
     VAR_MUX_uxn_device_h_l43_c19_f016_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l134_c19_0b0f_iffalse := resize(to_unsigned(0, 1), 21);
     VAR_BIN_OP_EQ_uxn_device_h_l56_c11_25a0_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l42_c6_10f4_right := to_unsigned(0, 1);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l120_c27_178e_right := to_unsigned(400, 9);
     VAR_result_is_deo_done_MUX_uxn_device_h_l204_c3_197f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l196_c11_0992_right := to_unsigned(16, 5);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l211_c3_8d0f_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l49_c3_de5f_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l157_c6_6fb1_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l77_c11_545d_right := to_unsigned(4, 3);

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
     VAR_BIN_OP_AND_uxn_device_h_l156_c9_d0d7_left := auto_advance;
     VAR_BIN_OP_AND_uxn_device_h_l172_c8_b586_left := auto_advance;
     VAR_CONST_SR_1_uint8_t_uxn_device_h_l198_l186_DUPLICATE_bbf7_x := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l100_c7_ba7b_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l107_c7_5fb4_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l112_c7_82e8_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l118_c7_d5ea_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l124_c7_3d44_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l144_c8_0544_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l42_c2_c27c_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l56_c7_f9d9_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l61_c7_5d0a_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l72_c7_470e_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l77_c7_76e7_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l84_c7_0b55_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l89_c7_6231_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l95_c7_f81e_iftrue := auto_advance;
     VAR_BIN_OP_AND_uxn_device_h_l128_c32_8870_left := color;
     VAR_color_MUX_uxn_device_h_l42_c2_c27c_iftrue := color;
     VAR_color_MUX_uxn_device_h_l56_c7_f9d9_iftrue := color;
     VAR_color_MUX_uxn_device_h_l61_c7_5d0a_iffalse := color;
     VAR_color_MUX_uxn_device_h_l62_c3_6024_iffalse := color;
     VAR_ctrl_MUX_uxn_device_h_l42_c2_c27c_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l56_c7_f9d9_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l61_c7_5d0a_iffalse := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l62_c3_6024_iffalse := ctrl;
     VAR_UNARY_OP_NOT_uxn_device_h_l155_c9_9342_expr := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l42_c2_c27c_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l56_c7_f9d9_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l61_c7_5d0a_iffalse := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l62_c3_6024_iffalse := ctrl_mode;
     VAR_result_is_vram_write_MUX_uxn_device_h_l131_c4_1268_cond := ctrl_mode;
     VAR_result_vram_address_MUX_uxn_device_h_l131_c4_1268_cond := ctrl_mode;
     VAR_vram_addr_MUX_uxn_device_h_l131_c4_1268_cond := ctrl_mode;
     VAR_BIN_OP_EQ_uxn_device_h_l43_c19_c5ea_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l44_c20_fd38_left := VAR_device_port;
     VAR_MUX_uxn_device_h_l134_c19_0b0f_cond := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l42_c2_c27c_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l56_c7_f9d9_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l61_c7_5d0a_iffalse := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l62_c3_6024_iffalse := flip_x;
     VAR_MUX_uxn_device_h_l135_c19_5967_cond := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l42_c2_c27c_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l56_c7_f9d9_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l61_c7_5d0a_iffalse := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l62_c3_6024_iffalse := flip_y;
     VAR_color_MUX_uxn_device_h_l62_c3_6024_cond := is_drawing_port;
     VAR_ctrl_MUX_uxn_device_h_l62_c3_6024_cond := is_drawing_port;
     VAR_ctrl_mode_MUX_uxn_device_h_l62_c3_6024_cond := is_drawing_port;
     VAR_flip_x_MUX_uxn_device_h_l62_c3_6024_cond := is_drawing_port;
     VAR_flip_y_MUX_uxn_device_h_l62_c3_6024_cond := is_drawing_port;
     VAR_is_drawing_port_MUX_uxn_device_h_l42_c2_c27c_iffalse := is_drawing_port;
     VAR_layer_MUX_uxn_device_h_l62_c3_6024_cond := is_drawing_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l101_c3_18ac_cond := is_drawing_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_ef31_cond := is_drawing_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l113_c3_c338_cond := is_drawing_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_4341_cond := is_drawing_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l57_c3_8f9c_cond := is_drawing_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l62_c3_6024_cond := is_drawing_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_d1e7_cond := is_drawing_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l78_c3_a3e7_cond := is_drawing_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l85_c3_de64_cond := is_drawing_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_5121_cond := is_drawing_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l96_c3_6c51_cond := is_drawing_port;
     VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_4341_cond := is_drawing_port;
     VAR_x_MUX_uxn_device_h_l78_c3_a3e7_cond := is_drawing_port;
     VAR_x_MUX_uxn_device_h_l90_c3_5121_cond := is_drawing_port;
     VAR_y_MUX_uxn_device_h_l101_c3_18ac_cond := is_drawing_port;
     VAR_y_MUX_uxn_device_h_l113_c3_c338_cond := is_drawing_port;
     VAR_MUX_uxn_device_h_l58_c32_3abd_cond := is_pixel_port;
     VAR_auto_advance_MUX_uxn_device_h_l125_c3_2150_cond := is_pixel_port;
     VAR_is_pixel_port_MUX_uxn_device_h_l42_c2_c27c_iffalse := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_2150_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l150_c3_5fc1_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l171_c3_99f3_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l185_c3_b7f1_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l197_c3_e13e_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l211_c3_8d0f_cond := is_pixel_port;
     VAR_result_is_deo_done_MUX_uxn_device_h_l150_c3_5fc1_cond := is_pixel_port;
     VAR_result_is_deo_done_MUX_uxn_device_h_l211_c3_8d0f_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l150_c3_5fc1_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l171_c3_99f3_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l185_c3_b7f1_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c3_e13e_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l211_c3_8d0f_cond := is_pixel_port;
     VAR_result_is_vram_write_MUX_uxn_device_h_l125_c3_2150_cond := is_pixel_port;
     VAR_result_is_vram_write_MUX_uxn_device_h_l150_c3_5fc1_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l125_c3_2150_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l150_c3_5fc1_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l171_c3_99f3_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l185_c3_b7f1_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l197_c3_e13e_cond := is_pixel_port;
     VAR_result_vram_address_MUX_uxn_device_h_l125_c3_2150_cond := is_pixel_port;
     VAR_result_vram_address_MUX_uxn_device_h_l150_c3_5fc1_cond := is_pixel_port;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l125_c3_2150_cond := is_pixel_port;
     VAR_vram_addr_MUX_uxn_device_h_l125_c3_2150_cond := is_pixel_port;
     VAR_x_MUX_uxn_device_h_l150_c3_5fc1_cond := is_pixel_port;
     VAR_auto_advance_MUX_uxn_device_h_l144_c8_0544_cond := is_sprite_port;
     VAR_is_sprite_port_MUX_uxn_device_h_l42_c2_c27c_iffalse := is_sprite_port;
     VAR_ram_addr_MUX_uxn_device_h_l178_c3_85d0_cond := is_sprite_port;
     VAR_ram_addr_MUX_uxn_device_h_l204_c3_197f_cond := is_sprite_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l144_c8_0544_cond := is_sprite_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l166_c8_942b_cond := is_sprite_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l178_c3_85d0_cond := is_sprite_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l192_c3_ab93_cond := is_sprite_port;
     VAR_result_is_deo_done_MUX_uxn_device_h_l204_c3_197f_cond := is_sprite_port;
     VAR_layer_MUX_uxn_device_h_l42_c2_c27c_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l56_c7_f9d9_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l61_c7_5d0a_iffalse := layer;
     VAR_layer_MUX_uxn_device_h_l62_c3_6024_iffalse := layer;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l125_c3_2150_iftrue := layer;
     VAR_BIN_OP_EQ_uxn_device_h_l100_c11_e32a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l107_c11_dfe7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l112_c11_8544_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l118_c11_03cb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l124_c11_e7bd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l149_c11_aaf4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l170_c11_d097_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l184_c11_e7fe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l196_c11_0992_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l210_c11_f124_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l42_c6_10f4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l56_c11_25a0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l61_c11_5e8f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l72_c11_b403_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l77_c11_545d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l84_c11_61bb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l89_c11_bbd0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l95_c11_9959_left := VAR_phase;
     VAR_CONST_SR_4_uxn_device_h_l68_c23_0abd_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_5_uxn_device_h_l67_c23_34f6_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_6_uxn_device_h_l66_c22_77cc_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_7_uxn_device_h_l65_c26_808b_x := VAR_previous_device_ram_read;
     VAR_auto_advance_MUX_uxn_device_h_l125_c3_2150_iftrue := VAR_previous_device_ram_read;
     VAR_auto_advance_MUX_uxn_device_h_l144_c8_0544_iftrue := VAR_previous_device_ram_read;
     VAR_ctrl_MUX_uxn_device_h_l62_c3_6024_iftrue := VAR_previous_device_ram_read;
     VAR_BIN_OP_OR_uxn_device_h_l205_c4_c8b7_left := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l100_c7_ba7b_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l107_c7_5fb4_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l112_c7_82e8_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l118_c7_d5ea_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l124_c7_3d44_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l149_c7_bfbe_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l178_c3_85d0_iffalse := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l184_c7_c45b_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l196_c7_1f25_iffalse := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l204_c3_197f_iffalse := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l42_c2_c27c_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l56_c7_f9d9_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l61_c7_5d0a_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l72_c7_470e_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l77_c7_76e7_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l84_c7_0b55_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l89_c7_6231_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l95_c7_f81e_iftrue := ram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l100_c7_ba7b_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l107_c7_5fb4_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l112_c7_82e8_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l118_c7_d5ea_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l124_c7_3d44_iffalse := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l125_c3_2150_iffalse := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l131_c4_1268_iffalse := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l56_c7_f9d9_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l61_c7_5d0a_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l72_c7_470e_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l77_c7_76e7_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l84_c7_0b55_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l89_c7_6231_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l95_c7_f81e_iftrue := vram_addr;
     VAR_BIN_OP_OR_uxn_device_h_l91_c4_d5a5_left := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l120_c27_9ccd_right := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l157_c6_6fb1_left := x;
     VAR_x_MUX_uxn_device_h_l100_c7_ba7b_iftrue := x;
     VAR_x_MUX_uxn_device_h_l107_c7_5fb4_iftrue := x;
     VAR_x_MUX_uxn_device_h_l112_c7_82e8_iftrue := x;
     VAR_x_MUX_uxn_device_h_l118_c7_d5ea_iftrue := x;
     VAR_x_MUX_uxn_device_h_l124_c7_3d44_iftrue := x;
     VAR_x_MUX_uxn_device_h_l149_c7_bfbe_iffalse := x;
     VAR_x_MUX_uxn_device_h_l150_c3_5fc1_iffalse := x;
     VAR_x_MUX_uxn_device_h_l155_c4_93e4_iffalse := x;
     VAR_x_MUX_uxn_device_h_l156_c5_f4d5_iffalse := x;
     VAR_x_MUX_uxn_device_h_l42_c2_c27c_iftrue := x;
     VAR_x_MUX_uxn_device_h_l56_c7_f9d9_iftrue := x;
     VAR_x_MUX_uxn_device_h_l61_c7_5d0a_iftrue := x;
     VAR_x_MUX_uxn_device_h_l72_c7_470e_iftrue := x;
     VAR_x_MUX_uxn_device_h_l78_c3_a3e7_iffalse := x;
     VAR_x_MUX_uxn_device_h_l84_c7_0b55_iftrue := x;
     VAR_x_MUX_uxn_device_h_l90_c3_5121_iffalse := x;
     VAR_x_MUX_uxn_device_h_l95_c7_f81e_iftrue := x;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l120_c27_178e_left := y;
     VAR_BIN_OP_OR_uxn_device_h_l114_c4_7cc1_left := y;
     VAR_CONST_SR_8_uxn_device_h_l189_c33_cd3a_x := y;
     VAR_y_MUX_uxn_device_h_l101_c3_18ac_iffalse := y;
     VAR_y_MUX_uxn_device_h_l107_c7_5fb4_iftrue := y;
     VAR_y_MUX_uxn_device_h_l112_c7_82e8_iffalse := y;
     VAR_y_MUX_uxn_device_h_l113_c3_c338_iffalse := y;
     VAR_y_MUX_uxn_device_h_l42_c2_c27c_iftrue := y;
     VAR_y_MUX_uxn_device_h_l56_c7_f9d9_iftrue := y;
     VAR_y_MUX_uxn_device_h_l61_c7_5d0a_iftrue := y;
     VAR_y_MUX_uxn_device_h_l72_c7_470e_iftrue := y;
     VAR_y_MUX_uxn_device_h_l77_c7_76e7_iftrue := y;
     VAR_y_MUX_uxn_device_h_l84_c7_0b55_iftrue := y;
     VAR_y_MUX_uxn_device_h_l89_c7_6231_iftrue := y;
     VAR_y_MUX_uxn_device_h_l95_c7_f81e_iftrue := y;
     -- CAST_TO_uint32_t_uint16_t_uxn_device_h_l132_l140_DUPLICATE_e0d8 LATENCY=0
     VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l132_l140_DUPLICATE_e0d8_return_output := CAST_TO_uint32_t_uint16_t(
     y);

     -- CAST_TO_uint32_t_uint16_t_uxn_device_h_l140_l132_DUPLICATE_d44f LATENCY=0
     VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l140_l132_DUPLICATE_d44f_return_output := CAST_TO_uint32_t_uint16_t(
     x);

     -- BIN_OP_EQ[uxn_device_h_l184_c11_e7fe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l184_c11_e7fe_left <= VAR_BIN_OP_EQ_uxn_device_h_l184_c11_e7fe_left;
     BIN_OP_EQ_uxn_device_h_l184_c11_e7fe_right <= VAR_BIN_OP_EQ_uxn_device_h_l184_c11_e7fe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l184_c11_e7fe_return_output := BIN_OP_EQ_uxn_device_h_l184_c11_e7fe_return_output;

     -- BIN_OP_EQ[uxn_device_h_l44_c20_fd38] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l44_c20_fd38_left <= VAR_BIN_OP_EQ_uxn_device_h_l44_c20_fd38_left;
     BIN_OP_EQ_uxn_device_h_l44_c20_fd38_right <= VAR_BIN_OP_EQ_uxn_device_h_l44_c20_fd38_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l44_c20_fd38_return_output := BIN_OP_EQ_uxn_device_h_l44_c20_fd38_return_output;

     -- CONST_SR_5[uxn_device_h_l67_c23_34f6] LATENCY=0
     -- Inputs
     CONST_SR_5_uxn_device_h_l67_c23_34f6_x <= VAR_CONST_SR_5_uxn_device_h_l67_c23_34f6_x;
     -- Outputs
     VAR_CONST_SR_5_uxn_device_h_l67_c23_34f6_return_output := CONST_SR_5_uxn_device_h_l67_c23_34f6_return_output;

     -- MUX[uxn_device_h_l58_c32_3abd] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l58_c32_3abd_cond <= VAR_MUX_uxn_device_h_l58_c32_3abd_cond;
     MUX_uxn_device_h_l58_c32_3abd_iftrue <= VAR_MUX_uxn_device_h_l58_c32_3abd_iftrue;
     MUX_uxn_device_h_l58_c32_3abd_iffalse <= VAR_MUX_uxn_device_h_l58_c32_3abd_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l58_c32_3abd_return_output := MUX_uxn_device_h_l58_c32_3abd_return_output;

     -- BIN_OP_EQ[uxn_device_h_l84_c11_61bb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l84_c11_61bb_left <= VAR_BIN_OP_EQ_uxn_device_h_l84_c11_61bb_left;
     BIN_OP_EQ_uxn_device_h_l84_c11_61bb_right <= VAR_BIN_OP_EQ_uxn_device_h_l84_c11_61bb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l84_c11_61bb_return_output := BIN_OP_EQ_uxn_device_h_l84_c11_61bb_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l61_l100_l56_l95_l149_l150_l89_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_b4f8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l61_l100_l56_l95_l149_l150_l89_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_b4f8_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_device_h_l89_c11_bbd0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l89_c11_bbd0_left <= VAR_BIN_OP_EQ_uxn_device_h_l89_c11_bbd0_left;
     BIN_OP_EQ_uxn_device_h_l89_c11_bbd0_right <= VAR_BIN_OP_EQ_uxn_device_h_l89_c11_bbd0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l89_c11_bbd0_return_output := BIN_OP_EQ_uxn_device_h_l89_c11_bbd0_return_output;

     -- BIN_OP_EQ[uxn_device_h_l210_c11_f124] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l210_c11_f124_left <= VAR_BIN_OP_EQ_uxn_device_h_l210_c11_f124_left;
     BIN_OP_EQ_uxn_device_h_l210_c11_f124_right <= VAR_BIN_OP_EQ_uxn_device_h_l210_c11_f124_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l210_c11_f124_return_output := BIN_OP_EQ_uxn_device_h_l210_c11_f124_return_output;

     -- BIN_OP_AND[uxn_device_h_l128_c32_8870] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l128_c32_8870_left <= VAR_BIN_OP_AND_uxn_device_h_l128_c32_8870_left;
     BIN_OP_AND_uxn_device_h_l128_c32_8870_right <= VAR_BIN_OP_AND_uxn_device_h_l128_c32_8870_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l128_c32_8870_return_output := BIN_OP_AND_uxn_device_h_l128_c32_8870_return_output;

     -- BIN_OP_EQ[uxn_device_h_l61_c11_5e8f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l61_c11_5e8f_left <= VAR_BIN_OP_EQ_uxn_device_h_l61_c11_5e8f_left;
     BIN_OP_EQ_uxn_device_h_l61_c11_5e8f_right <= VAR_BIN_OP_EQ_uxn_device_h_l61_c11_5e8f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l61_c11_5e8f_return_output := BIN_OP_EQ_uxn_device_h_l61_c11_5e8f_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l61_l100_l170_l56_l211_l95_l150_l89_l124_l84_l119_l155_l204_l77_l112_l72_l107_l184_DUPLICATE_75d5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l61_l100_l170_l56_l211_l95_l150_l89_l124_l84_l119_l155_l204_l77_l112_l72_l107_l184_DUPLICATE_75d5_return_output := result.is_deo_done;

     -- MUX[uxn_device_h_l135_c19_5967] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l135_c19_5967_cond <= VAR_MUX_uxn_device_h_l135_c19_5967_cond;
     MUX_uxn_device_h_l135_c19_5967_iftrue <= VAR_MUX_uxn_device_h_l135_c19_5967_iftrue;
     MUX_uxn_device_h_l135_c19_5967_iffalse <= VAR_MUX_uxn_device_h_l135_c19_5967_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l135_c19_5967_return_output := MUX_uxn_device_h_l135_c19_5967_return_output;

     -- BIN_OP_EQ[uxn_device_h_l72_c11_b403] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l72_c11_b403_left <= VAR_BIN_OP_EQ_uxn_device_h_l72_c11_b403_left;
     BIN_OP_EQ_uxn_device_h_l72_c11_b403_right <= VAR_BIN_OP_EQ_uxn_device_h_l72_c11_b403_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l72_c11_b403_return_output := BIN_OP_EQ_uxn_device_h_l72_c11_b403_return_output;

     -- ctrl_MUX[uxn_device_h_l62_c3_6024] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l62_c3_6024_cond <= VAR_ctrl_MUX_uxn_device_h_l62_c3_6024_cond;
     ctrl_MUX_uxn_device_h_l62_c3_6024_iftrue <= VAR_ctrl_MUX_uxn_device_h_l62_c3_6024_iftrue;
     ctrl_MUX_uxn_device_h_l62_c3_6024_iffalse <= VAR_ctrl_MUX_uxn_device_h_l62_c3_6024_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l62_c3_6024_return_output := ctrl_MUX_uxn_device_h_l62_c3_6024_return_output;

     -- BIN_OP_EQ[uxn_device_h_l118_c11_03cb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l118_c11_03cb_left <= VAR_BIN_OP_EQ_uxn_device_h_l118_c11_03cb_left;
     BIN_OP_EQ_uxn_device_h_l118_c11_03cb_right <= VAR_BIN_OP_EQ_uxn_device_h_l118_c11_03cb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l118_c11_03cb_return_output := BIN_OP_EQ_uxn_device_h_l118_c11_03cb_return_output;

     -- BIN_OP_EQ[uxn_device_h_l95_c11_9959] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l95_c11_9959_left <= VAR_BIN_OP_EQ_uxn_device_h_l95_c11_9959_left;
     BIN_OP_EQ_uxn_device_h_l95_c11_9959_right <= VAR_BIN_OP_EQ_uxn_device_h_l95_c11_9959_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l95_c11_9959_return_output := BIN_OP_EQ_uxn_device_h_l95_c11_9959_return_output;

     -- auto_advance_MUX[uxn_device_h_l144_c8_0544] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l144_c8_0544_cond <= VAR_auto_advance_MUX_uxn_device_h_l144_c8_0544_cond;
     auto_advance_MUX_uxn_device_h_l144_c8_0544_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l144_c8_0544_iftrue;
     auto_advance_MUX_uxn_device_h_l144_c8_0544_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l144_c8_0544_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l144_c8_0544_return_output := auto_advance_MUX_uxn_device_h_l144_c8_0544_return_output;

     -- BIN_OP_EQ[uxn_device_h_l196_c11_0992] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l196_c11_0992_left <= VAR_BIN_OP_EQ_uxn_device_h_l196_c11_0992_left;
     BIN_OP_EQ_uxn_device_h_l196_c11_0992_right <= VAR_BIN_OP_EQ_uxn_device_h_l196_c11_0992_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l196_c11_0992_return_output := BIN_OP_EQ_uxn_device_h_l196_c11_0992_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_device_h_l91_l180_l205_l79_l102_l114_DUPLICATE_f0fd LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l91_l180_l205_l79_l102_l114_DUPLICATE_f0fd_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_device_ram_read);

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l166_l211_l198_l108_l57_l210_l62_l90_l73_l171_l113_l172_l96_l185_l186_l78_l156_l119_l155_l49_l101_l144_l197_l85_DUPLICATE_f2ba LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l166_l211_l198_l108_l57_l210_l62_l90_l73_l171_l113_l172_l96_l185_l186_l78_l156_l119_l155_l49_l101_l144_l197_l85_DUPLICATE_f2ba_return_output := result.device_ram_address;

     -- CAST_TO_uint8_t[uxn_device_h_l175_c23_b16e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l175_c23_b16e_return_output := CAST_TO_uint8_t_uint16_t(
     x);

     -- BIN_OP_EQ[uxn_device_h_l107_c11_dfe7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l107_c11_dfe7_left <= VAR_BIN_OP_EQ_uxn_device_h_l107_c11_dfe7_left;
     BIN_OP_EQ_uxn_device_h_l107_c11_dfe7_right <= VAR_BIN_OP_EQ_uxn_device_h_l107_c11_dfe7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l107_c11_dfe7_return_output := BIN_OP_EQ_uxn_device_h_l107_c11_dfe7_return_output;

     -- UNARY_OP_NOT[uxn_device_h_l155_c9_9342] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_device_h_l155_c9_9342_expr <= VAR_UNARY_OP_NOT_uxn_device_h_l155_c9_9342_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_device_h_l155_c9_9342_return_output := UNARY_OP_NOT_uxn_device_h_l155_c9_9342_return_output;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l61_l100_l56_l95_l149_l42_l150_l89_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_4175 LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l61_l100_l56_l95_l149_l42_l150_l89_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_4175_return_output := result.vram_address;

     -- CONST_SR_4[uxn_device_h_l68_c23_0abd] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_device_h_l68_c23_0abd_x <= VAR_CONST_SR_4_uxn_device_h_l68_c23_0abd_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_device_h_l68_c23_0abd_return_output := CONST_SR_4_uxn_device_h_l68_c23_0abd_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l157_c6_6fb1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l157_c6_6fb1_left <= VAR_BIN_OP_PLUS_uxn_device_h_l157_c6_6fb1_left;
     BIN_OP_PLUS_uxn_device_h_l157_c6_6fb1_right <= VAR_BIN_OP_PLUS_uxn_device_h_l157_c6_6fb1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l157_c6_6fb1_return_output := BIN_OP_PLUS_uxn_device_h_l157_c6_6fb1_return_output;

     -- MUX[uxn_device_h_l134_c19_0b0f] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l134_c19_0b0f_cond <= VAR_MUX_uxn_device_h_l134_c19_0b0f_cond;
     MUX_uxn_device_h_l134_c19_0b0f_iftrue <= VAR_MUX_uxn_device_h_l134_c19_0b0f_iftrue;
     MUX_uxn_device_h_l134_c19_0b0f_iffalse <= VAR_MUX_uxn_device_h_l134_c19_0b0f_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l134_c19_0b0f_return_output := MUX_uxn_device_h_l134_c19_0b0f_return_output;

     -- CONST_SR_7[uxn_device_h_l65_c26_808b] LATENCY=0
     -- Inputs
     CONST_SR_7_uxn_device_h_l65_c26_808b_x <= VAR_CONST_SR_7_uxn_device_h_l65_c26_808b_x;
     -- Outputs
     VAR_CONST_SR_7_uxn_device_h_l65_c26_808b_return_output := CONST_SR_7_uxn_device_h_l65_c26_808b_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l61_l100_l56_l95_l42_l89_l124_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_9168 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l61_l100_l56_l95_l42_l89_l124_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_9168_return_output := result.vram_write_layer;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l120_c27_178e] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l120_c27_178e_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l120_c27_178e_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l120_c27_178e_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l120_c27_178e_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l120_c27_178e_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l120_c27_178e_return_output;

     -- BIN_OP_AND[uxn_device_h_l172_c8_b586] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l172_c8_b586_left <= VAR_BIN_OP_AND_uxn_device_h_l172_c8_b586_left;
     BIN_OP_AND_uxn_device_h_l172_c8_b586_right <= VAR_BIN_OP_AND_uxn_device_h_l172_c8_b586_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l172_c8_b586_return_output := BIN_OP_AND_uxn_device_h_l172_c8_b586_return_output;

     -- BIN_OP_EQ[uxn_device_h_l42_c6_10f4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l42_c6_10f4_left <= VAR_BIN_OP_EQ_uxn_device_h_l42_c6_10f4_left;
     BIN_OP_EQ_uxn_device_h_l42_c6_10f4_right <= VAR_BIN_OP_EQ_uxn_device_h_l42_c6_10f4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l42_c6_10f4_return_output := BIN_OP_EQ_uxn_device_h_l42_c6_10f4_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l198_l150_l196_l171_l118_l112_l172_l107_l100_l95_l185_l89_l84_l77_l186_l72_l61_l56_l42_l197_l125_DUPLICATE_8478 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l198_l150_l196_l171_l118_l112_l172_l107_l100_l95_l185_l89_l84_l77_l186_l72_l61_l56_l42_l197_l125_DUPLICATE_8478_return_output := result.u8_value;

     -- CONST_SR_1_uint8_t_uxn_device_h_l198_l186_DUPLICATE_bbf7 LATENCY=0
     -- Inputs
     CONST_SR_1_uint8_t_uxn_device_h_l198_l186_DUPLICATE_bbf7_x <= VAR_CONST_SR_1_uint8_t_uxn_device_h_l198_l186_DUPLICATE_bbf7_x;
     -- Outputs
     VAR_CONST_SR_1_uint8_t_uxn_device_h_l198_l186_DUPLICATE_bbf7_return_output := CONST_SR_1_uint8_t_uxn_device_h_l198_l186_DUPLICATE_bbf7_return_output;

     -- CAST_TO_uint4_t[uxn_device_h_l64_c12_1cdb] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l64_c12_1cdb_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_EQ[uxn_device_h_l43_c19_c5ea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l43_c19_c5ea_left <= VAR_BIN_OP_EQ_uxn_device_h_l43_c19_c5ea_left;
     BIN_OP_EQ_uxn_device_h_l43_c19_c5ea_right <= VAR_BIN_OP_EQ_uxn_device_h_l43_c19_c5ea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l43_c19_c5ea_return_output := BIN_OP_EQ_uxn_device_h_l43_c19_c5ea_return_output;

     -- CONST_SR_8[uxn_device_h_l189_c33_cd3a] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l189_c33_cd3a_x <= VAR_CONST_SR_8_uxn_device_h_l189_c33_cd3a_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l189_c33_cd3a_return_output := CONST_SR_8_uxn_device_h_l189_c33_cd3a_return_output;

     -- BIN_OP_EQ[uxn_device_h_l170_c11_d097] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l170_c11_d097_left <= VAR_BIN_OP_EQ_uxn_device_h_l170_c11_d097_left;
     BIN_OP_EQ_uxn_device_h_l170_c11_d097_right <= VAR_BIN_OP_EQ_uxn_device_h_l170_c11_d097_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l170_c11_d097_return_output := BIN_OP_EQ_uxn_device_h_l170_c11_d097_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l201_c23_a757] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l201_c23_a757_return_output := CAST_TO_uint8_t_uint16_t(
     y);

     -- BIN_OP_EQ[uxn_device_h_l112_c11_8544] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l112_c11_8544_left <= VAR_BIN_OP_EQ_uxn_device_h_l112_c11_8544_left;
     BIN_OP_EQ_uxn_device_h_l112_c11_8544_right <= VAR_BIN_OP_EQ_uxn_device_h_l112_c11_8544_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l112_c11_8544_return_output := BIN_OP_EQ_uxn_device_h_l112_c11_8544_return_output;

     -- BIN_OP_EQ[uxn_device_h_l100_c11_e32a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l100_c11_e32a_left <= VAR_BIN_OP_EQ_uxn_device_h_l100_c11_e32a_left;
     BIN_OP_EQ_uxn_device_h_l100_c11_e32a_right <= VAR_BIN_OP_EQ_uxn_device_h_l100_c11_e32a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l100_c11_e32a_return_output := BIN_OP_EQ_uxn_device_h_l100_c11_e32a_return_output;

     -- CONST_SR_6[uxn_device_h_l66_c22_77cc] LATENCY=0
     -- Inputs
     CONST_SR_6_uxn_device_h_l66_c22_77cc_x <= VAR_CONST_SR_6_uxn_device_h_l66_c22_77cc_x;
     -- Outputs
     VAR_CONST_SR_6_uxn_device_h_l66_c22_77cc_return_output := CONST_SR_6_uxn_device_h_l66_c22_77cc_return_output;

     -- BIN_OP_EQ[uxn_device_h_l56_c11_25a0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l56_c11_25a0_left <= VAR_BIN_OP_EQ_uxn_device_h_l56_c11_25a0_left;
     BIN_OP_EQ_uxn_device_h_l56_c11_25a0_right <= VAR_BIN_OP_EQ_uxn_device_h_l56_c11_25a0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l56_c11_25a0_return_output := BIN_OP_EQ_uxn_device_h_l56_c11_25a0_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l197_l211_l150_l198_l210_l124_l118_l171_l112_l107_l100_l172_l95_l89_l84_l185_l77_l72_l61_l156_l186_l56_l155_DUPLICATE_861b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l197_l211_l150_l198_l210_l124_l118_l171_l112_l107_l100_l172_l95_l89_l84_l185_l77_l72_l61_l156_l186_l56_l155_DUPLICATE_861b_return_output := result.is_device_ram_write;

     -- BIN_OP_AND[uxn_device_h_l156_c9_d0d7] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l156_c9_d0d7_left <= VAR_BIN_OP_AND_uxn_device_h_l156_c9_d0d7_left;
     BIN_OP_AND_uxn_device_h_l156_c9_d0d7_right <= VAR_BIN_OP_AND_uxn_device_h_l156_c9_d0d7_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l156_c9_d0d7_return_output := BIN_OP_AND_uxn_device_h_l156_c9_d0d7_return_output;

     -- BIN_OP_EQ[uxn_device_h_l77_c11_545d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l77_c11_545d_left <= VAR_BIN_OP_EQ_uxn_device_h_l77_c11_545d_left;
     BIN_OP_EQ_uxn_device_h_l77_c11_545d_right <= VAR_BIN_OP_EQ_uxn_device_h_l77_c11_545d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l77_c11_545d_return_output := BIN_OP_EQ_uxn_device_h_l77_c11_545d_return_output;

     -- BIN_OP_EQ[uxn_device_h_l124_c11_e7bd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l124_c11_e7bd_left <= VAR_BIN_OP_EQ_uxn_device_h_l124_c11_e7bd_left;
     BIN_OP_EQ_uxn_device_h_l124_c11_e7bd_right <= VAR_BIN_OP_EQ_uxn_device_h_l124_c11_e7bd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l124_c11_e7bd_return_output := BIN_OP_EQ_uxn_device_h_l124_c11_e7bd_return_output;

     -- BIN_OP_EQ[uxn_device_h_l149_c11_aaf4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l149_c11_aaf4_left <= VAR_BIN_OP_EQ_uxn_device_h_l149_c11_aaf4_left;
     BIN_OP_EQ_uxn_device_h_l149_c11_aaf4_right <= VAR_BIN_OP_EQ_uxn_device_h_l149_c11_aaf4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l149_c11_aaf4_return_output := BIN_OP_EQ_uxn_device_h_l149_c11_aaf4_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l131_c4_1268] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l131_c4_1268_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l131_c4_1268_cond;
     result_is_vram_write_MUX_uxn_device_h_l131_c4_1268_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l131_c4_1268_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l131_c4_1268_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l131_c4_1268_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l131_c4_1268_return_output := result_is_vram_write_MUX_uxn_device_h_l131_c4_1268_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_device_h_l156_c5_f4d5_interm_cond := resize(VAR_BIN_OP_AND_uxn_device_h_l156_c9_d0d7_return_output, 1);
     VAR_MUX_uxn_device_h_l172_c4_ae83_interm_cond := resize(VAR_BIN_OP_AND_uxn_device_h_l172_c8_b586_return_output, 1);
     VAR_auto_advance_MUX_uxn_device_h_l100_c7_ba7b_cond := VAR_BIN_OP_EQ_uxn_device_h_l100_c11_e32a_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l100_c7_ba7b_cond := VAR_BIN_OP_EQ_uxn_device_h_l100_c11_e32a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c7_ba7b_cond := VAR_BIN_OP_EQ_uxn_device_h_l100_c11_e32a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c7_ba7b_cond := VAR_BIN_OP_EQ_uxn_device_h_l100_c11_e32a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l100_c7_ba7b_cond := VAR_BIN_OP_EQ_uxn_device_h_l100_c11_e32a_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l100_c7_ba7b_cond := VAR_BIN_OP_EQ_uxn_device_h_l100_c11_e32a_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l100_c7_ba7b_cond := VAR_BIN_OP_EQ_uxn_device_h_l100_c11_e32a_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l100_c7_ba7b_cond := VAR_BIN_OP_EQ_uxn_device_h_l100_c11_e32a_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l100_c7_ba7b_cond := VAR_BIN_OP_EQ_uxn_device_h_l100_c11_e32a_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l100_c7_ba7b_cond := VAR_BIN_OP_EQ_uxn_device_h_l100_c11_e32a_return_output;
     VAR_x_MUX_uxn_device_h_l100_c7_ba7b_cond := VAR_BIN_OP_EQ_uxn_device_h_l100_c11_e32a_return_output;
     VAR_y_MUX_uxn_device_h_l100_c7_ba7b_cond := VAR_BIN_OP_EQ_uxn_device_h_l100_c11_e32a_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l107_c7_5fb4_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_dfe7_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l107_c7_5fb4_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_dfe7_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_5fb4_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_dfe7_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_5fb4_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_dfe7_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l107_c7_5fb4_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_dfe7_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_5fb4_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_dfe7_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l107_c7_5fb4_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_dfe7_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l107_c7_5fb4_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_dfe7_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l107_c7_5fb4_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_dfe7_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l107_c7_5fb4_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_dfe7_return_output;
     VAR_x_MUX_uxn_device_h_l107_c7_5fb4_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_dfe7_return_output;
     VAR_y_MUX_uxn_device_h_l107_c7_5fb4_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_dfe7_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l112_c7_82e8_cond := VAR_BIN_OP_EQ_uxn_device_h_l112_c11_8544_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l112_c7_82e8_cond := VAR_BIN_OP_EQ_uxn_device_h_l112_c11_8544_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l112_c7_82e8_cond := VAR_BIN_OP_EQ_uxn_device_h_l112_c11_8544_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l112_c7_82e8_cond := VAR_BIN_OP_EQ_uxn_device_h_l112_c11_8544_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l112_c7_82e8_cond := VAR_BIN_OP_EQ_uxn_device_h_l112_c11_8544_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l112_c7_82e8_cond := VAR_BIN_OP_EQ_uxn_device_h_l112_c11_8544_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l112_c7_82e8_cond := VAR_BIN_OP_EQ_uxn_device_h_l112_c11_8544_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l112_c7_82e8_cond := VAR_BIN_OP_EQ_uxn_device_h_l112_c11_8544_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l112_c7_82e8_cond := VAR_BIN_OP_EQ_uxn_device_h_l112_c11_8544_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l112_c7_82e8_cond := VAR_BIN_OP_EQ_uxn_device_h_l112_c11_8544_return_output;
     VAR_x_MUX_uxn_device_h_l112_c7_82e8_cond := VAR_BIN_OP_EQ_uxn_device_h_l112_c11_8544_return_output;
     VAR_y_MUX_uxn_device_h_l112_c7_82e8_cond := VAR_BIN_OP_EQ_uxn_device_h_l112_c11_8544_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l118_c7_d5ea_cond := VAR_BIN_OP_EQ_uxn_device_h_l118_c11_03cb_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l118_c7_d5ea_cond := VAR_BIN_OP_EQ_uxn_device_h_l118_c11_03cb_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l118_c7_d5ea_cond := VAR_BIN_OP_EQ_uxn_device_h_l118_c11_03cb_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l118_c7_d5ea_cond := VAR_BIN_OP_EQ_uxn_device_h_l118_c11_03cb_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l118_c7_d5ea_cond := VAR_BIN_OP_EQ_uxn_device_h_l118_c11_03cb_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l118_c7_d5ea_cond := VAR_BIN_OP_EQ_uxn_device_h_l118_c11_03cb_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l118_c7_d5ea_cond := VAR_BIN_OP_EQ_uxn_device_h_l118_c11_03cb_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l118_c7_d5ea_cond := VAR_BIN_OP_EQ_uxn_device_h_l118_c11_03cb_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l118_c7_d5ea_cond := VAR_BIN_OP_EQ_uxn_device_h_l118_c11_03cb_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l118_c7_d5ea_cond := VAR_BIN_OP_EQ_uxn_device_h_l118_c11_03cb_return_output;
     VAR_x_MUX_uxn_device_h_l118_c7_d5ea_cond := VAR_BIN_OP_EQ_uxn_device_h_l118_c11_03cb_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l124_c7_3d44_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_e7bd_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l124_c7_3d44_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_e7bd_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_3d44_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_e7bd_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_3d44_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_e7bd_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l124_c7_3d44_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_e7bd_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_3d44_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_e7bd_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l124_c7_3d44_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_e7bd_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l124_c7_3d44_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_e7bd_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l124_c7_3d44_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_e7bd_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l124_c7_3d44_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_e7bd_return_output;
     VAR_x_MUX_uxn_device_h_l124_c7_3d44_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_e7bd_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l149_c7_bfbe_cond := VAR_BIN_OP_EQ_uxn_device_h_l149_c11_aaf4_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l149_c7_bfbe_cond := VAR_BIN_OP_EQ_uxn_device_h_l149_c11_aaf4_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l149_c7_bfbe_cond := VAR_BIN_OP_EQ_uxn_device_h_l149_c11_aaf4_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c7_bfbe_cond := VAR_BIN_OP_EQ_uxn_device_h_l149_c11_aaf4_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l149_c7_bfbe_cond := VAR_BIN_OP_EQ_uxn_device_h_l149_c11_aaf4_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l149_c7_bfbe_cond := VAR_BIN_OP_EQ_uxn_device_h_l149_c11_aaf4_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l149_c7_bfbe_cond := VAR_BIN_OP_EQ_uxn_device_h_l149_c11_aaf4_return_output;
     VAR_x_MUX_uxn_device_h_l149_c7_bfbe_cond := VAR_BIN_OP_EQ_uxn_device_h_l149_c11_aaf4_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l170_c7_b03c_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c11_d097_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l170_c7_b03c_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c11_d097_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l170_c7_b03c_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c11_d097_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l170_c7_b03c_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c11_d097_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l170_c7_b03c_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c11_d097_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l184_c7_c45b_cond := VAR_BIN_OP_EQ_uxn_device_h_l184_c11_e7fe_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l184_c7_c45b_cond := VAR_BIN_OP_EQ_uxn_device_h_l184_c11_e7fe_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l184_c7_c45b_cond := VAR_BIN_OP_EQ_uxn_device_h_l184_c11_e7fe_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l184_c7_c45b_cond := VAR_BIN_OP_EQ_uxn_device_h_l184_c11_e7fe_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l184_c7_c45b_cond := VAR_BIN_OP_EQ_uxn_device_h_l184_c11_e7fe_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l196_c7_1f25_cond := VAR_BIN_OP_EQ_uxn_device_h_l196_c11_0992_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l196_c7_1f25_cond := VAR_BIN_OP_EQ_uxn_device_h_l196_c11_0992_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l196_c7_1f25_cond := VAR_BIN_OP_EQ_uxn_device_h_l196_c11_0992_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c7_1f25_cond := VAR_BIN_OP_EQ_uxn_device_h_l196_c11_0992_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l196_c7_1f25_cond := VAR_BIN_OP_EQ_uxn_device_h_l196_c11_0992_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l210_c7_72c7_cond := VAR_BIN_OP_EQ_uxn_device_h_l210_c11_f124_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l210_c7_72c7_cond := VAR_BIN_OP_EQ_uxn_device_h_l210_c11_f124_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c7_72c7_cond := VAR_BIN_OP_EQ_uxn_device_h_l210_c11_f124_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l42_c2_c27c_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c6_10f4_return_output;
     VAR_color_MUX_uxn_device_h_l42_c2_c27c_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c6_10f4_return_output;
     VAR_ctrl_MUX_uxn_device_h_l42_c2_c27c_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c6_10f4_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l42_c2_c27c_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c6_10f4_return_output;
     VAR_flip_x_MUX_uxn_device_h_l42_c2_c27c_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c6_10f4_return_output;
     VAR_flip_y_MUX_uxn_device_h_l42_c2_c27c_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c6_10f4_return_output;
     VAR_is_drawing_port_MUX_uxn_device_h_l42_c2_c27c_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c6_10f4_return_output;
     VAR_is_pixel_port_MUX_uxn_device_h_l42_c2_c27c_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c6_10f4_return_output;
     VAR_is_sprite_port_MUX_uxn_device_h_l42_c2_c27c_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c6_10f4_return_output;
     VAR_layer_MUX_uxn_device_h_l42_c2_c27c_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c6_10f4_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l42_c2_c27c_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c6_10f4_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l42_c2_c27c_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c6_10f4_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l42_c2_c27c_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c6_10f4_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c2_c27c_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c6_10f4_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l42_c2_c27c_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c6_10f4_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l42_c2_c27c_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c6_10f4_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l42_c2_c27c_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c6_10f4_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l42_c2_c27c_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c6_10f4_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l42_c2_c27c_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c6_10f4_return_output;
     VAR_x_MUX_uxn_device_h_l42_c2_c27c_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c6_10f4_return_output;
     VAR_y_MUX_uxn_device_h_l42_c2_c27c_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c6_10f4_return_output;
     VAR_MUX_uxn_device_h_l43_c19_f016_cond := VAR_BIN_OP_EQ_uxn_device_h_l43_c19_c5ea_return_output;
     VAR_MUX_uxn_device_h_l44_c20_9375_cond := VAR_BIN_OP_EQ_uxn_device_h_l44_c20_fd38_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l56_c7_f9d9_cond := VAR_BIN_OP_EQ_uxn_device_h_l56_c11_25a0_return_output;
     VAR_color_MUX_uxn_device_h_l56_c7_f9d9_cond := VAR_BIN_OP_EQ_uxn_device_h_l56_c11_25a0_return_output;
     VAR_ctrl_MUX_uxn_device_h_l56_c7_f9d9_cond := VAR_BIN_OP_EQ_uxn_device_h_l56_c11_25a0_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l56_c7_f9d9_cond := VAR_BIN_OP_EQ_uxn_device_h_l56_c11_25a0_return_output;
     VAR_flip_x_MUX_uxn_device_h_l56_c7_f9d9_cond := VAR_BIN_OP_EQ_uxn_device_h_l56_c11_25a0_return_output;
     VAR_flip_y_MUX_uxn_device_h_l56_c7_f9d9_cond := VAR_BIN_OP_EQ_uxn_device_h_l56_c11_25a0_return_output;
     VAR_layer_MUX_uxn_device_h_l56_c7_f9d9_cond := VAR_BIN_OP_EQ_uxn_device_h_l56_c11_25a0_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l56_c7_f9d9_cond := VAR_BIN_OP_EQ_uxn_device_h_l56_c11_25a0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l56_c7_f9d9_cond := VAR_BIN_OP_EQ_uxn_device_h_l56_c11_25a0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l56_c7_f9d9_cond := VAR_BIN_OP_EQ_uxn_device_h_l56_c11_25a0_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l56_c7_f9d9_cond := VAR_BIN_OP_EQ_uxn_device_h_l56_c11_25a0_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l56_c7_f9d9_cond := VAR_BIN_OP_EQ_uxn_device_h_l56_c11_25a0_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l56_c7_f9d9_cond := VAR_BIN_OP_EQ_uxn_device_h_l56_c11_25a0_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l56_c7_f9d9_cond := VAR_BIN_OP_EQ_uxn_device_h_l56_c11_25a0_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l56_c7_f9d9_cond := VAR_BIN_OP_EQ_uxn_device_h_l56_c11_25a0_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l56_c7_f9d9_cond := VAR_BIN_OP_EQ_uxn_device_h_l56_c11_25a0_return_output;
     VAR_x_MUX_uxn_device_h_l56_c7_f9d9_cond := VAR_BIN_OP_EQ_uxn_device_h_l56_c11_25a0_return_output;
     VAR_y_MUX_uxn_device_h_l56_c7_f9d9_cond := VAR_BIN_OP_EQ_uxn_device_h_l56_c11_25a0_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l61_c7_5d0a_cond := VAR_BIN_OP_EQ_uxn_device_h_l61_c11_5e8f_return_output;
     VAR_color_MUX_uxn_device_h_l61_c7_5d0a_cond := VAR_BIN_OP_EQ_uxn_device_h_l61_c11_5e8f_return_output;
     VAR_ctrl_MUX_uxn_device_h_l61_c7_5d0a_cond := VAR_BIN_OP_EQ_uxn_device_h_l61_c11_5e8f_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l61_c7_5d0a_cond := VAR_BIN_OP_EQ_uxn_device_h_l61_c11_5e8f_return_output;
     VAR_flip_x_MUX_uxn_device_h_l61_c7_5d0a_cond := VAR_BIN_OP_EQ_uxn_device_h_l61_c11_5e8f_return_output;
     VAR_flip_y_MUX_uxn_device_h_l61_c7_5d0a_cond := VAR_BIN_OP_EQ_uxn_device_h_l61_c11_5e8f_return_output;
     VAR_layer_MUX_uxn_device_h_l61_c7_5d0a_cond := VAR_BIN_OP_EQ_uxn_device_h_l61_c11_5e8f_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l61_c7_5d0a_cond := VAR_BIN_OP_EQ_uxn_device_h_l61_c11_5e8f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l61_c7_5d0a_cond := VAR_BIN_OP_EQ_uxn_device_h_l61_c11_5e8f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l61_c7_5d0a_cond := VAR_BIN_OP_EQ_uxn_device_h_l61_c11_5e8f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l61_c7_5d0a_cond := VAR_BIN_OP_EQ_uxn_device_h_l61_c11_5e8f_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l61_c7_5d0a_cond := VAR_BIN_OP_EQ_uxn_device_h_l61_c11_5e8f_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l61_c7_5d0a_cond := VAR_BIN_OP_EQ_uxn_device_h_l61_c11_5e8f_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l61_c7_5d0a_cond := VAR_BIN_OP_EQ_uxn_device_h_l61_c11_5e8f_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l61_c7_5d0a_cond := VAR_BIN_OP_EQ_uxn_device_h_l61_c11_5e8f_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l61_c7_5d0a_cond := VAR_BIN_OP_EQ_uxn_device_h_l61_c11_5e8f_return_output;
     VAR_x_MUX_uxn_device_h_l61_c7_5d0a_cond := VAR_BIN_OP_EQ_uxn_device_h_l61_c11_5e8f_return_output;
     VAR_y_MUX_uxn_device_h_l61_c7_5d0a_cond := VAR_BIN_OP_EQ_uxn_device_h_l61_c11_5e8f_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l72_c7_470e_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_b403_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l72_c7_470e_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_b403_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_470e_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_b403_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_470e_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_b403_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l72_c7_470e_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_b403_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_470e_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_b403_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l72_c7_470e_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_b403_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l72_c7_470e_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_b403_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l72_c7_470e_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_b403_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l72_c7_470e_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_b403_return_output;
     VAR_x_MUX_uxn_device_h_l72_c7_470e_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_b403_return_output;
     VAR_y_MUX_uxn_device_h_l72_c7_470e_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_b403_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l77_c7_76e7_cond := VAR_BIN_OP_EQ_uxn_device_h_l77_c11_545d_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l77_c7_76e7_cond := VAR_BIN_OP_EQ_uxn_device_h_l77_c11_545d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l77_c7_76e7_cond := VAR_BIN_OP_EQ_uxn_device_h_l77_c11_545d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l77_c7_76e7_cond := VAR_BIN_OP_EQ_uxn_device_h_l77_c11_545d_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l77_c7_76e7_cond := VAR_BIN_OP_EQ_uxn_device_h_l77_c11_545d_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l77_c7_76e7_cond := VAR_BIN_OP_EQ_uxn_device_h_l77_c11_545d_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l77_c7_76e7_cond := VAR_BIN_OP_EQ_uxn_device_h_l77_c11_545d_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l77_c7_76e7_cond := VAR_BIN_OP_EQ_uxn_device_h_l77_c11_545d_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l77_c7_76e7_cond := VAR_BIN_OP_EQ_uxn_device_h_l77_c11_545d_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l77_c7_76e7_cond := VAR_BIN_OP_EQ_uxn_device_h_l77_c11_545d_return_output;
     VAR_x_MUX_uxn_device_h_l77_c7_76e7_cond := VAR_BIN_OP_EQ_uxn_device_h_l77_c11_545d_return_output;
     VAR_y_MUX_uxn_device_h_l77_c7_76e7_cond := VAR_BIN_OP_EQ_uxn_device_h_l77_c11_545d_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l84_c7_0b55_cond := VAR_BIN_OP_EQ_uxn_device_h_l84_c11_61bb_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l84_c7_0b55_cond := VAR_BIN_OP_EQ_uxn_device_h_l84_c11_61bb_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l84_c7_0b55_cond := VAR_BIN_OP_EQ_uxn_device_h_l84_c11_61bb_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l84_c7_0b55_cond := VAR_BIN_OP_EQ_uxn_device_h_l84_c11_61bb_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l84_c7_0b55_cond := VAR_BIN_OP_EQ_uxn_device_h_l84_c11_61bb_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l84_c7_0b55_cond := VAR_BIN_OP_EQ_uxn_device_h_l84_c11_61bb_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l84_c7_0b55_cond := VAR_BIN_OP_EQ_uxn_device_h_l84_c11_61bb_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l84_c7_0b55_cond := VAR_BIN_OP_EQ_uxn_device_h_l84_c11_61bb_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l84_c7_0b55_cond := VAR_BIN_OP_EQ_uxn_device_h_l84_c11_61bb_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l84_c7_0b55_cond := VAR_BIN_OP_EQ_uxn_device_h_l84_c11_61bb_return_output;
     VAR_x_MUX_uxn_device_h_l84_c7_0b55_cond := VAR_BIN_OP_EQ_uxn_device_h_l84_c11_61bb_return_output;
     VAR_y_MUX_uxn_device_h_l84_c7_0b55_cond := VAR_BIN_OP_EQ_uxn_device_h_l84_c11_61bb_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l89_c7_6231_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_bbd0_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l89_c7_6231_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_bbd0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_6231_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_bbd0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_6231_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_bbd0_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l89_c7_6231_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_bbd0_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_6231_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_bbd0_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l89_c7_6231_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_bbd0_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l89_c7_6231_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_bbd0_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l89_c7_6231_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_bbd0_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l89_c7_6231_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_bbd0_return_output;
     VAR_x_MUX_uxn_device_h_l89_c7_6231_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_bbd0_return_output;
     VAR_y_MUX_uxn_device_h_l89_c7_6231_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_bbd0_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l95_c7_f81e_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c11_9959_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l95_c7_f81e_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c11_9959_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l95_c7_f81e_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c11_9959_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l95_c7_f81e_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c11_9959_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l95_c7_f81e_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c11_9959_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l95_c7_f81e_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c11_9959_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l95_c7_f81e_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c11_9959_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l95_c7_f81e_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c11_9959_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l95_c7_f81e_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c11_9959_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l95_c7_f81e_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c11_9959_return_output;
     VAR_x_MUX_uxn_device_h_l95_c7_f81e_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c11_9959_return_output;
     VAR_y_MUX_uxn_device_h_l95_c7_f81e_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c11_9959_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l120_c27_9ccd_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l120_c27_178e_return_output;
     VAR_x_uxn_device_h_l157_c6_112d := resize(VAR_BIN_OP_PLUS_uxn_device_h_l157_c6_6fb1_return_output, 16);
     VAR_BIN_OP_OR_uxn_device_h_l114_c4_7cc1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l91_l180_l205_l79_l102_l114_DUPLICATE_f0fd_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l205_c4_c8b7_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l91_l180_l205_l79_l102_l114_DUPLICATE_f0fd_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l91_c4_d5a5_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l91_l180_l205_l79_l102_l114_DUPLICATE_f0fd_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l80_l181_l103_DUPLICATE_f0ca_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l91_l180_l205_l79_l102_l114_DUPLICATE_f0fd_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l132_c18_50dd_left := VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l132_l140_DUPLICATE_e0d8_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l140_c28_6579_left := VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l132_l140_DUPLICATE_e0d8_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l132_c18_3dfa_right := VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l140_l132_DUPLICATE_d44f_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l140_c28_706a_right := VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l140_l132_DUPLICATE_d44f_return_output;
     VAR_color_MUX_uxn_device_h_l62_c3_6024_iftrue := VAR_CAST_TO_uint4_t_uxn_device_h_l64_c12_1cdb_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l172_c4_ae83_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l175_c23_b16e_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l198_c4_f395_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l201_c23_a757_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c7_ba7b_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l61_l100_l170_l56_l211_l95_l150_l89_l124_l84_l119_l155_l204_l77_l112_l72_l107_l184_DUPLICATE_75d5_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_5fb4_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l61_l100_l170_l56_l211_l95_l150_l89_l124_l84_l119_l155_l204_l77_l112_l72_l107_l184_DUPLICATE_75d5_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l112_c7_82e8_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l61_l100_l170_l56_l211_l95_l150_l89_l124_l84_l119_l155_l204_l77_l112_l72_l107_l184_DUPLICATE_75d5_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_4341_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l61_l100_l170_l56_l211_l95_l150_l89_l124_l84_l119_l155_l204_l77_l112_l72_l107_l184_DUPLICATE_75d5_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_3d44_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l61_l100_l170_l56_l211_l95_l150_l89_l124_l84_l119_l155_l204_l77_l112_l72_l107_l184_DUPLICATE_75d5_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l150_c3_5fc1_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l61_l100_l170_l56_l211_l95_l150_l89_l124_l84_l119_l155_l204_l77_l112_l72_l107_l184_DUPLICATE_75d5_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l155_c4_93e4_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l61_l100_l170_l56_l211_l95_l150_l89_l124_l84_l119_l155_l204_l77_l112_l72_l107_l184_DUPLICATE_75d5_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l170_c7_b03c_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l61_l100_l170_l56_l211_l95_l150_l89_l124_l84_l119_l155_l204_l77_l112_l72_l107_l184_DUPLICATE_75d5_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l184_c7_c45b_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l61_l100_l170_l56_l211_l95_l150_l89_l124_l84_l119_l155_l204_l77_l112_l72_l107_l184_DUPLICATE_75d5_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l204_c3_197f_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l61_l100_l170_l56_l211_l95_l150_l89_l124_l84_l119_l155_l204_l77_l112_l72_l107_l184_DUPLICATE_75d5_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l211_c3_8d0f_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l61_l100_l170_l56_l211_l95_l150_l89_l124_l84_l119_l155_l204_l77_l112_l72_l107_l184_DUPLICATE_75d5_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l56_c7_f9d9_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l61_l100_l170_l56_l211_l95_l150_l89_l124_l84_l119_l155_l204_l77_l112_l72_l107_l184_DUPLICATE_75d5_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l61_c7_5d0a_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l61_l100_l170_l56_l211_l95_l150_l89_l124_l84_l119_l155_l204_l77_l112_l72_l107_l184_DUPLICATE_75d5_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_470e_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l61_l100_l170_l56_l211_l95_l150_l89_l124_l84_l119_l155_l204_l77_l112_l72_l107_l184_DUPLICATE_75d5_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l77_c7_76e7_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l61_l100_l170_l56_l211_l95_l150_l89_l124_l84_l119_l155_l204_l77_l112_l72_l107_l184_DUPLICATE_75d5_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l84_c7_0b55_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l61_l100_l170_l56_l211_l95_l150_l89_l124_l84_l119_l155_l204_l77_l112_l72_l107_l184_DUPLICATE_75d5_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_6231_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l61_l100_l170_l56_l211_l95_l150_l89_l124_l84_l119_l155_l204_l77_l112_l72_l107_l184_DUPLICATE_75d5_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l95_c7_f81e_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l61_l100_l170_l56_l211_l95_l150_l89_l124_l84_l119_l155_l204_l77_l112_l72_l107_l184_DUPLICATE_75d5_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l100_c7_ba7b_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l197_l211_l150_l198_l210_l124_l118_l171_l112_l107_l100_l172_l95_l89_l84_l185_l77_l72_l61_l156_l186_l56_l155_DUPLICATE_861b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l107_c7_5fb4_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l197_l211_l150_l198_l210_l124_l118_l171_l112_l107_l100_l172_l95_l89_l84_l185_l77_l72_l61_l156_l186_l56_l155_DUPLICATE_861b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l112_c7_82e8_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l197_l211_l150_l198_l210_l124_l118_l171_l112_l107_l100_l172_l95_l89_l84_l185_l77_l72_l61_l156_l186_l56_l155_DUPLICATE_861b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l118_c7_d5ea_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l197_l211_l150_l198_l210_l124_l118_l171_l112_l107_l100_l172_l95_l89_l84_l185_l77_l72_l61_l156_l186_l56_l155_DUPLICATE_861b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l124_c7_3d44_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l197_l211_l150_l198_l210_l124_l118_l171_l112_l107_l100_l172_l95_l89_l84_l185_l77_l72_l61_l156_l186_l56_l155_DUPLICATE_861b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l150_c3_5fc1_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l197_l211_l150_l198_l210_l124_l118_l171_l112_l107_l100_l172_l95_l89_l84_l185_l77_l72_l61_l156_l186_l56_l155_DUPLICATE_861b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l155_c4_93e4_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l197_l211_l150_l198_l210_l124_l118_l171_l112_l107_l100_l172_l95_l89_l84_l185_l77_l72_l61_l156_l186_l56_l155_DUPLICATE_861b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l156_c5_f4d5_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l197_l211_l150_l198_l210_l124_l118_l171_l112_l107_l100_l172_l95_l89_l84_l185_l77_l72_l61_l156_l186_l56_l155_DUPLICATE_861b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l171_c3_99f3_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l197_l211_l150_l198_l210_l124_l118_l171_l112_l107_l100_l172_l95_l89_l84_l185_l77_l72_l61_l156_l186_l56_l155_DUPLICATE_861b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l172_c4_ae83_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l197_l211_l150_l198_l210_l124_l118_l171_l112_l107_l100_l172_l95_l89_l84_l185_l77_l72_l61_l156_l186_l56_l155_DUPLICATE_861b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l185_c3_b7f1_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l197_l211_l150_l198_l210_l124_l118_l171_l112_l107_l100_l172_l95_l89_l84_l185_l77_l72_l61_l156_l186_l56_l155_DUPLICATE_861b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l186_c4_f747_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l197_l211_l150_l198_l210_l124_l118_l171_l112_l107_l100_l172_l95_l89_l84_l185_l77_l72_l61_l156_l186_l56_l155_DUPLICATE_861b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c3_e13e_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l197_l211_l150_l198_l210_l124_l118_l171_l112_l107_l100_l172_l95_l89_l84_l185_l77_l72_l61_l156_l186_l56_l155_DUPLICATE_861b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l198_c4_f395_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l197_l211_l150_l198_l210_l124_l118_l171_l112_l107_l100_l172_l95_l89_l84_l185_l77_l72_l61_l156_l186_l56_l155_DUPLICATE_861b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c7_72c7_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l197_l211_l150_l198_l210_l124_l118_l171_l112_l107_l100_l172_l95_l89_l84_l185_l77_l72_l61_l156_l186_l56_l155_DUPLICATE_861b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l211_c3_8d0f_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l197_l211_l150_l198_l210_l124_l118_l171_l112_l107_l100_l172_l95_l89_l84_l185_l77_l72_l61_l156_l186_l56_l155_DUPLICATE_861b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l56_c7_f9d9_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l197_l211_l150_l198_l210_l124_l118_l171_l112_l107_l100_l172_l95_l89_l84_l185_l77_l72_l61_l156_l186_l56_l155_DUPLICATE_861b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l61_c7_5d0a_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l197_l211_l150_l198_l210_l124_l118_l171_l112_l107_l100_l172_l95_l89_l84_l185_l77_l72_l61_l156_l186_l56_l155_DUPLICATE_861b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l72_c7_470e_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l197_l211_l150_l198_l210_l124_l118_l171_l112_l107_l100_l172_l95_l89_l84_l185_l77_l72_l61_l156_l186_l56_l155_DUPLICATE_861b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l77_c7_76e7_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l197_l211_l150_l198_l210_l124_l118_l171_l112_l107_l100_l172_l95_l89_l84_l185_l77_l72_l61_l156_l186_l56_l155_DUPLICATE_861b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l84_c7_0b55_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l197_l211_l150_l198_l210_l124_l118_l171_l112_l107_l100_l172_l95_l89_l84_l185_l77_l72_l61_l156_l186_l56_l155_DUPLICATE_861b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l89_c7_6231_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l197_l211_l150_l198_l210_l124_l118_l171_l112_l107_l100_l172_l95_l89_l84_l185_l77_l72_l61_l156_l186_l56_l155_DUPLICATE_861b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l95_c7_f81e_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l197_l211_l150_l198_l210_l124_l118_l171_l112_l107_l100_l172_l95_l89_l84_l185_l77_l72_l61_l156_l186_l56_l155_DUPLICATE_861b_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l100_c7_ba7b_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l61_l100_l56_l95_l149_l150_l89_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_b4f8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_5fb4_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l61_l100_l56_l95_l149_l150_l89_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_b4f8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l112_c7_82e8_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l61_l100_l56_l95_l149_l150_l89_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_b4f8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l118_c7_d5ea_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l61_l100_l56_l95_l149_l150_l89_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_b4f8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l125_c3_2150_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l61_l100_l56_l95_l149_l150_l89_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_b4f8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l149_c7_bfbe_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l61_l100_l56_l95_l149_l150_l89_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_b4f8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l150_c3_5fc1_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l61_l100_l56_l95_l149_l150_l89_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_b4f8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l56_c7_f9d9_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l61_l100_l56_l95_l149_l150_l89_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_b4f8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l61_c7_5d0a_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l61_l100_l56_l95_l149_l150_l89_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_b4f8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_470e_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l61_l100_l56_l95_l149_l150_l89_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_b4f8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l77_c7_76e7_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l61_l100_l56_l95_l149_l150_l89_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_b4f8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l84_c7_0b55_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l61_l100_l56_l95_l149_l150_l89_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_b4f8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_6231_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l61_l100_l56_l95_l149_l150_l89_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_b4f8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l95_c7_f81e_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l61_l100_l56_l95_l149_l150_l89_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_b4f8_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l100_c7_ba7b_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l61_l100_l56_l95_l42_l89_l124_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_9168_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l107_c7_5fb4_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l61_l100_l56_l95_l42_l89_l124_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_9168_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l112_c7_82e8_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l61_l100_l56_l95_l42_l89_l124_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_9168_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l118_c7_d5ea_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l61_l100_l56_l95_l42_l89_l124_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_9168_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l124_c7_3d44_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l61_l100_l56_l95_l42_l89_l124_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_9168_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l125_c3_2150_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l61_l100_l56_l95_l42_l89_l124_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_9168_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l42_c2_c27c_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l61_l100_l56_l95_l42_l89_l124_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_9168_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l56_c7_f9d9_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l61_l100_l56_l95_l42_l89_l124_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_9168_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l61_c7_5d0a_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l61_l100_l56_l95_l42_l89_l124_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_9168_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l72_c7_470e_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l61_l100_l56_l95_l42_l89_l124_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_9168_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l77_c7_76e7_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l61_l100_l56_l95_l42_l89_l124_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_9168_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l84_c7_0b55_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l61_l100_l56_l95_l42_l89_l124_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_9168_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l89_c7_6231_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l61_l100_l56_l95_l42_l89_l124_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_9168_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l95_c7_f81e_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l61_l100_l56_l95_l42_l89_l124_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_9168_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l100_c7_ba7b_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l61_l100_l56_l95_l149_l42_l150_l89_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_4175_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l107_c7_5fb4_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l61_l100_l56_l95_l149_l42_l150_l89_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_4175_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l112_c7_82e8_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l61_l100_l56_l95_l149_l42_l150_l89_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_4175_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l118_c7_d5ea_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l61_l100_l56_l95_l149_l42_l150_l89_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_4175_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l125_c3_2150_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l61_l100_l56_l95_l149_l42_l150_l89_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_4175_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l149_c7_bfbe_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l61_l100_l56_l95_l149_l42_l150_l89_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_4175_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l150_c3_5fc1_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l61_l100_l56_l95_l149_l42_l150_l89_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_4175_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l42_c2_c27c_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l61_l100_l56_l95_l149_l42_l150_l89_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_4175_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l56_c7_f9d9_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l61_l100_l56_l95_l149_l42_l150_l89_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_4175_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l61_c7_5d0a_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l61_l100_l56_l95_l149_l42_l150_l89_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_4175_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l72_c7_470e_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l61_l100_l56_l95_l149_l42_l150_l89_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_4175_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l77_c7_76e7_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l61_l100_l56_l95_l149_l42_l150_l89_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_4175_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l84_c7_0b55_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l61_l100_l56_l95_l149_l42_l150_l89_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_4175_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l89_c7_6231_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l61_l100_l56_l95_l149_l42_l150_l89_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_4175_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l95_c7_f81e_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l61_l100_l56_l95_l149_l42_l150_l89_l84_l118_l77_l112_l125_l72_l107_DUPLICATE_4175_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l101_c3_18ac_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l166_l211_l198_l108_l57_l210_l62_l90_l73_l171_l113_l172_l96_l185_l186_l78_l156_l119_l155_l49_l101_l144_l197_l85_DUPLICATE_f2ba_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_ef31_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l166_l211_l198_l108_l57_l210_l62_l90_l73_l171_l113_l172_l96_l185_l186_l78_l156_l119_l155_l49_l101_l144_l197_l85_DUPLICATE_f2ba_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l113_c3_c338_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l166_l211_l198_l108_l57_l210_l62_l90_l73_l171_l113_l172_l96_l185_l186_l78_l156_l119_l155_l49_l101_l144_l197_l85_DUPLICATE_f2ba_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_4341_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l166_l211_l198_l108_l57_l210_l62_l90_l73_l171_l113_l172_l96_l185_l186_l78_l156_l119_l155_l49_l101_l144_l197_l85_DUPLICATE_f2ba_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l144_c8_0544_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l166_l211_l198_l108_l57_l210_l62_l90_l73_l171_l113_l172_l96_l185_l186_l78_l156_l119_l155_l49_l101_l144_l197_l85_DUPLICATE_f2ba_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l155_c4_93e4_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l166_l211_l198_l108_l57_l210_l62_l90_l73_l171_l113_l172_l96_l185_l186_l78_l156_l119_l155_l49_l101_l144_l197_l85_DUPLICATE_f2ba_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l156_c5_f4d5_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l166_l211_l198_l108_l57_l210_l62_l90_l73_l171_l113_l172_l96_l185_l186_l78_l156_l119_l155_l49_l101_l144_l197_l85_DUPLICATE_f2ba_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l166_c8_942b_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l166_l211_l198_l108_l57_l210_l62_l90_l73_l171_l113_l172_l96_l185_l186_l78_l156_l119_l155_l49_l101_l144_l197_l85_DUPLICATE_f2ba_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l171_c3_99f3_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l166_l211_l198_l108_l57_l210_l62_l90_l73_l171_l113_l172_l96_l185_l186_l78_l156_l119_l155_l49_l101_l144_l197_l85_DUPLICATE_f2ba_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l172_c4_ae83_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l166_l211_l198_l108_l57_l210_l62_l90_l73_l171_l113_l172_l96_l185_l186_l78_l156_l119_l155_l49_l101_l144_l197_l85_DUPLICATE_f2ba_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l185_c3_b7f1_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l166_l211_l198_l108_l57_l210_l62_l90_l73_l171_l113_l172_l96_l185_l186_l78_l156_l119_l155_l49_l101_l144_l197_l85_DUPLICATE_f2ba_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l186_c4_f747_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l166_l211_l198_l108_l57_l210_l62_l90_l73_l171_l113_l172_l96_l185_l186_l78_l156_l119_l155_l49_l101_l144_l197_l85_DUPLICATE_f2ba_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l197_c3_e13e_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l166_l211_l198_l108_l57_l210_l62_l90_l73_l171_l113_l172_l96_l185_l186_l78_l156_l119_l155_l49_l101_l144_l197_l85_DUPLICATE_f2ba_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l198_c4_f395_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l166_l211_l198_l108_l57_l210_l62_l90_l73_l171_l113_l172_l96_l185_l186_l78_l156_l119_l155_l49_l101_l144_l197_l85_DUPLICATE_f2ba_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l210_c7_72c7_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l166_l211_l198_l108_l57_l210_l62_l90_l73_l171_l113_l172_l96_l185_l186_l78_l156_l119_l155_l49_l101_l144_l197_l85_DUPLICATE_f2ba_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l211_c3_8d0f_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l166_l211_l198_l108_l57_l210_l62_l90_l73_l171_l113_l172_l96_l185_l186_l78_l156_l119_l155_l49_l101_l144_l197_l85_DUPLICATE_f2ba_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l49_c3_de5f_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l166_l211_l198_l108_l57_l210_l62_l90_l73_l171_l113_l172_l96_l185_l186_l78_l156_l119_l155_l49_l101_l144_l197_l85_DUPLICATE_f2ba_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l57_c3_8f9c_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l166_l211_l198_l108_l57_l210_l62_l90_l73_l171_l113_l172_l96_l185_l186_l78_l156_l119_l155_l49_l101_l144_l197_l85_DUPLICATE_f2ba_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l62_c3_6024_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l166_l211_l198_l108_l57_l210_l62_l90_l73_l171_l113_l172_l96_l185_l186_l78_l156_l119_l155_l49_l101_l144_l197_l85_DUPLICATE_f2ba_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_d1e7_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l166_l211_l198_l108_l57_l210_l62_l90_l73_l171_l113_l172_l96_l185_l186_l78_l156_l119_l155_l49_l101_l144_l197_l85_DUPLICATE_f2ba_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l78_c3_a3e7_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l166_l211_l198_l108_l57_l210_l62_l90_l73_l171_l113_l172_l96_l185_l186_l78_l156_l119_l155_l49_l101_l144_l197_l85_DUPLICATE_f2ba_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l85_c3_de64_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l166_l211_l198_l108_l57_l210_l62_l90_l73_l171_l113_l172_l96_l185_l186_l78_l156_l119_l155_l49_l101_l144_l197_l85_DUPLICATE_f2ba_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_5121_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l166_l211_l198_l108_l57_l210_l62_l90_l73_l171_l113_l172_l96_l185_l186_l78_l156_l119_l155_l49_l101_l144_l197_l85_DUPLICATE_f2ba_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l96_c3_6c51_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l166_l211_l198_l108_l57_l210_l62_l90_l73_l171_l113_l172_l96_l185_l186_l78_l156_l119_l155_l49_l101_l144_l197_l85_DUPLICATE_f2ba_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l100_c7_ba7b_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l198_l150_l196_l171_l118_l112_l172_l107_l100_l95_l185_l89_l84_l77_l186_l72_l61_l56_l42_l197_l125_DUPLICATE_8478_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l107_c7_5fb4_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l198_l150_l196_l171_l118_l112_l172_l107_l100_l95_l185_l89_l84_l77_l186_l72_l61_l56_l42_l197_l125_DUPLICATE_8478_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l112_c7_82e8_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l198_l150_l196_l171_l118_l112_l172_l107_l100_l95_l185_l89_l84_l77_l186_l72_l61_l56_l42_l197_l125_DUPLICATE_8478_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l118_c7_d5ea_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l198_l150_l196_l171_l118_l112_l172_l107_l100_l95_l185_l89_l84_l77_l186_l72_l61_l56_l42_l197_l125_DUPLICATE_8478_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l125_c3_2150_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l198_l150_l196_l171_l118_l112_l172_l107_l100_l95_l185_l89_l84_l77_l186_l72_l61_l56_l42_l197_l125_DUPLICATE_8478_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l150_c3_5fc1_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l198_l150_l196_l171_l118_l112_l172_l107_l100_l95_l185_l89_l84_l77_l186_l72_l61_l56_l42_l197_l125_DUPLICATE_8478_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l171_c3_99f3_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l198_l150_l196_l171_l118_l112_l172_l107_l100_l95_l185_l89_l84_l77_l186_l72_l61_l56_l42_l197_l125_DUPLICATE_8478_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l172_c4_ae83_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l198_l150_l196_l171_l118_l112_l172_l107_l100_l95_l185_l89_l84_l77_l186_l72_l61_l56_l42_l197_l125_DUPLICATE_8478_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l185_c3_b7f1_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l198_l150_l196_l171_l118_l112_l172_l107_l100_l95_l185_l89_l84_l77_l186_l72_l61_l56_l42_l197_l125_DUPLICATE_8478_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l186_c4_f747_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l198_l150_l196_l171_l118_l112_l172_l107_l100_l95_l185_l89_l84_l77_l186_l72_l61_l56_l42_l197_l125_DUPLICATE_8478_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l196_c7_1f25_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l198_l150_l196_l171_l118_l112_l172_l107_l100_l95_l185_l89_l84_l77_l186_l72_l61_l56_l42_l197_l125_DUPLICATE_8478_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l197_c3_e13e_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l198_l150_l196_l171_l118_l112_l172_l107_l100_l95_l185_l89_l84_l77_l186_l72_l61_l56_l42_l197_l125_DUPLICATE_8478_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l198_c4_f395_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l198_l150_l196_l171_l118_l112_l172_l107_l100_l95_l185_l89_l84_l77_l186_l72_l61_l56_l42_l197_l125_DUPLICATE_8478_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l42_c2_c27c_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l198_l150_l196_l171_l118_l112_l172_l107_l100_l95_l185_l89_l84_l77_l186_l72_l61_l56_l42_l197_l125_DUPLICATE_8478_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l56_c7_f9d9_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l198_l150_l196_l171_l118_l112_l172_l107_l100_l95_l185_l89_l84_l77_l186_l72_l61_l56_l42_l197_l125_DUPLICATE_8478_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l61_c7_5d0a_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l198_l150_l196_l171_l118_l112_l172_l107_l100_l95_l185_l89_l84_l77_l186_l72_l61_l56_l42_l197_l125_DUPLICATE_8478_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l72_c7_470e_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l198_l150_l196_l171_l118_l112_l172_l107_l100_l95_l185_l89_l84_l77_l186_l72_l61_l56_l42_l197_l125_DUPLICATE_8478_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l77_c7_76e7_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l198_l150_l196_l171_l118_l112_l172_l107_l100_l95_l185_l89_l84_l77_l186_l72_l61_l56_l42_l197_l125_DUPLICATE_8478_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l84_c7_0b55_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l198_l150_l196_l171_l118_l112_l172_l107_l100_l95_l185_l89_l84_l77_l186_l72_l61_l56_l42_l197_l125_DUPLICATE_8478_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l89_c7_6231_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l198_l150_l196_l171_l118_l112_l172_l107_l100_l95_l185_l89_l84_l77_l186_l72_l61_l56_l42_l197_l125_DUPLICATE_8478_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l95_c7_f81e_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l198_l150_l196_l171_l118_l112_l172_l107_l100_l95_l185_l89_l84_l77_l186_l72_l61_l56_l42_l197_l125_DUPLICATE_8478_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l186_c8_bb02_left := VAR_CONST_SR_1_uint8_t_uxn_device_h_l198_l186_DUPLICATE_bbf7_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l198_c8_a07b_left := VAR_CONST_SR_1_uint8_t_uxn_device_h_l198_l186_DUPLICATE_bbf7_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l134_c5_1182_right := VAR_MUX_uxn_device_h_l134_c19_0b0f_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l135_c5_4991_right := VAR_MUX_uxn_device_h_l135_c19_5967_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l57_c3_8f9c_iftrue := VAR_MUX_uxn_device_h_l58_c32_3abd_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l155_c4_93e4_cond := VAR_UNARY_OP_NOT_uxn_device_h_l155_c9_9342_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l155_c4_93e4_cond := VAR_UNARY_OP_NOT_uxn_device_h_l155_c9_9342_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l155_c4_93e4_cond := VAR_UNARY_OP_NOT_uxn_device_h_l155_c9_9342_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l155_c4_93e4_cond := VAR_UNARY_OP_NOT_uxn_device_h_l155_c9_9342_return_output;
     VAR_x_MUX_uxn_device_h_l155_c4_93e4_cond := VAR_UNARY_OP_NOT_uxn_device_h_l155_c9_9342_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l125_c3_2150_iffalse := VAR_auto_advance_MUX_uxn_device_h_l144_c8_0544_return_output;
     VAR_ctrl_MUX_uxn_device_h_l61_c7_5d0a_iftrue := VAR_ctrl_MUX_uxn_device_h_l62_c3_6024_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l125_c3_2150_iftrue := VAR_result_is_vram_write_MUX_uxn_device_h_l131_c4_1268_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l156_c5_f4d5_cond := VAR_MUX_uxn_device_h_l156_c5_f4d5_interm_cond;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l156_c5_f4d5_cond := VAR_MUX_uxn_device_h_l156_c5_f4d5_interm_cond;
     VAR_result_u8_value_MUX_uxn_device_h_l156_c5_f4d5_cond := VAR_MUX_uxn_device_h_l156_c5_f4d5_interm_cond;
     VAR_x_MUX_uxn_device_h_l156_c5_f4d5_cond := VAR_MUX_uxn_device_h_l156_c5_f4d5_interm_cond;
     VAR_result_device_ram_address_MUX_uxn_device_h_l172_c4_ae83_cond := VAR_MUX_uxn_device_h_l172_c4_ae83_interm_cond;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l172_c4_ae83_cond := VAR_MUX_uxn_device_h_l172_c4_ae83_interm_cond;
     VAR_result_u8_value_MUX_uxn_device_h_l172_c4_ae83_cond := VAR_MUX_uxn_device_h_l172_c4_ae83_interm_cond;
     VAR_CONST_SR_8_uxn_device_h_l160_c34_45ca_x := VAR_x_uxn_device_h_l157_c6_112d;
     VAR_x_MUX_uxn_device_h_l156_c5_f4d5_iftrue := VAR_x_uxn_device_h_l157_c6_112d;
     -- result_device_ram_address_MUX[uxn_device_h_l211_c3_8d0f] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l211_c3_8d0f_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l211_c3_8d0f_cond;
     result_device_ram_address_MUX_uxn_device_h_l211_c3_8d0f_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l211_c3_8d0f_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l211_c3_8d0f_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l211_c3_8d0f_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l211_c3_8d0f_return_output := result_device_ram_address_MUX_uxn_device_h_l211_c3_8d0f_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l132_c18_50dd] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l132_c18_50dd_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l132_c18_50dd_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l132_c18_50dd_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l132_c18_50dd_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l132_c18_50dd_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l132_c18_50dd_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l57_c3_8f9c] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l57_c3_8f9c_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l57_c3_8f9c_cond;
     result_device_ram_address_MUX_uxn_device_h_l57_c3_8f9c_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l57_c3_8f9c_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l57_c3_8f9c_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l57_c3_8f9c_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l57_c3_8f9c_return_output := result_device_ram_address_MUX_uxn_device_h_l57_c3_8f9c_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l204_c3_197f] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l204_c3_197f_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l204_c3_197f_cond;
     result_is_deo_done_MUX_uxn_device_h_l204_c3_197f_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l204_c3_197f_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l204_c3_197f_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l204_c3_197f_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l204_c3_197f_return_output := result_is_deo_done_MUX_uxn_device_h_l204_c3_197f_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l119_c3_4341] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l119_c3_4341_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_4341_cond;
     result_device_ram_address_MUX_uxn_device_h_l119_c3_4341_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_4341_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l119_c3_4341_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_4341_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_4341_return_output := result_device_ram_address_MUX_uxn_device_h_l119_c3_4341_return_output;

     -- BIN_OP_AND[uxn_device_h_l186_c8_bb02] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l186_c8_bb02_left <= VAR_BIN_OP_AND_uxn_device_h_l186_c8_bb02_left;
     BIN_OP_AND_uxn_device_h_l186_c8_bb02_right <= VAR_BIN_OP_AND_uxn_device_h_l186_c8_bb02_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l186_c8_bb02_return_output := BIN_OP_AND_uxn_device_h_l186_c8_bb02_return_output;

     -- ctrl_MUX[uxn_device_h_l61_c7_5d0a] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l61_c7_5d0a_cond <= VAR_ctrl_MUX_uxn_device_h_l61_c7_5d0a_cond;
     ctrl_MUX_uxn_device_h_l61_c7_5d0a_iftrue <= VAR_ctrl_MUX_uxn_device_h_l61_c7_5d0a_iftrue;
     ctrl_MUX_uxn_device_h_l61_c7_5d0a_iffalse <= VAR_ctrl_MUX_uxn_device_h_l61_c7_5d0a_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l61_c7_5d0a_return_output := ctrl_MUX_uxn_device_h_l61_c7_5d0a_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l101_c3_18ac] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l101_c3_18ac_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l101_c3_18ac_cond;
     result_device_ram_address_MUX_uxn_device_h_l101_c3_18ac_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l101_c3_18ac_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l101_c3_18ac_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l101_c3_18ac_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l101_c3_18ac_return_output := result_device_ram_address_MUX_uxn_device_h_l101_c3_18ac_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l73_c3_d1e7] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l73_c3_d1e7_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_d1e7_cond;
     result_device_ram_address_MUX_uxn_device_h_l73_c3_d1e7_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_d1e7_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l73_c3_d1e7_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_d1e7_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_d1e7_return_output := result_device_ram_address_MUX_uxn_device_h_l73_c3_d1e7_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l155_c4_93e4] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l155_c4_93e4_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l155_c4_93e4_cond;
     result_is_deo_done_MUX_uxn_device_h_l155_c4_93e4_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l155_c4_93e4_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l155_c4_93e4_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l155_c4_93e4_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l155_c4_93e4_return_output := result_is_deo_done_MUX_uxn_device_h_l155_c4_93e4_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l211_c3_8d0f] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l211_c3_8d0f_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l211_c3_8d0f_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l211_c3_8d0f_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l211_c3_8d0f_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l211_c3_8d0f_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l211_c3_8d0f_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l211_c3_8d0f_return_output := result_is_device_ram_write_MUX_uxn_device_h_l211_c3_8d0f_return_output;

     -- BIN_OP_OR[uxn_device_h_l205_c4_c8b7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l205_c4_c8b7_left <= VAR_BIN_OP_OR_uxn_device_h_l205_c4_c8b7_left;
     BIN_OP_OR_uxn_device_h_l205_c4_c8b7_right <= VAR_BIN_OP_OR_uxn_device_h_l205_c4_c8b7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l205_c4_c8b7_return_output := BIN_OP_OR_uxn_device_h_l205_c4_c8b7_return_output;

     -- color_MUX[uxn_device_h_l62_c3_6024] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l62_c3_6024_cond <= VAR_color_MUX_uxn_device_h_l62_c3_6024_cond;
     color_MUX_uxn_device_h_l62_c3_6024_iftrue <= VAR_color_MUX_uxn_device_h_l62_c3_6024_iftrue;
     color_MUX_uxn_device_h_l62_c3_6024_iffalse <= VAR_color_MUX_uxn_device_h_l62_c3_6024_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l62_c3_6024_return_output := color_MUX_uxn_device_h_l62_c3_6024_return_output;

     -- MUX[uxn_device_h_l44_c20_9375] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l44_c20_9375_cond <= VAR_MUX_uxn_device_h_l44_c20_9375_cond;
     MUX_uxn_device_h_l44_c20_9375_iftrue <= VAR_MUX_uxn_device_h_l44_c20_9375_iftrue;
     MUX_uxn_device_h_l44_c20_9375_iffalse <= VAR_MUX_uxn_device_h_l44_c20_9375_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l44_c20_9375_return_output := MUX_uxn_device_h_l44_c20_9375_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l166_c8_942b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l166_c8_942b_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l166_c8_942b_cond;
     result_device_ram_address_MUX_uxn_device_h_l166_c8_942b_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l166_c8_942b_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l166_c8_942b_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l166_c8_942b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l166_c8_942b_return_output := result_device_ram_address_MUX_uxn_device_h_l166_c8_942b_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l156_c5_f4d5] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l156_c5_f4d5_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l156_c5_f4d5_cond;
     result_device_ram_address_MUX_uxn_device_h_l156_c5_f4d5_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l156_c5_f4d5_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l156_c5_f4d5_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l156_c5_f4d5_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l156_c5_f4d5_return_output := result_device_ram_address_MUX_uxn_device_h_l156_c5_f4d5_return_output;

     -- MUX[uxn_device_h_l43_c19_f016] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l43_c19_f016_cond <= VAR_MUX_uxn_device_h_l43_c19_f016_cond;
     MUX_uxn_device_h_l43_c19_f016_iftrue <= VAR_MUX_uxn_device_h_l43_c19_f016_iftrue;
     MUX_uxn_device_h_l43_c19_f016_iffalse <= VAR_MUX_uxn_device_h_l43_c19_f016_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l43_c19_f016_return_output := MUX_uxn_device_h_l43_c19_f016_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l120_c27_9ccd] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l120_c27_9ccd_left <= VAR_BIN_OP_PLUS_uxn_device_h_l120_c27_9ccd_left;
     BIN_OP_PLUS_uxn_device_h_l120_c27_9ccd_right <= VAR_BIN_OP_PLUS_uxn_device_h_l120_c27_9ccd_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l120_c27_9ccd_return_output := BIN_OP_PLUS_uxn_device_h_l120_c27_9ccd_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l65_c16_d05a] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l65_c16_d05a_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_7_uxn_device_h_l65_c26_808b_return_output);

     -- result_device_ram_address_MUX[uxn_device_h_l90_c3_5121] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l90_c3_5121_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_5121_cond;
     result_device_ram_address_MUX_uxn_device_h_l90_c3_5121_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_5121_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l90_c3_5121_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_5121_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_5121_return_output := result_device_ram_address_MUX_uxn_device_h_l90_c3_5121_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l108_c3_ef31] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l108_c3_ef31_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_ef31_cond;
     result_device_ram_address_MUX_uxn_device_h_l108_c3_ef31_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_ef31_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l108_c3_ef31_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_ef31_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_ef31_return_output := result_device_ram_address_MUX_uxn_device_h_l108_c3_ef31_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l113_c3_c338] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l113_c3_c338_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l113_c3_c338_cond;
     result_device_ram_address_MUX_uxn_device_h_l113_c3_c338_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l113_c3_c338_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l113_c3_c338_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l113_c3_c338_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l113_c3_c338_return_output := result_device_ram_address_MUX_uxn_device_h_l113_c3_c338_return_output;

     -- BIN_OP_OR[uxn_device_h_l114_c4_7cc1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l114_c4_7cc1_left <= VAR_BIN_OP_OR_uxn_device_h_l114_c4_7cc1_left;
     BIN_OP_OR_uxn_device_h_l114_c4_7cc1_right <= VAR_BIN_OP_OR_uxn_device_h_l114_c4_7cc1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l114_c4_7cc1_return_output := BIN_OP_OR_uxn_device_h_l114_c4_7cc1_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l78_c3_a3e7] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l78_c3_a3e7_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l78_c3_a3e7_cond;
     result_device_ram_address_MUX_uxn_device_h_l78_c3_a3e7_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l78_c3_a3e7_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l78_c3_a3e7_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l78_c3_a3e7_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l78_c3_a3e7_return_output := result_device_ram_address_MUX_uxn_device_h_l78_c3_a3e7_return_output;

     -- BIN_OP_AND[uxn_device_h_l198_c8_a07b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l198_c8_a07b_left <= VAR_BIN_OP_AND_uxn_device_h_l198_c8_a07b_left;
     BIN_OP_AND_uxn_device_h_l198_c8_a07b_right <= VAR_BIN_OP_AND_uxn_device_h_l198_c8_a07b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l198_c8_a07b_return_output := BIN_OP_AND_uxn_device_h_l198_c8_a07b_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l189_c23_da63] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l189_c23_da63_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l189_c33_cd3a_return_output);

     -- CONST_SR_8[uxn_device_h_l160_c34_45ca] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l160_c34_45ca_x <= VAR_CONST_SR_8_uxn_device_h_l160_c34_45ca_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l160_c34_45ca_return_output := CONST_SR_8_uxn_device_h_l160_c34_45ca_return_output;

     -- result_u8_value_MUX[uxn_device_h_l172_c4_ae83] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l172_c4_ae83_cond <= VAR_result_u8_value_MUX_uxn_device_h_l172_c4_ae83_cond;
     result_u8_value_MUX_uxn_device_h_l172_c4_ae83_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l172_c4_ae83_iftrue;
     result_u8_value_MUX_uxn_device_h_l172_c4_ae83_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l172_c4_ae83_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l172_c4_ae83_return_output := result_u8_value_MUX_uxn_device_h_l172_c4_ae83_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l68_c13_5372] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l68_c13_5372_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_4_uxn_device_h_l68_c23_0abd_return_output);

     -- CAST_TO_uint8_t[uxn_device_h_l128_c22_4aa5] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l128_c22_4aa5_return_output := CAST_TO_uint8_t_uint4_t(
     VAR_BIN_OP_AND_uxn_device_h_l128_c32_8870_return_output);

     -- x_MUX[uxn_device_h_l156_c5_f4d5] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l156_c5_f4d5_cond <= VAR_x_MUX_uxn_device_h_l156_c5_f4d5_cond;
     x_MUX_uxn_device_h_l156_c5_f4d5_iftrue <= VAR_x_MUX_uxn_device_h_l156_c5_f4d5_iftrue;
     x_MUX_uxn_device_h_l156_c5_f4d5_iffalse <= VAR_x_MUX_uxn_device_h_l156_c5_f4d5_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l156_c5_f4d5_return_output := x_MUX_uxn_device_h_l156_c5_f4d5_return_output;

     -- auto_advance_MUX[uxn_device_h_l125_c3_2150] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l125_c3_2150_cond <= VAR_auto_advance_MUX_uxn_device_h_l125_c3_2150_cond;
     auto_advance_MUX_uxn_device_h_l125_c3_2150_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l125_c3_2150_iftrue;
     auto_advance_MUX_uxn_device_h_l125_c3_2150_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l125_c3_2150_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l125_c3_2150_return_output := auto_advance_MUX_uxn_device_h_l125_c3_2150_return_output;

     -- result_vram_address_MUX[uxn_device_h_l150_c3_5fc1] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l150_c3_5fc1_cond <= VAR_result_vram_address_MUX_uxn_device_h_l150_c3_5fc1_cond;
     result_vram_address_MUX_uxn_device_h_l150_c3_5fc1_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l150_c3_5fc1_iftrue;
     result_vram_address_MUX_uxn_device_h_l150_c3_5fc1_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l150_c3_5fc1_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l150_c3_5fc1_return_output := result_vram_address_MUX_uxn_device_h_l150_c3_5fc1_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l62_c3_6024] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l62_c3_6024_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l62_c3_6024_cond;
     result_device_ram_address_MUX_uxn_device_h_l62_c3_6024_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l62_c3_6024_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l62_c3_6024_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l62_c3_6024_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l62_c3_6024_return_output := result_device_ram_address_MUX_uxn_device_h_l62_c3_6024_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l156_c5_f4d5] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l156_c5_f4d5_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l156_c5_f4d5_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l156_c5_f4d5_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l156_c5_f4d5_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l156_c5_f4d5_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l156_c5_f4d5_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l156_c5_f4d5_return_output := result_is_device_ram_write_MUX_uxn_device_h_l156_c5_f4d5_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l125_c3_2150] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l125_c3_2150_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l125_c3_2150_cond;
     result_is_vram_write_MUX_uxn_device_h_l125_c3_2150_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l125_c3_2150_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l125_c3_2150_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l125_c3_2150_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l125_c3_2150_return_output := result_is_vram_write_MUX_uxn_device_h_l125_c3_2150_return_output;

     -- BIN_OP_OR[uxn_device_h_l91_c4_d5a5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l91_c4_d5a5_left <= VAR_BIN_OP_OR_uxn_device_h_l91_c4_d5a5_left;
     BIN_OP_OR_uxn_device_h_l91_c4_d5a5_right <= VAR_BIN_OP_OR_uxn_device_h_l91_c4_d5a5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l91_c4_d5a5_return_output := BIN_OP_OR_uxn_device_h_l91_c4_d5a5_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l85_c3_de64] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l85_c3_de64_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l85_c3_de64_cond;
     result_device_ram_address_MUX_uxn_device_h_l85_c3_de64_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l85_c3_de64_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l85_c3_de64_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l85_c3_de64_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l85_c3_de64_return_output := result_device_ram_address_MUX_uxn_device_h_l85_c3_de64_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l67_c13_a28f] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l67_c13_a28f_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_5_uxn_device_h_l67_c23_34f6_return_output);

     -- CONST_SL_8_uint16_t_uxn_device_h_l80_l181_l103_DUPLICATE_f0ca LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_device_h_l80_l181_l103_DUPLICATE_f0ca_x <= VAR_CONST_SL_8_uint16_t_uxn_device_h_l80_l181_l103_DUPLICATE_f0ca_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l80_l181_l103_DUPLICATE_f0ca_return_output := CONST_SL_8_uint16_t_uxn_device_h_l80_l181_l103_DUPLICATE_f0ca_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l172_c4_ae83] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l172_c4_ae83_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l172_c4_ae83_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l172_c4_ae83_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l172_c4_ae83_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l172_c4_ae83_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l172_c4_ae83_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l172_c4_ae83_return_output := result_is_device_ram_write_MUX_uxn_device_h_l172_c4_ae83_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l144_c8_0544] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l144_c8_0544_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l144_c8_0544_cond;
     result_device_ram_address_MUX_uxn_device_h_l144_c8_0544_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l144_c8_0544_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l144_c8_0544_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l144_c8_0544_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l144_c8_0544_return_output := result_device_ram_address_MUX_uxn_device_h_l144_c8_0544_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l125_c3_2150] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l125_c3_2150_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l125_c3_2150_cond;
     result_vram_write_layer_MUX_uxn_device_h_l125_c3_2150_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l125_c3_2150_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l125_c3_2150_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l125_c3_2150_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l125_c3_2150_return_output := result_vram_write_layer_MUX_uxn_device_h_l125_c3_2150_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l140_c28_6579] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l140_c28_6579_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l140_c28_6579_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l140_c28_6579_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l140_c28_6579_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l140_c28_6579_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l140_c28_6579_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l96_c3_6c51] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l96_c3_6c51_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l96_c3_6c51_cond;
     result_device_ram_address_MUX_uxn_device_h_l96_c3_6c51_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l96_c3_6c51_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l96_c3_6c51_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l96_c3_6c51_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l96_c3_6c51_return_output := result_device_ram_address_MUX_uxn_device_h_l96_c3_6c51_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l172_c4_ae83] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l172_c4_ae83_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l172_c4_ae83_cond;
     result_device_ram_address_MUX_uxn_device_h_l172_c4_ae83_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l172_c4_ae83_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l172_c4_ae83_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l172_c4_ae83_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l172_c4_ae83_return_output := result_device_ram_address_MUX_uxn_device_h_l172_c4_ae83_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l66_c12_8cca] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l66_c12_8cca_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_6_uxn_device_h_l66_c22_77cc_return_output);

     -- result_is_deo_done_MUX[uxn_device_h_l211_c3_8d0f] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l211_c3_8d0f_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l211_c3_8d0f_cond;
     result_is_deo_done_MUX_uxn_device_h_l211_c3_8d0f_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l211_c3_8d0f_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l211_c3_8d0f_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l211_c3_8d0f_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l211_c3_8d0f_return_output := result_is_deo_done_MUX_uxn_device_h_l211_c3_8d0f_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l150_c3_5fc1] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l150_c3_5fc1_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l150_c3_5fc1_cond;
     result_is_vram_write_MUX_uxn_device_h_l150_c3_5fc1_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l150_c3_5fc1_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l150_c3_5fc1_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l150_c3_5fc1_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l150_c3_5fc1_return_output := result_is_vram_write_MUX_uxn_device_h_l150_c3_5fc1_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_device_h_l186_c4_f747_interm_cond := resize(VAR_BIN_OP_AND_uxn_device_h_l186_c8_bb02_return_output, 1);
     VAR_MUX_uxn_device_h_l198_c4_f395_interm_cond := resize(VAR_BIN_OP_AND_uxn_device_h_l198_c8_a07b_return_output, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l132_c18_3dfa_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l132_c18_50dd_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l140_c28_706a_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l140_c28_6579_return_output;
     VAR_y_MUX_uxn_device_h_l113_c3_c338_iftrue := VAR_BIN_OP_OR_uxn_device_h_l114_c4_7cc1_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l204_c3_197f_iftrue := VAR_BIN_OP_OR_uxn_device_h_l205_c4_c8b7_return_output;
     VAR_x_MUX_uxn_device_h_l90_c3_5121_iftrue := VAR_BIN_OP_OR_uxn_device_h_l91_c4_d5a5_return_output;
     VAR_BIN_OP_GT_uxn_device_h_l120_c27_02fe_left := VAR_BIN_OP_PLUS_uxn_device_h_l120_c27_9ccd_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l62_c3_6024_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l65_c16_d05a_return_output;
     VAR_layer_MUX_uxn_device_h_l62_c3_6024_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l66_c12_8cca_return_output;
     VAR_flip_x_MUX_uxn_device_h_l62_c3_6024_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l67_c13_a28f_return_output;
     VAR_flip_y_MUX_uxn_device_h_l62_c3_6024_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l68_c13_5372_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l125_c3_2150_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l128_c22_4aa5_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l186_c4_f747_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l189_c23_da63_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l178_c3_85d0_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l80_l181_l103_DUPLICATE_f0ca_return_output;
     VAR_x_MUX_uxn_device_h_l78_c3_a3e7_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l80_l181_l103_DUPLICATE_f0ca_return_output;
     VAR_y_MUX_uxn_device_h_l101_c3_18ac_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l80_l181_l103_DUPLICATE_f0ca_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l45_c21_23f8_left := VAR_MUX_uxn_device_h_l43_c19_f016_return_output;
     VAR_MUX_uxn_device_h_l50_c32_ff36_cond := VAR_MUX_uxn_device_h_l43_c19_f016_return_output;
     VAR_is_pixel_port_MUX_uxn_device_h_l42_c2_c27c_iftrue := VAR_MUX_uxn_device_h_l43_c19_f016_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l45_c21_23f8_right := VAR_MUX_uxn_device_h_l44_c20_9375_return_output;
     VAR_is_sprite_port_MUX_uxn_device_h_l42_c2_c27c_iftrue := VAR_MUX_uxn_device_h_l44_c20_9375_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l124_c7_3d44_iftrue := VAR_auto_advance_MUX_uxn_device_h_l125_c3_2150_return_output;
     VAR_color_MUX_uxn_device_h_l61_c7_5d0a_iftrue := VAR_color_MUX_uxn_device_h_l62_c3_6024_return_output;
     VAR_ctrl_MUX_uxn_device_h_l56_c7_f9d9_iffalse := VAR_ctrl_MUX_uxn_device_h_l61_c7_5d0a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c7_ba7b_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l101_c3_18ac_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_5fb4_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_ef31_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l112_c7_82e8_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l113_c3_c338_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l118_c7_d5ea_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l119_c3_4341_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_2150_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l144_c8_0544_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l155_c4_93e4_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l156_c5_f4d5_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l150_c3_5fc1_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l166_c8_942b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l171_c3_99f3_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l172_c4_ae83_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l210_c7_72c7_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l211_c3_8d0f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l56_c7_f9d9_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l57_c3_8f9c_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l61_c7_5d0a_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l62_c3_6024_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_470e_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_d1e7_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l77_c7_76e7_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l78_c3_a3e7_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l84_c7_0b55_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l85_c3_de64_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_6231_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_5121_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l95_c7_f81e_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l96_c3_6c51_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l150_c3_5fc1_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l155_c4_93e4_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l196_c7_1f25_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l204_c3_197f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l210_c7_72c7_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l211_c3_8d0f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l155_c4_93e4_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l156_c5_f4d5_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l171_c3_99f3_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l172_c4_ae83_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c7_72c7_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l211_c3_8d0f_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_3d44_iftrue := VAR_result_is_vram_write_MUX_uxn_device_h_l125_c3_2150_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l149_c7_bfbe_iftrue := VAR_result_is_vram_write_MUX_uxn_device_h_l150_c3_5fc1_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l171_c3_99f3_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l172_c4_ae83_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l149_c7_bfbe_iftrue := VAR_result_vram_address_MUX_uxn_device_h_l150_c3_5fc1_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l124_c7_3d44_iftrue := VAR_result_vram_write_layer_MUX_uxn_device_h_l125_c3_2150_return_output;
     VAR_x_MUX_uxn_device_h_l155_c4_93e4_iftrue := VAR_x_MUX_uxn_device_h_l156_c5_f4d5_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l186_c4_f747_cond := VAR_MUX_uxn_device_h_l186_c4_f747_interm_cond;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l186_c4_f747_cond := VAR_MUX_uxn_device_h_l186_c4_f747_interm_cond;
     VAR_result_u8_value_MUX_uxn_device_h_l186_c4_f747_cond := VAR_MUX_uxn_device_h_l186_c4_f747_interm_cond;
     VAR_result_device_ram_address_MUX_uxn_device_h_l198_c4_f395_cond := VAR_MUX_uxn_device_h_l198_c4_f395_interm_cond;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l198_c4_f395_cond := VAR_MUX_uxn_device_h_l198_c4_f395_interm_cond;
     VAR_result_u8_value_MUX_uxn_device_h_l198_c4_f395_cond := VAR_MUX_uxn_device_h_l198_c4_f395_interm_cond;
     -- result_is_deo_done_MUX[uxn_device_h_l150_c3_5fc1] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l150_c3_5fc1_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l150_c3_5fc1_cond;
     result_is_deo_done_MUX_uxn_device_h_l150_c3_5fc1_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l150_c3_5fc1_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l150_c3_5fc1_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l150_c3_5fc1_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l150_c3_5fc1_return_output := result_is_deo_done_MUX_uxn_device_h_l150_c3_5fc1_return_output;

     -- result_vram_address_MUX[uxn_device_h_l149_c7_bfbe] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l149_c7_bfbe_cond <= VAR_result_vram_address_MUX_uxn_device_h_l149_c7_bfbe_cond;
     result_vram_address_MUX_uxn_device_h_l149_c7_bfbe_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l149_c7_bfbe_iftrue;
     result_vram_address_MUX_uxn_device_h_l149_c7_bfbe_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l149_c7_bfbe_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l149_c7_bfbe_return_output := result_vram_address_MUX_uxn_device_h_l149_c7_bfbe_return_output;

     -- auto_advance_MUX[uxn_device_h_l124_c7_3d44] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l124_c7_3d44_cond <= VAR_auto_advance_MUX_uxn_device_h_l124_c7_3d44_cond;
     auto_advance_MUX_uxn_device_h_l124_c7_3d44_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l124_c7_3d44_iftrue;
     auto_advance_MUX_uxn_device_h_l124_c7_3d44_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l124_c7_3d44_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l124_c7_3d44_return_output := auto_advance_MUX_uxn_device_h_l124_c7_3d44_return_output;

     -- MUX[uxn_device_h_l50_c32_ff36] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l50_c32_ff36_cond <= VAR_MUX_uxn_device_h_l50_c32_ff36_cond;
     MUX_uxn_device_h_l50_c32_ff36_iftrue <= VAR_MUX_uxn_device_h_l50_c32_ff36_iftrue;
     MUX_uxn_device_h_l50_c32_ff36_iffalse <= VAR_MUX_uxn_device_h_l50_c32_ff36_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l50_c32_ff36_return_output := MUX_uxn_device_h_l50_c32_ff36_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l198_c4_f395] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l198_c4_f395_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l198_c4_f395_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l198_c4_f395_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l198_c4_f395_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l198_c4_f395_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l198_c4_f395_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l198_c4_f395_return_output := result_is_device_ram_write_MUX_uxn_device_h_l198_c4_f395_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l171_c3_99f3] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l171_c3_99f3_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l171_c3_99f3_cond;
     result_device_ram_address_MUX_uxn_device_h_l171_c3_99f3_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l171_c3_99f3_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l171_c3_99f3_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l171_c3_99f3_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l171_c3_99f3_return_output := result_device_ram_address_MUX_uxn_device_h_l171_c3_99f3_return_output;

     -- result_u8_value_MUX[uxn_device_h_l186_c4_f747] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l186_c4_f747_cond <= VAR_result_u8_value_MUX_uxn_device_h_l186_c4_f747_cond;
     result_u8_value_MUX_uxn_device_h_l186_c4_f747_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l186_c4_f747_iftrue;
     result_u8_value_MUX_uxn_device_h_l186_c4_f747_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l186_c4_f747_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l186_c4_f747_return_output := result_u8_value_MUX_uxn_device_h_l186_c4_f747_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l186_c4_f747] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l186_c4_f747_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l186_c4_f747_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l186_c4_f747_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l186_c4_f747_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l186_c4_f747_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l186_c4_f747_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l186_c4_f747_return_output := result_is_device_ram_write_MUX_uxn_device_h_l186_c4_f747_return_output;

     -- ram_addr_MUX[uxn_device_h_l204_c3_197f] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l204_c3_197f_cond <= VAR_ram_addr_MUX_uxn_device_h_l204_c3_197f_cond;
     ram_addr_MUX_uxn_device_h_l204_c3_197f_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l204_c3_197f_iftrue;
     ram_addr_MUX_uxn_device_h_l204_c3_197f_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l204_c3_197f_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l204_c3_197f_return_output := ram_addr_MUX_uxn_device_h_l204_c3_197f_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l140_c28_706a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l140_c28_706a_left <= VAR_BIN_OP_PLUS_uxn_device_h_l140_c28_706a_left;
     BIN_OP_PLUS_uxn_device_h_l140_c28_706a_right <= VAR_BIN_OP_PLUS_uxn_device_h_l140_c28_706a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l140_c28_706a_return_output := BIN_OP_PLUS_uxn_device_h_l140_c28_706a_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l124_c7_3d44] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l124_c7_3d44_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l124_c7_3d44_cond;
     result_vram_write_layer_MUX_uxn_device_h_l124_c7_3d44_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l124_c7_3d44_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l124_c7_3d44_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l124_c7_3d44_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l124_c7_3d44_return_output := result_vram_write_layer_MUX_uxn_device_h_l124_c7_3d44_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l62_c3_6024] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l62_c3_6024_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l62_c3_6024_cond;
     ctrl_mode_MUX_uxn_device_h_l62_c3_6024_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l62_c3_6024_iftrue;
     ctrl_mode_MUX_uxn_device_h_l62_c3_6024_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l62_c3_6024_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l62_c3_6024_return_output := ctrl_mode_MUX_uxn_device_h_l62_c3_6024_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l210_c7_72c7] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l210_c7_72c7_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l210_c7_72c7_cond;
     result_is_deo_done_MUX_uxn_device_h_l210_c7_72c7_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l210_c7_72c7_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l210_c7_72c7_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l210_c7_72c7_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l210_c7_72c7_return_output := result_is_deo_done_MUX_uxn_device_h_l210_c7_72c7_return_output;

     -- y_MUX[uxn_device_h_l113_c3_c338] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l113_c3_c338_cond <= VAR_y_MUX_uxn_device_h_l113_c3_c338_cond;
     y_MUX_uxn_device_h_l113_c3_c338_iftrue <= VAR_y_MUX_uxn_device_h_l113_c3_c338_iftrue;
     y_MUX_uxn_device_h_l113_c3_c338_iffalse <= VAR_y_MUX_uxn_device_h_l113_c3_c338_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l113_c3_c338_return_output := y_MUX_uxn_device_h_l113_c3_c338_return_output;

     -- x_MUX[uxn_device_h_l90_c3_5121] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l90_c3_5121_cond <= VAR_x_MUX_uxn_device_h_l90_c3_5121_cond;
     x_MUX_uxn_device_h_l90_c3_5121_iftrue <= VAR_x_MUX_uxn_device_h_l90_c3_5121_iftrue;
     x_MUX_uxn_device_h_l90_c3_5121_iffalse <= VAR_x_MUX_uxn_device_h_l90_c3_5121_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l90_c3_5121_return_output := x_MUX_uxn_device_h_l90_c3_5121_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l132_c18_3dfa] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l132_c18_3dfa_left <= VAR_BIN_OP_PLUS_uxn_device_h_l132_c18_3dfa_left;
     BIN_OP_PLUS_uxn_device_h_l132_c18_3dfa_right <= VAR_BIN_OP_PLUS_uxn_device_h_l132_c18_3dfa_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l132_c18_3dfa_return_output := BIN_OP_PLUS_uxn_device_h_l132_c18_3dfa_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l155_c4_93e4] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l155_c4_93e4_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l155_c4_93e4_cond;
     result_device_ram_address_MUX_uxn_device_h_l155_c4_93e4_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l155_c4_93e4_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l155_c4_93e4_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l155_c4_93e4_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l155_c4_93e4_return_output := result_device_ram_address_MUX_uxn_device_h_l155_c4_93e4_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l186_c4_f747] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l186_c4_f747_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l186_c4_f747_cond;
     result_device_ram_address_MUX_uxn_device_h_l186_c4_f747_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l186_c4_f747_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l186_c4_f747_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l186_c4_f747_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l186_c4_f747_return_output := result_device_ram_address_MUX_uxn_device_h_l186_c4_f747_return_output;

     -- result_u8_value_MUX[uxn_device_h_l171_c3_99f3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l171_c3_99f3_cond <= VAR_result_u8_value_MUX_uxn_device_h_l171_c3_99f3_cond;
     result_u8_value_MUX_uxn_device_h_l171_c3_99f3_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l171_c3_99f3_iftrue;
     result_u8_value_MUX_uxn_device_h_l171_c3_99f3_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l171_c3_99f3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l171_c3_99f3_return_output := result_u8_value_MUX_uxn_device_h_l171_c3_99f3_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l171_c3_99f3] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l171_c3_99f3_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l171_c3_99f3_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l171_c3_99f3_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l171_c3_99f3_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l171_c3_99f3_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l171_c3_99f3_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l171_c3_99f3_return_output := result_is_device_ram_write_MUX_uxn_device_h_l171_c3_99f3_return_output;

     -- is_pixel_port_MUX[uxn_device_h_l42_c2_c27c] LATENCY=0
     -- Inputs
     is_pixel_port_MUX_uxn_device_h_l42_c2_c27c_cond <= VAR_is_pixel_port_MUX_uxn_device_h_l42_c2_c27c_cond;
     is_pixel_port_MUX_uxn_device_h_l42_c2_c27c_iftrue <= VAR_is_pixel_port_MUX_uxn_device_h_l42_c2_c27c_iftrue;
     is_pixel_port_MUX_uxn_device_h_l42_c2_c27c_iffalse <= VAR_is_pixel_port_MUX_uxn_device_h_l42_c2_c27c_iffalse;
     -- Outputs
     VAR_is_pixel_port_MUX_uxn_device_h_l42_c2_c27c_return_output := is_pixel_port_MUX_uxn_device_h_l42_c2_c27c_return_output;

     -- color_MUX[uxn_device_h_l61_c7_5d0a] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l61_c7_5d0a_cond <= VAR_color_MUX_uxn_device_h_l61_c7_5d0a_cond;
     color_MUX_uxn_device_h_l61_c7_5d0a_iftrue <= VAR_color_MUX_uxn_device_h_l61_c7_5d0a_iftrue;
     color_MUX_uxn_device_h_l61_c7_5d0a_iffalse <= VAR_color_MUX_uxn_device_h_l61_c7_5d0a_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l61_c7_5d0a_return_output := color_MUX_uxn_device_h_l61_c7_5d0a_return_output;

     -- BIN_OP_GT[uxn_device_h_l120_c27_02fe] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_device_h_l120_c27_02fe_left <= VAR_BIN_OP_GT_uxn_device_h_l120_c27_02fe_left;
     BIN_OP_GT_uxn_device_h_l120_c27_02fe_right <= VAR_BIN_OP_GT_uxn_device_h_l120_c27_02fe_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_device_h_l120_c27_02fe_return_output := BIN_OP_GT_uxn_device_h_l120_c27_02fe_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l125_c3_2150] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l125_c3_2150_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_2150_cond;
     result_device_ram_address_MUX_uxn_device_h_l125_c3_2150_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_2150_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l125_c3_2150_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_2150_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_2150_return_output := result_device_ram_address_MUX_uxn_device_h_l125_c3_2150_return_output;

     -- result_u8_value_MUX[uxn_device_h_l125_c3_2150] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l125_c3_2150_cond <= VAR_result_u8_value_MUX_uxn_device_h_l125_c3_2150_cond;
     result_u8_value_MUX_uxn_device_h_l125_c3_2150_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l125_c3_2150_iftrue;
     result_u8_value_MUX_uxn_device_h_l125_c3_2150_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l125_c3_2150_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l125_c3_2150_return_output := result_u8_value_MUX_uxn_device_h_l125_c3_2150_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l160_c24_4d1c] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l160_c24_4d1c_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l160_c34_45ca_return_output);

     -- flip_x_MUX[uxn_device_h_l62_c3_6024] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l62_c3_6024_cond <= VAR_flip_x_MUX_uxn_device_h_l62_c3_6024_cond;
     flip_x_MUX_uxn_device_h_l62_c3_6024_iftrue <= VAR_flip_x_MUX_uxn_device_h_l62_c3_6024_iftrue;
     flip_x_MUX_uxn_device_h_l62_c3_6024_iffalse <= VAR_flip_x_MUX_uxn_device_h_l62_c3_6024_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l62_c3_6024_return_output := flip_x_MUX_uxn_device_h_l62_c3_6024_return_output;

     -- x_MUX[uxn_device_h_l78_c3_a3e7] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l78_c3_a3e7_cond <= VAR_x_MUX_uxn_device_h_l78_c3_a3e7_cond;
     x_MUX_uxn_device_h_l78_c3_a3e7_iftrue <= VAR_x_MUX_uxn_device_h_l78_c3_a3e7_iftrue;
     x_MUX_uxn_device_h_l78_c3_a3e7_iffalse <= VAR_x_MUX_uxn_device_h_l78_c3_a3e7_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l78_c3_a3e7_return_output := x_MUX_uxn_device_h_l78_c3_a3e7_return_output;

     -- is_sprite_port_MUX[uxn_device_h_l42_c2_c27c] LATENCY=0
     -- Inputs
     is_sprite_port_MUX_uxn_device_h_l42_c2_c27c_cond <= VAR_is_sprite_port_MUX_uxn_device_h_l42_c2_c27c_cond;
     is_sprite_port_MUX_uxn_device_h_l42_c2_c27c_iftrue <= VAR_is_sprite_port_MUX_uxn_device_h_l42_c2_c27c_iftrue;
     is_sprite_port_MUX_uxn_device_h_l42_c2_c27c_iffalse <= VAR_is_sprite_port_MUX_uxn_device_h_l42_c2_c27c_iffalse;
     -- Outputs
     VAR_is_sprite_port_MUX_uxn_device_h_l42_c2_c27c_return_output := is_sprite_port_MUX_uxn_device_h_l42_c2_c27c_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l210_c7_72c7] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l210_c7_72c7_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l210_c7_72c7_cond;
     result_device_ram_address_MUX_uxn_device_h_l210_c7_72c7_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l210_c7_72c7_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l210_c7_72c7_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l210_c7_72c7_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l210_c7_72c7_return_output := result_device_ram_address_MUX_uxn_device_h_l210_c7_72c7_return_output;

     -- ram_addr_MUX[uxn_device_h_l178_c3_85d0] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l178_c3_85d0_cond <= VAR_ram_addr_MUX_uxn_device_h_l178_c3_85d0_cond;
     ram_addr_MUX_uxn_device_h_l178_c3_85d0_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l178_c3_85d0_iftrue;
     ram_addr_MUX_uxn_device_h_l178_c3_85d0_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l178_c3_85d0_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l178_c3_85d0_return_output := ram_addr_MUX_uxn_device_h_l178_c3_85d0_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l198_c4_f395] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l198_c4_f395_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l198_c4_f395_cond;
     result_device_ram_address_MUX_uxn_device_h_l198_c4_f395_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l198_c4_f395_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l198_c4_f395_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l198_c4_f395_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l198_c4_f395_return_output := result_device_ram_address_MUX_uxn_device_h_l198_c4_f395_return_output;

     -- ctrl_MUX[uxn_device_h_l56_c7_f9d9] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l56_c7_f9d9_cond <= VAR_ctrl_MUX_uxn_device_h_l56_c7_f9d9_cond;
     ctrl_MUX_uxn_device_h_l56_c7_f9d9_iftrue <= VAR_ctrl_MUX_uxn_device_h_l56_c7_f9d9_iftrue;
     ctrl_MUX_uxn_device_h_l56_c7_f9d9_iffalse <= VAR_ctrl_MUX_uxn_device_h_l56_c7_f9d9_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l56_c7_f9d9_return_output := ctrl_MUX_uxn_device_h_l56_c7_f9d9_return_output;

     -- result_u8_value_MUX[uxn_device_h_l198_c4_f395] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l198_c4_f395_cond <= VAR_result_u8_value_MUX_uxn_device_h_l198_c4_f395_cond;
     result_u8_value_MUX_uxn_device_h_l198_c4_f395_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l198_c4_f395_iftrue;
     result_u8_value_MUX_uxn_device_h_l198_c4_f395_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l198_c4_f395_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l198_c4_f395_return_output := result_u8_value_MUX_uxn_device_h_l198_c4_f395_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l149_c7_bfbe] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l149_c7_bfbe_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l149_c7_bfbe_cond;
     result_is_vram_write_MUX_uxn_device_h_l149_c7_bfbe_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l149_c7_bfbe_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l149_c7_bfbe_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l149_c7_bfbe_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l149_c7_bfbe_return_output := result_is_vram_write_MUX_uxn_device_h_l149_c7_bfbe_return_output;

     -- layer_MUX[uxn_device_h_l62_c3_6024] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l62_c3_6024_cond <= VAR_layer_MUX_uxn_device_h_l62_c3_6024_cond;
     layer_MUX_uxn_device_h_l62_c3_6024_iftrue <= VAR_layer_MUX_uxn_device_h_l62_c3_6024_iftrue;
     layer_MUX_uxn_device_h_l62_c3_6024_iffalse <= VAR_layer_MUX_uxn_device_h_l62_c3_6024_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l62_c3_6024_return_output := layer_MUX_uxn_device_h_l62_c3_6024_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l210_c7_72c7] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l210_c7_72c7_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c7_72c7_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l210_c7_72c7_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c7_72c7_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l210_c7_72c7_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c7_72c7_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c7_72c7_return_output := result_is_device_ram_write_MUX_uxn_device_h_l210_c7_72c7_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l155_c4_93e4] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l155_c4_93e4_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l155_c4_93e4_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l155_c4_93e4_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l155_c4_93e4_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l155_c4_93e4_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l155_c4_93e4_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l155_c4_93e4_return_output := result_is_device_ram_write_MUX_uxn_device_h_l155_c4_93e4_return_output;

     -- y_MUX[uxn_device_h_l101_c3_18ac] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l101_c3_18ac_cond <= VAR_y_MUX_uxn_device_h_l101_c3_18ac_cond;
     y_MUX_uxn_device_h_l101_c3_18ac_iftrue <= VAR_y_MUX_uxn_device_h_l101_c3_18ac_iftrue;
     y_MUX_uxn_device_h_l101_c3_18ac_iffalse <= VAR_y_MUX_uxn_device_h_l101_c3_18ac_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l101_c3_18ac_return_output := y_MUX_uxn_device_h_l101_c3_18ac_return_output;

     -- BIN_OP_OR[uxn_device_h_l45_c21_23f8] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l45_c21_23f8_left <= VAR_BIN_OP_OR_uxn_device_h_l45_c21_23f8_left;
     BIN_OP_OR_uxn_device_h_l45_c21_23f8_right <= VAR_BIN_OP_OR_uxn_device_h_l45_c21_23f8_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l45_c21_23f8_return_output := BIN_OP_OR_uxn_device_h_l45_c21_23f8_return_output;

     -- x_MUX[uxn_device_h_l155_c4_93e4] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l155_c4_93e4_cond <= VAR_x_MUX_uxn_device_h_l155_c4_93e4_cond;
     x_MUX_uxn_device_h_l155_c4_93e4_iftrue <= VAR_x_MUX_uxn_device_h_l155_c4_93e4_iftrue;
     x_MUX_uxn_device_h_l155_c4_93e4_iffalse <= VAR_x_MUX_uxn_device_h_l155_c4_93e4_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l155_c4_93e4_return_output := x_MUX_uxn_device_h_l155_c4_93e4_return_output;

     -- flip_y_MUX[uxn_device_h_l62_c3_6024] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l62_c3_6024_cond <= VAR_flip_y_MUX_uxn_device_h_l62_c3_6024_cond;
     flip_y_MUX_uxn_device_h_l62_c3_6024_iftrue <= VAR_flip_y_MUX_uxn_device_h_l62_c3_6024_iftrue;
     flip_y_MUX_uxn_device_h_l62_c3_6024_iffalse <= VAR_flip_y_MUX_uxn_device_h_l62_c3_6024_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l62_c3_6024_return_output := flip_y_MUX_uxn_device_h_l62_c3_6024_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_device_h_l120_c27_2a91_cond := VAR_BIN_OP_GT_uxn_device_h_l120_c27_02fe_return_output;
     VAR_is_drawing_port_MUX_uxn_device_h_l42_c2_c27c_iftrue := VAR_BIN_OP_OR_uxn_device_h_l45_c21_23f8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l49_c3_de5f_cond := VAR_BIN_OP_OR_uxn_device_h_l45_c21_23f8_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l49_c3_de5f_cond := VAR_BIN_OP_OR_uxn_device_h_l45_c21_23f8_return_output;
     VAR_vram_addr_uxn_device_h_l132_c5_a4cf := resize(VAR_BIN_OP_PLUS_uxn_device_h_l132_c18_3dfa_return_output, 32);
     VAR_result_vram_address_uxn_device_h_l140_c5_7297 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l140_c28_706a_return_output, 32);
     VAR_result_u8_value_MUX_uxn_device_h_l156_c5_f4d5_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l160_c24_4d1c_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l49_c3_de5f_iftrue := VAR_MUX_uxn_device_h_l50_c32_ff36_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l118_c7_d5ea_iffalse := VAR_auto_advance_MUX_uxn_device_h_l124_c7_3d44_return_output;
     VAR_color_MUX_uxn_device_h_l56_c7_f9d9_iffalse := VAR_color_MUX_uxn_device_h_l61_c7_5d0a_return_output;
     VAR_ctrl_MUX_uxn_device_h_l42_c2_c27c_iffalse := VAR_ctrl_MUX_uxn_device_h_l56_c7_f9d9_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l61_c7_5d0a_iftrue := VAR_ctrl_mode_MUX_uxn_device_h_l62_c3_6024_return_output;
     VAR_flip_x_MUX_uxn_device_h_l61_c7_5d0a_iftrue := VAR_flip_x_MUX_uxn_device_h_l62_c3_6024_return_output;
     VAR_flip_y_MUX_uxn_device_h_l61_c7_5d0a_iftrue := VAR_flip_y_MUX_uxn_device_h_l62_c3_6024_return_output;
     REG_VAR_is_pixel_port := VAR_is_pixel_port_MUX_uxn_device_h_l42_c2_c27c_return_output;
     REG_VAR_is_sprite_port := VAR_is_sprite_port_MUX_uxn_device_h_l42_c2_c27c_return_output;
     VAR_layer_MUX_uxn_device_h_l61_c7_5d0a_iftrue := VAR_layer_MUX_uxn_device_h_l62_c3_6024_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l170_c7_b03c_iftrue := VAR_ram_addr_MUX_uxn_device_h_l178_c3_85d0_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l196_c7_1f25_iftrue := VAR_ram_addr_MUX_uxn_device_h_l204_c3_197f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_3d44_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_2150_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l150_c3_5fc1_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l155_c4_93e4_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l178_c3_85d0_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l171_c3_99f3_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l185_c3_b7f1_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l186_c4_f747_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l197_c3_e13e_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l198_c4_f395_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l196_c7_1f25_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l210_c7_72c7_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l149_c7_bfbe_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l150_c3_5fc1_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l196_c7_1f25_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l210_c7_72c7_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l150_c3_5fc1_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l155_c4_93e4_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l170_c7_b03c_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l171_c3_99f3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l185_c3_b7f1_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l186_c4_f747_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c3_e13e_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l198_c4_f395_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c7_1f25_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c7_72c7_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_3d44_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l149_c7_bfbe_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l124_c7_3d44_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l125_c3_2150_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l170_c7_b03c_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l171_c3_99f3_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l185_c3_b7f1_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l186_c4_f747_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l197_c3_e13e_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l198_c4_f395_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l124_c7_3d44_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l149_c7_bfbe_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l118_c7_d5ea_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l124_c7_3d44_return_output;
     VAR_x_MUX_uxn_device_h_l150_c3_5fc1_iftrue := VAR_x_MUX_uxn_device_h_l155_c4_93e4_return_output;
     VAR_x_MUX_uxn_device_h_l77_c7_76e7_iftrue := VAR_x_MUX_uxn_device_h_l78_c3_a3e7_return_output;
     VAR_x_MUX_uxn_device_h_l89_c7_6231_iftrue := VAR_x_MUX_uxn_device_h_l90_c3_5121_return_output;
     VAR_y_MUX_uxn_device_h_l100_c7_ba7b_iftrue := VAR_y_MUX_uxn_device_h_l101_c3_18ac_return_output;
     VAR_y_MUX_uxn_device_h_l112_c7_82e8_iftrue := VAR_y_MUX_uxn_device_h_l113_c3_c338_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l131_c4_1268_iffalse := VAR_result_vram_address_uxn_device_h_l140_c5_7297;
     VAR_BIN_OP_AND_uxn_device_h_l133_c5_ae09_left := VAR_vram_addr_uxn_device_h_l132_c5_a4cf;
     -- result_is_device_ram_write_MUX[uxn_device_h_l150_c3_5fc1] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l150_c3_5fc1_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l150_c3_5fc1_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l150_c3_5fc1_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l150_c3_5fc1_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l150_c3_5fc1_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l150_c3_5fc1_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l150_c3_5fc1_return_output := result_is_device_ram_write_MUX_uxn_device_h_l150_c3_5fc1_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l185_c3_b7f1] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l185_c3_b7f1_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l185_c3_b7f1_cond;
     result_device_ram_address_MUX_uxn_device_h_l185_c3_b7f1_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l185_c3_b7f1_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l185_c3_b7f1_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l185_c3_b7f1_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l185_c3_b7f1_return_output := result_device_ram_address_MUX_uxn_device_h_l185_c3_b7f1_return_output;

     -- layer_MUX[uxn_device_h_l61_c7_5d0a] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l61_c7_5d0a_cond <= VAR_layer_MUX_uxn_device_h_l61_c7_5d0a_cond;
     layer_MUX_uxn_device_h_l61_c7_5d0a_iftrue <= VAR_layer_MUX_uxn_device_h_l61_c7_5d0a_iftrue;
     layer_MUX_uxn_device_h_l61_c7_5d0a_iffalse <= VAR_layer_MUX_uxn_device_h_l61_c7_5d0a_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l61_c7_5d0a_return_output := layer_MUX_uxn_device_h_l61_c7_5d0a_return_output;

     -- ram_addr_MUX[uxn_device_h_l196_c7_1f25] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l196_c7_1f25_cond <= VAR_ram_addr_MUX_uxn_device_h_l196_c7_1f25_cond;
     ram_addr_MUX_uxn_device_h_l196_c7_1f25_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l196_c7_1f25_iftrue;
     ram_addr_MUX_uxn_device_h_l196_c7_1f25_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l196_c7_1f25_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l196_c7_1f25_return_output := ram_addr_MUX_uxn_device_h_l196_c7_1f25_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l178_c3_85d0] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l178_c3_85d0_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l178_c3_85d0_cond;
     result_device_ram_address_MUX_uxn_device_h_l178_c3_85d0_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l178_c3_85d0_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l178_c3_85d0_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l178_c3_85d0_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l178_c3_85d0_return_output := result_device_ram_address_MUX_uxn_device_h_l178_c3_85d0_return_output;

     -- is_drawing_port_MUX[uxn_device_h_l42_c2_c27c] LATENCY=0
     -- Inputs
     is_drawing_port_MUX_uxn_device_h_l42_c2_c27c_cond <= VAR_is_drawing_port_MUX_uxn_device_h_l42_c2_c27c_cond;
     is_drawing_port_MUX_uxn_device_h_l42_c2_c27c_iftrue <= VAR_is_drawing_port_MUX_uxn_device_h_l42_c2_c27c_iftrue;
     is_drawing_port_MUX_uxn_device_h_l42_c2_c27c_iffalse <= VAR_is_drawing_port_MUX_uxn_device_h_l42_c2_c27c_iffalse;
     -- Outputs
     VAR_is_drawing_port_MUX_uxn_device_h_l42_c2_c27c_return_output := is_drawing_port_MUX_uxn_device_h_l42_c2_c27c_return_output;

     -- MUX[uxn_device_h_l120_c27_2a91] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l120_c27_2a91_cond <= VAR_MUX_uxn_device_h_l120_c27_2a91_cond;
     MUX_uxn_device_h_l120_c27_2a91_iftrue <= VAR_MUX_uxn_device_h_l120_c27_2a91_iftrue;
     MUX_uxn_device_h_l120_c27_2a91_iffalse <= VAR_MUX_uxn_device_h_l120_c27_2a91_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l120_c27_2a91_return_output := MUX_uxn_device_h_l120_c27_2a91_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l197_c3_e13e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l197_c3_e13e_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l197_c3_e13e_cond;
     result_device_ram_address_MUX_uxn_device_h_l197_c3_e13e_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l197_c3_e13e_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l197_c3_e13e_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l197_c3_e13e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l197_c3_e13e_return_output := result_device_ram_address_MUX_uxn_device_h_l197_c3_e13e_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l118_c7_d5ea] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l118_c7_d5ea_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l118_c7_d5ea_cond;
     result_vram_write_layer_MUX_uxn_device_h_l118_c7_d5ea_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l118_c7_d5ea_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l118_c7_d5ea_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l118_c7_d5ea_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l118_c7_d5ea_return_output := result_vram_write_layer_MUX_uxn_device_h_l118_c7_d5ea_return_output;

     -- flip_y_MUX[uxn_device_h_l61_c7_5d0a] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l61_c7_5d0a_cond <= VAR_flip_y_MUX_uxn_device_h_l61_c7_5d0a_cond;
     flip_y_MUX_uxn_device_h_l61_c7_5d0a_iftrue <= VAR_flip_y_MUX_uxn_device_h_l61_c7_5d0a_iftrue;
     flip_y_MUX_uxn_device_h_l61_c7_5d0a_iffalse <= VAR_flip_y_MUX_uxn_device_h_l61_c7_5d0a_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l61_c7_5d0a_return_output := flip_y_MUX_uxn_device_h_l61_c7_5d0a_return_output;

     -- flip_x_MUX[uxn_device_h_l61_c7_5d0a] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l61_c7_5d0a_cond <= VAR_flip_x_MUX_uxn_device_h_l61_c7_5d0a_cond;
     flip_x_MUX_uxn_device_h_l61_c7_5d0a_iftrue <= VAR_flip_x_MUX_uxn_device_h_l61_c7_5d0a_iftrue;
     flip_x_MUX_uxn_device_h_l61_c7_5d0a_iffalse <= VAR_flip_x_MUX_uxn_device_h_l61_c7_5d0a_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l61_c7_5d0a_return_output := flip_x_MUX_uxn_device_h_l61_c7_5d0a_return_output;

     -- x_MUX[uxn_device_h_l150_c3_5fc1] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l150_c3_5fc1_cond <= VAR_x_MUX_uxn_device_h_l150_c3_5fc1_cond;
     x_MUX_uxn_device_h_l150_c3_5fc1_iftrue <= VAR_x_MUX_uxn_device_h_l150_c3_5fc1_iftrue;
     x_MUX_uxn_device_h_l150_c3_5fc1_iffalse <= VAR_x_MUX_uxn_device_h_l150_c3_5fc1_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l150_c3_5fc1_return_output := x_MUX_uxn_device_h_l150_c3_5fc1_return_output;

     -- BIN_OP_AND[uxn_device_h_l133_c5_ae09] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l133_c5_ae09_left <= VAR_BIN_OP_AND_uxn_device_h_l133_c5_ae09_left;
     BIN_OP_AND_uxn_device_h_l133_c5_ae09_right <= VAR_BIN_OP_AND_uxn_device_h_l133_c5_ae09_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l133_c5_ae09_return_output := BIN_OP_AND_uxn_device_h_l133_c5_ae09_return_output;

     -- result_u8_value_MUX[uxn_device_h_l197_c3_e13e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l197_c3_e13e_cond <= VAR_result_u8_value_MUX_uxn_device_h_l197_c3_e13e_cond;
     result_u8_value_MUX_uxn_device_h_l197_c3_e13e_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l197_c3_e13e_iftrue;
     result_u8_value_MUX_uxn_device_h_l197_c3_e13e_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l197_c3_e13e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l197_c3_e13e_return_output := result_u8_value_MUX_uxn_device_h_l197_c3_e13e_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l197_c3_e13e] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l197_c3_e13e_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c3_e13e_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l197_c3_e13e_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c3_e13e_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l197_c3_e13e_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c3_e13e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c3_e13e_return_output := result_is_device_ram_write_MUX_uxn_device_h_l197_c3_e13e_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l61_c7_5d0a] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l61_c7_5d0a_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l61_c7_5d0a_cond;
     ctrl_mode_MUX_uxn_device_h_l61_c7_5d0a_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l61_c7_5d0a_iftrue;
     ctrl_mode_MUX_uxn_device_h_l61_c7_5d0a_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l61_c7_5d0a_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l61_c7_5d0a_return_output := ctrl_mode_MUX_uxn_device_h_l61_c7_5d0a_return_output;

     -- result_u8_value_MUX[uxn_device_h_l185_c3_b7f1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l185_c3_b7f1_cond <= VAR_result_u8_value_MUX_uxn_device_h_l185_c3_b7f1_cond;
     result_u8_value_MUX_uxn_device_h_l185_c3_b7f1_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l185_c3_b7f1_iftrue;
     result_u8_value_MUX_uxn_device_h_l185_c3_b7f1_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l185_c3_b7f1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l185_c3_b7f1_return_output := result_u8_value_MUX_uxn_device_h_l185_c3_b7f1_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l185_c3_b7f1] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l185_c3_b7f1_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l185_c3_b7f1_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l185_c3_b7f1_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l185_c3_b7f1_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l185_c3_b7f1_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l185_c3_b7f1_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l185_c3_b7f1_return_output := result_is_device_ram_write_MUX_uxn_device_h_l185_c3_b7f1_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l150_c3_5fc1] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l150_c3_5fc1_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l150_c3_5fc1_cond;
     result_device_ram_address_MUX_uxn_device_h_l150_c3_5fc1_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l150_c3_5fc1_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l150_c3_5fc1_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l150_c3_5fc1_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l150_c3_5fc1_return_output := result_device_ram_address_MUX_uxn_device_h_l150_c3_5fc1_return_output;

     -- y_MUX[uxn_device_h_l112_c7_82e8] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l112_c7_82e8_cond <= VAR_y_MUX_uxn_device_h_l112_c7_82e8_cond;
     y_MUX_uxn_device_h_l112_c7_82e8_iftrue <= VAR_y_MUX_uxn_device_h_l112_c7_82e8_iftrue;
     y_MUX_uxn_device_h_l112_c7_82e8_iffalse <= VAR_y_MUX_uxn_device_h_l112_c7_82e8_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l112_c7_82e8_return_output := y_MUX_uxn_device_h_l112_c7_82e8_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l49_c3_de5f] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l49_c3_de5f_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l49_c3_de5f_cond;
     result_is_deo_done_MUX_uxn_device_h_l49_c3_de5f_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l49_c3_de5f_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l49_c3_de5f_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l49_c3_de5f_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l49_c3_de5f_return_output := result_is_deo_done_MUX_uxn_device_h_l49_c3_de5f_return_output;

     -- ctrl_MUX[uxn_device_h_l42_c2_c27c] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l42_c2_c27c_cond <= VAR_ctrl_MUX_uxn_device_h_l42_c2_c27c_cond;
     ctrl_MUX_uxn_device_h_l42_c2_c27c_iftrue <= VAR_ctrl_MUX_uxn_device_h_l42_c2_c27c_iftrue;
     ctrl_MUX_uxn_device_h_l42_c2_c27c_iffalse <= VAR_ctrl_MUX_uxn_device_h_l42_c2_c27c_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l42_c2_c27c_return_output := ctrl_MUX_uxn_device_h_l42_c2_c27c_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l49_c3_de5f] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l49_c3_de5f_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l49_c3_de5f_cond;
     result_device_ram_address_MUX_uxn_device_h_l49_c3_de5f_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l49_c3_de5f_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l49_c3_de5f_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l49_c3_de5f_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l49_c3_de5f_return_output := result_device_ram_address_MUX_uxn_device_h_l49_c3_de5f_return_output;

     -- auto_advance_MUX[uxn_device_h_l118_c7_d5ea] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l118_c7_d5ea_cond <= VAR_auto_advance_MUX_uxn_device_h_l118_c7_d5ea_cond;
     auto_advance_MUX_uxn_device_h_l118_c7_d5ea_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l118_c7_d5ea_iftrue;
     auto_advance_MUX_uxn_device_h_l118_c7_d5ea_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l118_c7_d5ea_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l118_c7_d5ea_return_output := auto_advance_MUX_uxn_device_h_l118_c7_d5ea_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l196_c7_1f25] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l196_c7_1f25_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l196_c7_1f25_cond;
     result_is_deo_done_MUX_uxn_device_h_l196_c7_1f25_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l196_c7_1f25_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l196_c7_1f25_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l196_c7_1f25_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l196_c7_1f25_return_output := result_is_deo_done_MUX_uxn_device_h_l196_c7_1f25_return_output;

     -- color_MUX[uxn_device_h_l56_c7_f9d9] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l56_c7_f9d9_cond <= VAR_color_MUX_uxn_device_h_l56_c7_f9d9_cond;
     color_MUX_uxn_device_h_l56_c7_f9d9_iftrue <= VAR_color_MUX_uxn_device_h_l56_c7_f9d9_iftrue;
     color_MUX_uxn_device_h_l56_c7_f9d9_iffalse <= VAR_color_MUX_uxn_device_h_l56_c7_f9d9_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l56_c7_f9d9_return_output := color_MUX_uxn_device_h_l56_c7_f9d9_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l124_c7_3d44] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l124_c7_3d44_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_3d44_cond;
     result_is_vram_write_MUX_uxn_device_h_l124_c7_3d44_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_3d44_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l124_c7_3d44_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_3d44_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_3d44_return_output := result_is_vram_write_MUX_uxn_device_h_l124_c7_3d44_return_output;

     -- result_u8_value_MUX[uxn_device_h_l156_c5_f4d5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l156_c5_f4d5_cond <= VAR_result_u8_value_MUX_uxn_device_h_l156_c5_f4d5_cond;
     result_u8_value_MUX_uxn_device_h_l156_c5_f4d5_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l156_c5_f4d5_iftrue;
     result_u8_value_MUX_uxn_device_h_l156_c5_f4d5_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l156_c5_f4d5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l156_c5_f4d5_return_output := result_u8_value_MUX_uxn_device_h_l156_c5_f4d5_return_output;

     -- Submodule level 4
     VAR_BIN_OP_OR_uxn_device_h_l134_c5_1182_left := VAR_BIN_OP_AND_uxn_device_h_l133_c5_ae09_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_4341_iftrue := VAR_MUX_uxn_device_h_l120_c27_2a91_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l112_c7_82e8_iffalse := VAR_auto_advance_MUX_uxn_device_h_l118_c7_d5ea_return_output;
     VAR_color_MUX_uxn_device_h_l42_c2_c27c_iffalse := VAR_color_MUX_uxn_device_h_l56_c7_f9d9_return_output;
     REG_VAR_ctrl := VAR_ctrl_MUX_uxn_device_h_l42_c2_c27c_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l56_c7_f9d9_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l61_c7_5d0a_return_output;
     VAR_flip_x_MUX_uxn_device_h_l56_c7_f9d9_iffalse := VAR_flip_x_MUX_uxn_device_h_l61_c7_5d0a_return_output;
     VAR_flip_y_MUX_uxn_device_h_l56_c7_f9d9_iffalse := VAR_flip_y_MUX_uxn_device_h_l61_c7_5d0a_return_output;
     REG_VAR_is_drawing_port := VAR_is_drawing_port_MUX_uxn_device_h_l42_c2_c27c_return_output;
     VAR_layer_MUX_uxn_device_h_l56_c7_f9d9_iffalse := VAR_layer_MUX_uxn_device_h_l61_c7_5d0a_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l184_c7_c45b_iffalse := VAR_ram_addr_MUX_uxn_device_h_l196_c7_1f25_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l149_c7_bfbe_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l150_c3_5fc1_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l170_c7_b03c_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l178_c3_85d0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l192_c3_ab93_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l185_c3_b7f1_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l196_c7_1f25_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l197_c3_e13e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l42_c2_c27c_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l49_c3_de5f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l184_c7_c45b_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l196_c7_1f25_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l42_c2_c27c_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l49_c3_de5f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c7_bfbe_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l150_c3_5fc1_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l184_c7_c45b_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l185_c3_b7f1_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c7_1f25_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c3_e13e_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l118_c7_d5ea_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_3d44_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l155_c4_93e4_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l156_c5_f4d5_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l184_c7_c45b_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l185_c3_b7f1_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l196_c7_1f25_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l197_c3_e13e_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l112_c7_82e8_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l118_c7_d5ea_return_output;
     VAR_x_MUX_uxn_device_h_l149_c7_bfbe_iftrue := VAR_x_MUX_uxn_device_h_l150_c3_5fc1_return_output;
     VAR_y_MUX_uxn_device_h_l107_c7_5fb4_iffalse := VAR_y_MUX_uxn_device_h_l112_c7_82e8_return_output;
     -- result_device_ram_address_MUX[uxn_device_h_l196_c7_1f25] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l196_c7_1f25_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l196_c7_1f25_cond;
     result_device_ram_address_MUX_uxn_device_h_l196_c7_1f25_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l196_c7_1f25_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l196_c7_1f25_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l196_c7_1f25_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l196_c7_1f25_return_output := result_device_ram_address_MUX_uxn_device_h_l196_c7_1f25_return_output;

     -- flip_x_MUX[uxn_device_h_l56_c7_f9d9] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l56_c7_f9d9_cond <= VAR_flip_x_MUX_uxn_device_h_l56_c7_f9d9_cond;
     flip_x_MUX_uxn_device_h_l56_c7_f9d9_iftrue <= VAR_flip_x_MUX_uxn_device_h_l56_c7_f9d9_iftrue;
     flip_x_MUX_uxn_device_h_l56_c7_f9d9_iffalse <= VAR_flip_x_MUX_uxn_device_h_l56_c7_f9d9_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l56_c7_f9d9_return_output := flip_x_MUX_uxn_device_h_l56_c7_f9d9_return_output;

     -- x_MUX[uxn_device_h_l149_c7_bfbe] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l149_c7_bfbe_cond <= VAR_x_MUX_uxn_device_h_l149_c7_bfbe_cond;
     x_MUX_uxn_device_h_l149_c7_bfbe_iftrue <= VAR_x_MUX_uxn_device_h_l149_c7_bfbe_iftrue;
     x_MUX_uxn_device_h_l149_c7_bfbe_iffalse <= VAR_x_MUX_uxn_device_h_l149_c7_bfbe_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l149_c7_bfbe_return_output := x_MUX_uxn_device_h_l149_c7_bfbe_return_output;

     -- flip_y_MUX[uxn_device_h_l56_c7_f9d9] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l56_c7_f9d9_cond <= VAR_flip_y_MUX_uxn_device_h_l56_c7_f9d9_cond;
     flip_y_MUX_uxn_device_h_l56_c7_f9d9_iftrue <= VAR_flip_y_MUX_uxn_device_h_l56_c7_f9d9_iftrue;
     flip_y_MUX_uxn_device_h_l56_c7_f9d9_iffalse <= VAR_flip_y_MUX_uxn_device_h_l56_c7_f9d9_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l56_c7_f9d9_return_output := flip_y_MUX_uxn_device_h_l56_c7_f9d9_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l119_c3_4341] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l119_c3_4341_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_4341_cond;
     result_is_deo_done_MUX_uxn_device_h_l119_c3_4341_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_4341_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l119_c3_4341_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_4341_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_4341_return_output := result_is_deo_done_MUX_uxn_device_h_l119_c3_4341_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l118_c7_d5ea] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l118_c7_d5ea_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l118_c7_d5ea_cond;
     result_is_vram_write_MUX_uxn_device_h_l118_c7_d5ea_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l118_c7_d5ea_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l118_c7_d5ea_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l118_c7_d5ea_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l118_c7_d5ea_return_output := result_is_vram_write_MUX_uxn_device_h_l118_c7_d5ea_return_output;

     -- result_u8_value_MUX[uxn_device_h_l155_c4_93e4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l155_c4_93e4_cond <= VAR_result_u8_value_MUX_uxn_device_h_l155_c4_93e4_cond;
     result_u8_value_MUX_uxn_device_h_l155_c4_93e4_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l155_c4_93e4_iftrue;
     result_u8_value_MUX_uxn_device_h_l155_c4_93e4_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l155_c4_93e4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l155_c4_93e4_return_output := result_u8_value_MUX_uxn_device_h_l155_c4_93e4_return_output;

     -- color_MUX[uxn_device_h_l42_c2_c27c] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l42_c2_c27c_cond <= VAR_color_MUX_uxn_device_h_l42_c2_c27c_cond;
     color_MUX_uxn_device_h_l42_c2_c27c_iftrue <= VAR_color_MUX_uxn_device_h_l42_c2_c27c_iftrue;
     color_MUX_uxn_device_h_l42_c2_c27c_iffalse <= VAR_color_MUX_uxn_device_h_l42_c2_c27c_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l42_c2_c27c_return_output := color_MUX_uxn_device_h_l42_c2_c27c_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l112_c7_82e8] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l112_c7_82e8_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l112_c7_82e8_cond;
     result_vram_write_layer_MUX_uxn_device_h_l112_c7_82e8_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l112_c7_82e8_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l112_c7_82e8_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l112_c7_82e8_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l112_c7_82e8_return_output := result_vram_write_layer_MUX_uxn_device_h_l112_c7_82e8_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l56_c7_f9d9] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l56_c7_f9d9_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l56_c7_f9d9_cond;
     ctrl_mode_MUX_uxn_device_h_l56_c7_f9d9_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l56_c7_f9d9_iftrue;
     ctrl_mode_MUX_uxn_device_h_l56_c7_f9d9_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l56_c7_f9d9_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l56_c7_f9d9_return_output := ctrl_mode_MUX_uxn_device_h_l56_c7_f9d9_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l196_c7_1f25] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l196_c7_1f25_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c7_1f25_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l196_c7_1f25_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c7_1f25_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l196_c7_1f25_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c7_1f25_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c7_1f25_return_output := result_is_device_ram_write_MUX_uxn_device_h_l196_c7_1f25_return_output;

     -- auto_advance_MUX[uxn_device_h_l112_c7_82e8] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l112_c7_82e8_cond <= VAR_auto_advance_MUX_uxn_device_h_l112_c7_82e8_cond;
     auto_advance_MUX_uxn_device_h_l112_c7_82e8_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l112_c7_82e8_iftrue;
     auto_advance_MUX_uxn_device_h_l112_c7_82e8_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l112_c7_82e8_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l112_c7_82e8_return_output := auto_advance_MUX_uxn_device_h_l112_c7_82e8_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l192_c3_ab93] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l192_c3_ab93_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l192_c3_ab93_cond;
     result_device_ram_address_MUX_uxn_device_h_l192_c3_ab93_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l192_c3_ab93_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l192_c3_ab93_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l192_c3_ab93_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l192_c3_ab93_return_output := result_device_ram_address_MUX_uxn_device_h_l192_c3_ab93_return_output;

     -- ram_addr_MUX[uxn_device_h_l184_c7_c45b] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l184_c7_c45b_cond <= VAR_ram_addr_MUX_uxn_device_h_l184_c7_c45b_cond;
     ram_addr_MUX_uxn_device_h_l184_c7_c45b_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l184_c7_c45b_iftrue;
     ram_addr_MUX_uxn_device_h_l184_c7_c45b_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l184_c7_c45b_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l184_c7_c45b_return_output := ram_addr_MUX_uxn_device_h_l184_c7_c45b_return_output;

     -- result_u8_value_MUX[uxn_device_h_l196_c7_1f25] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l196_c7_1f25_cond <= VAR_result_u8_value_MUX_uxn_device_h_l196_c7_1f25_cond;
     result_u8_value_MUX_uxn_device_h_l196_c7_1f25_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l196_c7_1f25_iftrue;
     result_u8_value_MUX_uxn_device_h_l196_c7_1f25_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l196_c7_1f25_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l196_c7_1f25_return_output := result_u8_value_MUX_uxn_device_h_l196_c7_1f25_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l184_c7_c45b] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l184_c7_c45b_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l184_c7_c45b_cond;
     result_is_deo_done_MUX_uxn_device_h_l184_c7_c45b_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l184_c7_c45b_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l184_c7_c45b_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l184_c7_c45b_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l184_c7_c45b_return_output := result_is_deo_done_MUX_uxn_device_h_l184_c7_c45b_return_output;

     -- BIN_OP_OR[uxn_device_h_l134_c5_1182] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l134_c5_1182_left <= VAR_BIN_OP_OR_uxn_device_h_l134_c5_1182_left;
     BIN_OP_OR_uxn_device_h_l134_c5_1182_right <= VAR_BIN_OP_OR_uxn_device_h_l134_c5_1182_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l134_c5_1182_return_output := BIN_OP_OR_uxn_device_h_l134_c5_1182_return_output;

     -- y_MUX[uxn_device_h_l107_c7_5fb4] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l107_c7_5fb4_cond <= VAR_y_MUX_uxn_device_h_l107_c7_5fb4_cond;
     y_MUX_uxn_device_h_l107_c7_5fb4_iftrue <= VAR_y_MUX_uxn_device_h_l107_c7_5fb4_iftrue;
     y_MUX_uxn_device_h_l107_c7_5fb4_iffalse <= VAR_y_MUX_uxn_device_h_l107_c7_5fb4_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l107_c7_5fb4_return_output := y_MUX_uxn_device_h_l107_c7_5fb4_return_output;

     -- layer_MUX[uxn_device_h_l56_c7_f9d9] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l56_c7_f9d9_cond <= VAR_layer_MUX_uxn_device_h_l56_c7_f9d9_cond;
     layer_MUX_uxn_device_h_l56_c7_f9d9_iftrue <= VAR_layer_MUX_uxn_device_h_l56_c7_f9d9_iftrue;
     layer_MUX_uxn_device_h_l56_c7_f9d9_iffalse <= VAR_layer_MUX_uxn_device_h_l56_c7_f9d9_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l56_c7_f9d9_return_output := layer_MUX_uxn_device_h_l56_c7_f9d9_return_output;

     -- Submodule level 5
     VAR_BIN_OP_OR_uxn_device_h_l135_c5_4991_left := VAR_BIN_OP_OR_uxn_device_h_l134_c5_1182_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l107_c7_5fb4_iffalse := VAR_auto_advance_MUX_uxn_device_h_l112_c7_82e8_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_device_h_l42_c2_c27c_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l42_c2_c27c_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l56_c7_f9d9_return_output;
     VAR_flip_x_MUX_uxn_device_h_l42_c2_c27c_iffalse := VAR_flip_x_MUX_uxn_device_h_l56_c7_f9d9_return_output;
     VAR_flip_y_MUX_uxn_device_h_l42_c2_c27c_iffalse := VAR_flip_y_MUX_uxn_device_h_l56_c7_f9d9_return_output;
     VAR_layer_MUX_uxn_device_h_l42_c2_c27c_iffalse := VAR_layer_MUX_uxn_device_h_l56_c7_f9d9_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l170_c7_b03c_iffalse := VAR_ram_addr_MUX_uxn_device_h_l184_c7_c45b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l184_c7_c45b_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l192_c3_ab93_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l184_c7_c45b_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l196_c7_1f25_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l118_c7_d5ea_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l119_c3_4341_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l170_c7_b03c_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l184_c7_c45b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l184_c7_c45b_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c7_1f25_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l112_c7_82e8_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l118_c7_d5ea_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l150_c3_5fc1_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l155_c4_93e4_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l184_c7_c45b_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l196_c7_1f25_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l107_c7_5fb4_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l112_c7_82e8_return_output;
     VAR_x_MUX_uxn_device_h_l124_c7_3d44_iffalse := VAR_x_MUX_uxn_device_h_l149_c7_bfbe_return_output;
     VAR_y_MUX_uxn_device_h_l100_c7_ba7b_iffalse := VAR_y_MUX_uxn_device_h_l107_c7_5fb4_return_output;
     -- result_u8_value_MUX[uxn_device_h_l184_c7_c45b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l184_c7_c45b_cond <= VAR_result_u8_value_MUX_uxn_device_h_l184_c7_c45b_cond;
     result_u8_value_MUX_uxn_device_h_l184_c7_c45b_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l184_c7_c45b_iftrue;
     result_u8_value_MUX_uxn_device_h_l184_c7_c45b_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l184_c7_c45b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l184_c7_c45b_return_output := result_u8_value_MUX_uxn_device_h_l184_c7_c45b_return_output;

     -- y_MUX[uxn_device_h_l100_c7_ba7b] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l100_c7_ba7b_cond <= VAR_y_MUX_uxn_device_h_l100_c7_ba7b_cond;
     y_MUX_uxn_device_h_l100_c7_ba7b_iftrue <= VAR_y_MUX_uxn_device_h_l100_c7_ba7b_iftrue;
     y_MUX_uxn_device_h_l100_c7_ba7b_iffalse <= VAR_y_MUX_uxn_device_h_l100_c7_ba7b_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l100_c7_ba7b_return_output := y_MUX_uxn_device_h_l100_c7_ba7b_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l184_c7_c45b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l184_c7_c45b_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l184_c7_c45b_cond;
     result_device_ram_address_MUX_uxn_device_h_l184_c7_c45b_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l184_c7_c45b_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l184_c7_c45b_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l184_c7_c45b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l184_c7_c45b_return_output := result_device_ram_address_MUX_uxn_device_h_l184_c7_c45b_return_output;

     -- flip_x_MUX[uxn_device_h_l42_c2_c27c] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l42_c2_c27c_cond <= VAR_flip_x_MUX_uxn_device_h_l42_c2_c27c_cond;
     flip_x_MUX_uxn_device_h_l42_c2_c27c_iftrue <= VAR_flip_x_MUX_uxn_device_h_l42_c2_c27c_iftrue;
     flip_x_MUX_uxn_device_h_l42_c2_c27c_iffalse <= VAR_flip_x_MUX_uxn_device_h_l42_c2_c27c_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l42_c2_c27c_return_output := flip_x_MUX_uxn_device_h_l42_c2_c27c_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l112_c7_82e8] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l112_c7_82e8_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l112_c7_82e8_cond;
     result_is_vram_write_MUX_uxn_device_h_l112_c7_82e8_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l112_c7_82e8_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l112_c7_82e8_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l112_c7_82e8_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l112_c7_82e8_return_output := result_is_vram_write_MUX_uxn_device_h_l112_c7_82e8_return_output;

     -- BIN_OP_OR[uxn_device_h_l135_c5_4991] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l135_c5_4991_left <= VAR_BIN_OP_OR_uxn_device_h_l135_c5_4991_left;
     BIN_OP_OR_uxn_device_h_l135_c5_4991_right <= VAR_BIN_OP_OR_uxn_device_h_l135_c5_4991_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l135_c5_4991_return_output := BIN_OP_OR_uxn_device_h_l135_c5_4991_return_output;

     -- layer_MUX[uxn_device_h_l42_c2_c27c] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l42_c2_c27c_cond <= VAR_layer_MUX_uxn_device_h_l42_c2_c27c_cond;
     layer_MUX_uxn_device_h_l42_c2_c27c_iftrue <= VAR_layer_MUX_uxn_device_h_l42_c2_c27c_iftrue;
     layer_MUX_uxn_device_h_l42_c2_c27c_iffalse <= VAR_layer_MUX_uxn_device_h_l42_c2_c27c_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l42_c2_c27c_return_output := layer_MUX_uxn_device_h_l42_c2_c27c_return_output;

     -- auto_advance_MUX[uxn_device_h_l107_c7_5fb4] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l107_c7_5fb4_cond <= VAR_auto_advance_MUX_uxn_device_h_l107_c7_5fb4_cond;
     auto_advance_MUX_uxn_device_h_l107_c7_5fb4_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l107_c7_5fb4_iftrue;
     auto_advance_MUX_uxn_device_h_l107_c7_5fb4_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l107_c7_5fb4_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l107_c7_5fb4_return_output := auto_advance_MUX_uxn_device_h_l107_c7_5fb4_return_output;

     -- x_MUX[uxn_device_h_l124_c7_3d44] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l124_c7_3d44_cond <= VAR_x_MUX_uxn_device_h_l124_c7_3d44_cond;
     x_MUX_uxn_device_h_l124_c7_3d44_iftrue <= VAR_x_MUX_uxn_device_h_l124_c7_3d44_iftrue;
     x_MUX_uxn_device_h_l124_c7_3d44_iffalse <= VAR_x_MUX_uxn_device_h_l124_c7_3d44_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l124_c7_3d44_return_output := x_MUX_uxn_device_h_l124_c7_3d44_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l107_c7_5fb4] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l107_c7_5fb4_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l107_c7_5fb4_cond;
     result_vram_write_layer_MUX_uxn_device_h_l107_c7_5fb4_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l107_c7_5fb4_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l107_c7_5fb4_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l107_c7_5fb4_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l107_c7_5fb4_return_output := result_vram_write_layer_MUX_uxn_device_h_l107_c7_5fb4_return_output;

     -- flip_y_MUX[uxn_device_h_l42_c2_c27c] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l42_c2_c27c_cond <= VAR_flip_y_MUX_uxn_device_h_l42_c2_c27c_cond;
     flip_y_MUX_uxn_device_h_l42_c2_c27c_iftrue <= VAR_flip_y_MUX_uxn_device_h_l42_c2_c27c_iftrue;
     flip_y_MUX_uxn_device_h_l42_c2_c27c_iffalse <= VAR_flip_y_MUX_uxn_device_h_l42_c2_c27c_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l42_c2_c27c_return_output := flip_y_MUX_uxn_device_h_l42_c2_c27c_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l170_c7_b03c] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l170_c7_b03c_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l170_c7_b03c_cond;
     result_is_deo_done_MUX_uxn_device_h_l170_c7_b03c_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l170_c7_b03c_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l170_c7_b03c_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l170_c7_b03c_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l170_c7_b03c_return_output := result_is_deo_done_MUX_uxn_device_h_l170_c7_b03c_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l42_c2_c27c] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l42_c2_c27c_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l42_c2_c27c_cond;
     ctrl_mode_MUX_uxn_device_h_l42_c2_c27c_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l42_c2_c27c_iftrue;
     ctrl_mode_MUX_uxn_device_h_l42_c2_c27c_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l42_c2_c27c_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l42_c2_c27c_return_output := ctrl_mode_MUX_uxn_device_h_l42_c2_c27c_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l184_c7_c45b] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l184_c7_c45b_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l184_c7_c45b_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l184_c7_c45b_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l184_c7_c45b_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l184_c7_c45b_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l184_c7_c45b_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l184_c7_c45b_return_output := result_is_device_ram_write_MUX_uxn_device_h_l184_c7_c45b_return_output;

     -- ram_addr_MUX[uxn_device_h_l170_c7_b03c] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l170_c7_b03c_cond <= VAR_ram_addr_MUX_uxn_device_h_l170_c7_b03c_cond;
     ram_addr_MUX_uxn_device_h_l170_c7_b03c_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l170_c7_b03c_iftrue;
     ram_addr_MUX_uxn_device_h_l170_c7_b03c_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l170_c7_b03c_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l170_c7_b03c_return_output := ram_addr_MUX_uxn_device_h_l170_c7_b03c_return_output;

     -- result_u8_value_MUX[uxn_device_h_l150_c3_5fc1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l150_c3_5fc1_cond <= VAR_result_u8_value_MUX_uxn_device_h_l150_c3_5fc1_cond;
     result_u8_value_MUX_uxn_device_h_l150_c3_5fc1_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l150_c3_5fc1_iftrue;
     result_u8_value_MUX_uxn_device_h_l150_c3_5fc1_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l150_c3_5fc1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l150_c3_5fc1_return_output := result_u8_value_MUX_uxn_device_h_l150_c3_5fc1_return_output;

     -- Submodule level 6
     VAR_BIN_OP_OR_uxn_device_h_l136_c5_81b6_left := VAR_BIN_OP_OR_uxn_device_h_l135_c5_4991_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l100_c7_ba7b_iffalse := VAR_auto_advance_MUX_uxn_device_h_l107_c7_5fb4_return_output;
     REG_VAR_ctrl_mode := VAR_ctrl_mode_MUX_uxn_device_h_l42_c2_c27c_return_output;
     REG_VAR_flip_x := VAR_flip_x_MUX_uxn_device_h_l42_c2_c27c_return_output;
     REG_VAR_flip_y := VAR_flip_y_MUX_uxn_device_h_l42_c2_c27c_return_output;
     REG_VAR_layer := VAR_layer_MUX_uxn_device_h_l42_c2_c27c_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l149_c7_bfbe_iffalse := VAR_ram_addr_MUX_uxn_device_h_l170_c7_b03c_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l170_c7_b03c_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l184_c7_c45b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l149_c7_bfbe_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l170_c7_b03c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l170_c7_b03c_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l184_c7_c45b_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_5fb4_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l112_c7_82e8_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l149_c7_bfbe_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l150_c3_5fc1_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l170_c7_b03c_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l184_c7_c45b_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l100_c7_ba7b_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l107_c7_5fb4_return_output;
     VAR_x_MUX_uxn_device_h_l118_c7_d5ea_iffalse := VAR_x_MUX_uxn_device_h_l124_c7_3d44_return_output;
     VAR_y_MUX_uxn_device_h_l95_c7_f81e_iffalse := VAR_y_MUX_uxn_device_h_l100_c7_ba7b_return_output;
     -- y_MUX[uxn_device_h_l95_c7_f81e] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l95_c7_f81e_cond <= VAR_y_MUX_uxn_device_h_l95_c7_f81e_cond;
     y_MUX_uxn_device_h_l95_c7_f81e_iftrue <= VAR_y_MUX_uxn_device_h_l95_c7_f81e_iftrue;
     y_MUX_uxn_device_h_l95_c7_f81e_iffalse <= VAR_y_MUX_uxn_device_h_l95_c7_f81e_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l95_c7_f81e_return_output := y_MUX_uxn_device_h_l95_c7_f81e_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l170_c7_b03c] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l170_c7_b03c_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l170_c7_b03c_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l170_c7_b03c_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l170_c7_b03c_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l170_c7_b03c_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l170_c7_b03c_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l170_c7_b03c_return_output := result_is_device_ram_write_MUX_uxn_device_h_l170_c7_b03c_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l107_c7_5fb4] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l107_c7_5fb4_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_5fb4_cond;
     result_is_vram_write_MUX_uxn_device_h_l107_c7_5fb4_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_5fb4_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l107_c7_5fb4_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_5fb4_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_5fb4_return_output := result_is_vram_write_MUX_uxn_device_h_l107_c7_5fb4_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l100_c7_ba7b] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l100_c7_ba7b_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l100_c7_ba7b_cond;
     result_vram_write_layer_MUX_uxn_device_h_l100_c7_ba7b_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l100_c7_ba7b_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l100_c7_ba7b_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l100_c7_ba7b_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l100_c7_ba7b_return_output := result_vram_write_layer_MUX_uxn_device_h_l100_c7_ba7b_return_output;

     -- result_u8_value_MUX[uxn_device_h_l170_c7_b03c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l170_c7_b03c_cond <= VAR_result_u8_value_MUX_uxn_device_h_l170_c7_b03c_cond;
     result_u8_value_MUX_uxn_device_h_l170_c7_b03c_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l170_c7_b03c_iftrue;
     result_u8_value_MUX_uxn_device_h_l170_c7_b03c_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l170_c7_b03c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l170_c7_b03c_return_output := result_u8_value_MUX_uxn_device_h_l170_c7_b03c_return_output;

     -- BIN_OP_OR[uxn_device_h_l136_c5_81b6] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l136_c5_81b6_left <= VAR_BIN_OP_OR_uxn_device_h_l136_c5_81b6_left;
     BIN_OP_OR_uxn_device_h_l136_c5_81b6_right <= VAR_BIN_OP_OR_uxn_device_h_l136_c5_81b6_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l136_c5_81b6_return_output := BIN_OP_OR_uxn_device_h_l136_c5_81b6_return_output;

     -- x_MUX[uxn_device_h_l118_c7_d5ea] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l118_c7_d5ea_cond <= VAR_x_MUX_uxn_device_h_l118_c7_d5ea_cond;
     x_MUX_uxn_device_h_l118_c7_d5ea_iftrue <= VAR_x_MUX_uxn_device_h_l118_c7_d5ea_iftrue;
     x_MUX_uxn_device_h_l118_c7_d5ea_iffalse <= VAR_x_MUX_uxn_device_h_l118_c7_d5ea_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l118_c7_d5ea_return_output := x_MUX_uxn_device_h_l118_c7_d5ea_return_output;

     -- ram_addr_MUX[uxn_device_h_l149_c7_bfbe] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l149_c7_bfbe_cond <= VAR_ram_addr_MUX_uxn_device_h_l149_c7_bfbe_cond;
     ram_addr_MUX_uxn_device_h_l149_c7_bfbe_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l149_c7_bfbe_iftrue;
     ram_addr_MUX_uxn_device_h_l149_c7_bfbe_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l149_c7_bfbe_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l149_c7_bfbe_return_output := ram_addr_MUX_uxn_device_h_l149_c7_bfbe_return_output;

     -- auto_advance_MUX[uxn_device_h_l100_c7_ba7b] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l100_c7_ba7b_cond <= VAR_auto_advance_MUX_uxn_device_h_l100_c7_ba7b_cond;
     auto_advance_MUX_uxn_device_h_l100_c7_ba7b_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l100_c7_ba7b_iftrue;
     auto_advance_MUX_uxn_device_h_l100_c7_ba7b_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l100_c7_ba7b_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l100_c7_ba7b_return_output := auto_advance_MUX_uxn_device_h_l100_c7_ba7b_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l170_c7_b03c] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l170_c7_b03c_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l170_c7_b03c_cond;
     result_device_ram_address_MUX_uxn_device_h_l170_c7_b03c_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l170_c7_b03c_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l170_c7_b03c_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l170_c7_b03c_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l170_c7_b03c_return_output := result_device_ram_address_MUX_uxn_device_h_l170_c7_b03c_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l149_c7_bfbe] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l149_c7_bfbe_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l149_c7_bfbe_cond;
     result_is_deo_done_MUX_uxn_device_h_l149_c7_bfbe_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l149_c7_bfbe_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l149_c7_bfbe_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l149_c7_bfbe_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l149_c7_bfbe_return_output := result_is_deo_done_MUX_uxn_device_h_l149_c7_bfbe_return_output;

     -- Submodule level 7
     VAR_result_vram_address_MUX_uxn_device_h_l131_c4_1268_iftrue := VAR_BIN_OP_OR_uxn_device_h_l136_c5_81b6_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l131_c4_1268_iftrue := VAR_BIN_OP_OR_uxn_device_h_l136_c5_81b6_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l95_c7_f81e_iffalse := VAR_auto_advance_MUX_uxn_device_h_l100_c7_ba7b_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l124_c7_3d44_iffalse := VAR_ram_addr_MUX_uxn_device_h_l149_c7_bfbe_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l149_c7_bfbe_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l170_c7_b03c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_3d44_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l149_c7_bfbe_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c7_bfbe_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l170_c7_b03c_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l100_c7_ba7b_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_5fb4_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l149_c7_bfbe_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l170_c7_b03c_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l95_c7_f81e_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l100_c7_ba7b_return_output;
     VAR_x_MUX_uxn_device_h_l112_c7_82e8_iffalse := VAR_x_MUX_uxn_device_h_l118_c7_d5ea_return_output;
     VAR_y_MUX_uxn_device_h_l89_c7_6231_iffalse := VAR_y_MUX_uxn_device_h_l95_c7_f81e_return_output;
     -- ram_addr_MUX[uxn_device_h_l124_c7_3d44] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l124_c7_3d44_cond <= VAR_ram_addr_MUX_uxn_device_h_l124_c7_3d44_cond;
     ram_addr_MUX_uxn_device_h_l124_c7_3d44_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l124_c7_3d44_iftrue;
     ram_addr_MUX_uxn_device_h_l124_c7_3d44_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l124_c7_3d44_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l124_c7_3d44_return_output := ram_addr_MUX_uxn_device_h_l124_c7_3d44_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l149_c7_bfbe] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l149_c7_bfbe_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l149_c7_bfbe_cond;
     result_device_ram_address_MUX_uxn_device_h_l149_c7_bfbe_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l149_c7_bfbe_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l149_c7_bfbe_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l149_c7_bfbe_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l149_c7_bfbe_return_output := result_device_ram_address_MUX_uxn_device_h_l149_c7_bfbe_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l124_c7_3d44] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l124_c7_3d44_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_3d44_cond;
     result_is_deo_done_MUX_uxn_device_h_l124_c7_3d44_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_3d44_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l124_c7_3d44_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_3d44_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_3d44_return_output := result_is_deo_done_MUX_uxn_device_h_l124_c7_3d44_return_output;

     -- y_MUX[uxn_device_h_l89_c7_6231] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l89_c7_6231_cond <= VAR_y_MUX_uxn_device_h_l89_c7_6231_cond;
     y_MUX_uxn_device_h_l89_c7_6231_iftrue <= VAR_y_MUX_uxn_device_h_l89_c7_6231_iftrue;
     y_MUX_uxn_device_h_l89_c7_6231_iffalse <= VAR_y_MUX_uxn_device_h_l89_c7_6231_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l89_c7_6231_return_output := y_MUX_uxn_device_h_l89_c7_6231_return_output;

     -- result_u8_value_MUX[uxn_device_h_l149_c7_bfbe] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l149_c7_bfbe_cond <= VAR_result_u8_value_MUX_uxn_device_h_l149_c7_bfbe_cond;
     result_u8_value_MUX_uxn_device_h_l149_c7_bfbe_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l149_c7_bfbe_iftrue;
     result_u8_value_MUX_uxn_device_h_l149_c7_bfbe_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l149_c7_bfbe_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l149_c7_bfbe_return_output := result_u8_value_MUX_uxn_device_h_l149_c7_bfbe_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l149_c7_bfbe] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l149_c7_bfbe_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c7_bfbe_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l149_c7_bfbe_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c7_bfbe_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l149_c7_bfbe_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c7_bfbe_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c7_bfbe_return_output := result_is_device_ram_write_MUX_uxn_device_h_l149_c7_bfbe_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l100_c7_ba7b] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l100_c7_ba7b_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l100_c7_ba7b_cond;
     result_is_vram_write_MUX_uxn_device_h_l100_c7_ba7b_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l100_c7_ba7b_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l100_c7_ba7b_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l100_c7_ba7b_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l100_c7_ba7b_return_output := result_is_vram_write_MUX_uxn_device_h_l100_c7_ba7b_return_output;

     -- auto_advance_MUX[uxn_device_h_l95_c7_f81e] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l95_c7_f81e_cond <= VAR_auto_advance_MUX_uxn_device_h_l95_c7_f81e_cond;
     auto_advance_MUX_uxn_device_h_l95_c7_f81e_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l95_c7_f81e_iftrue;
     auto_advance_MUX_uxn_device_h_l95_c7_f81e_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l95_c7_f81e_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l95_c7_f81e_return_output := auto_advance_MUX_uxn_device_h_l95_c7_f81e_return_output;

     -- result_vram_address_MUX[uxn_device_h_l131_c4_1268] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l131_c4_1268_cond <= VAR_result_vram_address_MUX_uxn_device_h_l131_c4_1268_cond;
     result_vram_address_MUX_uxn_device_h_l131_c4_1268_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l131_c4_1268_iftrue;
     result_vram_address_MUX_uxn_device_h_l131_c4_1268_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l131_c4_1268_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l131_c4_1268_return_output := result_vram_address_MUX_uxn_device_h_l131_c4_1268_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l95_c7_f81e] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l95_c7_f81e_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l95_c7_f81e_cond;
     result_vram_write_layer_MUX_uxn_device_h_l95_c7_f81e_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l95_c7_f81e_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l95_c7_f81e_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l95_c7_f81e_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l95_c7_f81e_return_output := result_vram_write_layer_MUX_uxn_device_h_l95_c7_f81e_return_output;

     -- x_MUX[uxn_device_h_l112_c7_82e8] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l112_c7_82e8_cond <= VAR_x_MUX_uxn_device_h_l112_c7_82e8_cond;
     x_MUX_uxn_device_h_l112_c7_82e8_iftrue <= VAR_x_MUX_uxn_device_h_l112_c7_82e8_iftrue;
     x_MUX_uxn_device_h_l112_c7_82e8_iffalse <= VAR_x_MUX_uxn_device_h_l112_c7_82e8_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l112_c7_82e8_return_output := x_MUX_uxn_device_h_l112_c7_82e8_return_output;

     -- vram_addr_MUX[uxn_device_h_l131_c4_1268] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l131_c4_1268_cond <= VAR_vram_addr_MUX_uxn_device_h_l131_c4_1268_cond;
     vram_addr_MUX_uxn_device_h_l131_c4_1268_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l131_c4_1268_iftrue;
     vram_addr_MUX_uxn_device_h_l131_c4_1268_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l131_c4_1268_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l131_c4_1268_return_output := vram_addr_MUX_uxn_device_h_l131_c4_1268_return_output;

     -- Submodule level 8
     VAR_auto_advance_MUX_uxn_device_h_l89_c7_6231_iffalse := VAR_auto_advance_MUX_uxn_device_h_l95_c7_f81e_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l118_c7_d5ea_iffalse := VAR_ram_addr_MUX_uxn_device_h_l124_c7_3d44_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_3d44_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l149_c7_bfbe_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l118_c7_d5ea_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_3d44_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l124_c7_3d44_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l149_c7_bfbe_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l95_c7_f81e_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l100_c7_ba7b_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l124_c7_3d44_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l149_c7_bfbe_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l125_c3_2150_iftrue := VAR_result_vram_address_MUX_uxn_device_h_l131_c4_1268_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l89_c7_6231_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l95_c7_f81e_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l125_c3_2150_iftrue := VAR_vram_addr_MUX_uxn_device_h_l131_c4_1268_return_output;
     VAR_x_MUX_uxn_device_h_l107_c7_5fb4_iffalse := VAR_x_MUX_uxn_device_h_l112_c7_82e8_return_output;
     VAR_y_MUX_uxn_device_h_l84_c7_0b55_iffalse := VAR_y_MUX_uxn_device_h_l89_c7_6231_return_output;
     -- result_vram_write_layer_MUX[uxn_device_h_l89_c7_6231] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l89_c7_6231_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l89_c7_6231_cond;
     result_vram_write_layer_MUX_uxn_device_h_l89_c7_6231_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l89_c7_6231_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l89_c7_6231_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l89_c7_6231_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l89_c7_6231_return_output := result_vram_write_layer_MUX_uxn_device_h_l89_c7_6231_return_output;

     -- result_u8_value_MUX[uxn_device_h_l124_c7_3d44] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l124_c7_3d44_cond <= VAR_result_u8_value_MUX_uxn_device_h_l124_c7_3d44_cond;
     result_u8_value_MUX_uxn_device_h_l124_c7_3d44_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l124_c7_3d44_iftrue;
     result_u8_value_MUX_uxn_device_h_l124_c7_3d44_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l124_c7_3d44_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l124_c7_3d44_return_output := result_u8_value_MUX_uxn_device_h_l124_c7_3d44_return_output;

     -- result_vram_address_MUX[uxn_device_h_l125_c3_2150] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l125_c3_2150_cond <= VAR_result_vram_address_MUX_uxn_device_h_l125_c3_2150_cond;
     result_vram_address_MUX_uxn_device_h_l125_c3_2150_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l125_c3_2150_iftrue;
     result_vram_address_MUX_uxn_device_h_l125_c3_2150_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l125_c3_2150_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l125_c3_2150_return_output := result_vram_address_MUX_uxn_device_h_l125_c3_2150_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l124_c7_3d44] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l124_c7_3d44_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l124_c7_3d44_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l124_c7_3d44_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l124_c7_3d44_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l124_c7_3d44_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l124_c7_3d44_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l124_c7_3d44_return_output := result_is_device_ram_write_MUX_uxn_device_h_l124_c7_3d44_return_output;

     -- vram_addr_MUX[uxn_device_h_l125_c3_2150] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l125_c3_2150_cond <= VAR_vram_addr_MUX_uxn_device_h_l125_c3_2150_cond;
     vram_addr_MUX_uxn_device_h_l125_c3_2150_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l125_c3_2150_iftrue;
     vram_addr_MUX_uxn_device_h_l125_c3_2150_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l125_c3_2150_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l125_c3_2150_return_output := vram_addr_MUX_uxn_device_h_l125_c3_2150_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l95_c7_f81e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l95_c7_f81e_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l95_c7_f81e_cond;
     result_is_vram_write_MUX_uxn_device_h_l95_c7_f81e_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l95_c7_f81e_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l95_c7_f81e_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l95_c7_f81e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l95_c7_f81e_return_output := result_is_vram_write_MUX_uxn_device_h_l95_c7_f81e_return_output;

     -- x_MUX[uxn_device_h_l107_c7_5fb4] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l107_c7_5fb4_cond <= VAR_x_MUX_uxn_device_h_l107_c7_5fb4_cond;
     x_MUX_uxn_device_h_l107_c7_5fb4_iftrue <= VAR_x_MUX_uxn_device_h_l107_c7_5fb4_iftrue;
     x_MUX_uxn_device_h_l107_c7_5fb4_iffalse <= VAR_x_MUX_uxn_device_h_l107_c7_5fb4_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l107_c7_5fb4_return_output := x_MUX_uxn_device_h_l107_c7_5fb4_return_output;

     -- ram_addr_MUX[uxn_device_h_l118_c7_d5ea] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l118_c7_d5ea_cond <= VAR_ram_addr_MUX_uxn_device_h_l118_c7_d5ea_cond;
     ram_addr_MUX_uxn_device_h_l118_c7_d5ea_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l118_c7_d5ea_iftrue;
     ram_addr_MUX_uxn_device_h_l118_c7_d5ea_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l118_c7_d5ea_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l118_c7_d5ea_return_output := ram_addr_MUX_uxn_device_h_l118_c7_d5ea_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l118_c7_d5ea] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l118_c7_d5ea_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l118_c7_d5ea_cond;
     result_is_deo_done_MUX_uxn_device_h_l118_c7_d5ea_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l118_c7_d5ea_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l118_c7_d5ea_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l118_c7_d5ea_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l118_c7_d5ea_return_output := result_is_deo_done_MUX_uxn_device_h_l118_c7_d5ea_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l124_c7_3d44] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l124_c7_3d44_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_3d44_cond;
     result_device_ram_address_MUX_uxn_device_h_l124_c7_3d44_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_3d44_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l124_c7_3d44_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_3d44_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_3d44_return_output := result_device_ram_address_MUX_uxn_device_h_l124_c7_3d44_return_output;

     -- y_MUX[uxn_device_h_l84_c7_0b55] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l84_c7_0b55_cond <= VAR_y_MUX_uxn_device_h_l84_c7_0b55_cond;
     y_MUX_uxn_device_h_l84_c7_0b55_iftrue <= VAR_y_MUX_uxn_device_h_l84_c7_0b55_iftrue;
     y_MUX_uxn_device_h_l84_c7_0b55_iffalse <= VAR_y_MUX_uxn_device_h_l84_c7_0b55_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l84_c7_0b55_return_output := y_MUX_uxn_device_h_l84_c7_0b55_return_output;

     -- auto_advance_MUX[uxn_device_h_l89_c7_6231] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l89_c7_6231_cond <= VAR_auto_advance_MUX_uxn_device_h_l89_c7_6231_cond;
     auto_advance_MUX_uxn_device_h_l89_c7_6231_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l89_c7_6231_iftrue;
     auto_advance_MUX_uxn_device_h_l89_c7_6231_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l89_c7_6231_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l89_c7_6231_return_output := auto_advance_MUX_uxn_device_h_l89_c7_6231_return_output;

     -- Submodule level 9
     VAR_auto_advance_MUX_uxn_device_h_l84_c7_0b55_iffalse := VAR_auto_advance_MUX_uxn_device_h_l89_c7_6231_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l112_c7_82e8_iffalse := VAR_ram_addr_MUX_uxn_device_h_l118_c7_d5ea_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l118_c7_d5ea_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_3d44_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l112_c7_82e8_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l118_c7_d5ea_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l118_c7_d5ea_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l124_c7_3d44_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_6231_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l95_c7_f81e_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l118_c7_d5ea_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l124_c7_3d44_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l124_c7_3d44_iftrue := VAR_result_vram_address_MUX_uxn_device_h_l125_c3_2150_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l84_c7_0b55_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l89_c7_6231_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l124_c7_3d44_iftrue := VAR_vram_addr_MUX_uxn_device_h_l125_c3_2150_return_output;
     VAR_x_MUX_uxn_device_h_l100_c7_ba7b_iffalse := VAR_x_MUX_uxn_device_h_l107_c7_5fb4_return_output;
     VAR_y_MUX_uxn_device_h_l77_c7_76e7_iffalse := VAR_y_MUX_uxn_device_h_l84_c7_0b55_return_output;
     -- result_vram_write_layer_MUX[uxn_device_h_l84_c7_0b55] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l84_c7_0b55_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l84_c7_0b55_cond;
     result_vram_write_layer_MUX_uxn_device_h_l84_c7_0b55_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l84_c7_0b55_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l84_c7_0b55_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l84_c7_0b55_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l84_c7_0b55_return_output := result_vram_write_layer_MUX_uxn_device_h_l84_c7_0b55_return_output;

     -- vram_addr_MUX[uxn_device_h_l124_c7_3d44] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l124_c7_3d44_cond <= VAR_vram_addr_MUX_uxn_device_h_l124_c7_3d44_cond;
     vram_addr_MUX_uxn_device_h_l124_c7_3d44_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l124_c7_3d44_iftrue;
     vram_addr_MUX_uxn_device_h_l124_c7_3d44_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l124_c7_3d44_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l124_c7_3d44_return_output := vram_addr_MUX_uxn_device_h_l124_c7_3d44_return_output;

     -- x_MUX[uxn_device_h_l100_c7_ba7b] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l100_c7_ba7b_cond <= VAR_x_MUX_uxn_device_h_l100_c7_ba7b_cond;
     x_MUX_uxn_device_h_l100_c7_ba7b_iftrue <= VAR_x_MUX_uxn_device_h_l100_c7_ba7b_iftrue;
     x_MUX_uxn_device_h_l100_c7_ba7b_iffalse <= VAR_x_MUX_uxn_device_h_l100_c7_ba7b_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l100_c7_ba7b_return_output := x_MUX_uxn_device_h_l100_c7_ba7b_return_output;

     -- result_u8_value_MUX[uxn_device_h_l118_c7_d5ea] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l118_c7_d5ea_cond <= VAR_result_u8_value_MUX_uxn_device_h_l118_c7_d5ea_cond;
     result_u8_value_MUX_uxn_device_h_l118_c7_d5ea_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l118_c7_d5ea_iftrue;
     result_u8_value_MUX_uxn_device_h_l118_c7_d5ea_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l118_c7_d5ea_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l118_c7_d5ea_return_output := result_u8_value_MUX_uxn_device_h_l118_c7_d5ea_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l112_c7_82e8] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l112_c7_82e8_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l112_c7_82e8_cond;
     result_is_deo_done_MUX_uxn_device_h_l112_c7_82e8_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l112_c7_82e8_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l112_c7_82e8_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l112_c7_82e8_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l112_c7_82e8_return_output := result_is_deo_done_MUX_uxn_device_h_l112_c7_82e8_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l118_c7_d5ea] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l118_c7_d5ea_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l118_c7_d5ea_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l118_c7_d5ea_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l118_c7_d5ea_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l118_c7_d5ea_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l118_c7_d5ea_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l118_c7_d5ea_return_output := result_is_device_ram_write_MUX_uxn_device_h_l118_c7_d5ea_return_output;

     -- result_vram_address_MUX[uxn_device_h_l124_c7_3d44] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l124_c7_3d44_cond <= VAR_result_vram_address_MUX_uxn_device_h_l124_c7_3d44_cond;
     result_vram_address_MUX_uxn_device_h_l124_c7_3d44_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l124_c7_3d44_iftrue;
     result_vram_address_MUX_uxn_device_h_l124_c7_3d44_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l124_c7_3d44_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l124_c7_3d44_return_output := result_vram_address_MUX_uxn_device_h_l124_c7_3d44_return_output;

     -- y_MUX[uxn_device_h_l77_c7_76e7] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l77_c7_76e7_cond <= VAR_y_MUX_uxn_device_h_l77_c7_76e7_cond;
     y_MUX_uxn_device_h_l77_c7_76e7_iftrue <= VAR_y_MUX_uxn_device_h_l77_c7_76e7_iftrue;
     y_MUX_uxn_device_h_l77_c7_76e7_iffalse <= VAR_y_MUX_uxn_device_h_l77_c7_76e7_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l77_c7_76e7_return_output := y_MUX_uxn_device_h_l77_c7_76e7_return_output;

     -- auto_advance_MUX[uxn_device_h_l84_c7_0b55] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l84_c7_0b55_cond <= VAR_auto_advance_MUX_uxn_device_h_l84_c7_0b55_cond;
     auto_advance_MUX_uxn_device_h_l84_c7_0b55_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l84_c7_0b55_iftrue;
     auto_advance_MUX_uxn_device_h_l84_c7_0b55_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l84_c7_0b55_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l84_c7_0b55_return_output := auto_advance_MUX_uxn_device_h_l84_c7_0b55_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l89_c7_6231] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l89_c7_6231_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_6231_cond;
     result_is_vram_write_MUX_uxn_device_h_l89_c7_6231_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_6231_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l89_c7_6231_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_6231_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_6231_return_output := result_is_vram_write_MUX_uxn_device_h_l89_c7_6231_return_output;

     -- ram_addr_MUX[uxn_device_h_l112_c7_82e8] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l112_c7_82e8_cond <= VAR_ram_addr_MUX_uxn_device_h_l112_c7_82e8_cond;
     ram_addr_MUX_uxn_device_h_l112_c7_82e8_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l112_c7_82e8_iftrue;
     ram_addr_MUX_uxn_device_h_l112_c7_82e8_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l112_c7_82e8_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l112_c7_82e8_return_output := ram_addr_MUX_uxn_device_h_l112_c7_82e8_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l118_c7_d5ea] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l118_c7_d5ea_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l118_c7_d5ea_cond;
     result_device_ram_address_MUX_uxn_device_h_l118_c7_d5ea_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l118_c7_d5ea_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l118_c7_d5ea_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l118_c7_d5ea_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l118_c7_d5ea_return_output := result_device_ram_address_MUX_uxn_device_h_l118_c7_d5ea_return_output;

     -- Submodule level 10
     VAR_auto_advance_MUX_uxn_device_h_l77_c7_76e7_iffalse := VAR_auto_advance_MUX_uxn_device_h_l84_c7_0b55_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l107_c7_5fb4_iffalse := VAR_ram_addr_MUX_uxn_device_h_l112_c7_82e8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l112_c7_82e8_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l118_c7_d5ea_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_5fb4_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l112_c7_82e8_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l112_c7_82e8_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l118_c7_d5ea_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l84_c7_0b55_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_6231_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l112_c7_82e8_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l118_c7_d5ea_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l118_c7_d5ea_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l124_c7_3d44_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l77_c7_76e7_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l84_c7_0b55_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l118_c7_d5ea_iffalse := VAR_vram_addr_MUX_uxn_device_h_l124_c7_3d44_return_output;
     VAR_x_MUX_uxn_device_h_l95_c7_f81e_iffalse := VAR_x_MUX_uxn_device_h_l100_c7_ba7b_return_output;
     VAR_y_MUX_uxn_device_h_l72_c7_470e_iffalse := VAR_y_MUX_uxn_device_h_l77_c7_76e7_return_output;
     -- vram_addr_MUX[uxn_device_h_l118_c7_d5ea] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l118_c7_d5ea_cond <= VAR_vram_addr_MUX_uxn_device_h_l118_c7_d5ea_cond;
     vram_addr_MUX_uxn_device_h_l118_c7_d5ea_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l118_c7_d5ea_iftrue;
     vram_addr_MUX_uxn_device_h_l118_c7_d5ea_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l118_c7_d5ea_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l118_c7_d5ea_return_output := vram_addr_MUX_uxn_device_h_l118_c7_d5ea_return_output;

     -- result_u8_value_MUX[uxn_device_h_l112_c7_82e8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l112_c7_82e8_cond <= VAR_result_u8_value_MUX_uxn_device_h_l112_c7_82e8_cond;
     result_u8_value_MUX_uxn_device_h_l112_c7_82e8_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l112_c7_82e8_iftrue;
     result_u8_value_MUX_uxn_device_h_l112_c7_82e8_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l112_c7_82e8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l112_c7_82e8_return_output := result_u8_value_MUX_uxn_device_h_l112_c7_82e8_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l112_c7_82e8] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l112_c7_82e8_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l112_c7_82e8_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l112_c7_82e8_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l112_c7_82e8_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l112_c7_82e8_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l112_c7_82e8_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l112_c7_82e8_return_output := result_is_device_ram_write_MUX_uxn_device_h_l112_c7_82e8_return_output;

     -- y_MUX[uxn_device_h_l72_c7_470e] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l72_c7_470e_cond <= VAR_y_MUX_uxn_device_h_l72_c7_470e_cond;
     y_MUX_uxn_device_h_l72_c7_470e_iftrue <= VAR_y_MUX_uxn_device_h_l72_c7_470e_iftrue;
     y_MUX_uxn_device_h_l72_c7_470e_iffalse <= VAR_y_MUX_uxn_device_h_l72_c7_470e_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l72_c7_470e_return_output := y_MUX_uxn_device_h_l72_c7_470e_return_output;

     -- auto_advance_MUX[uxn_device_h_l77_c7_76e7] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l77_c7_76e7_cond <= VAR_auto_advance_MUX_uxn_device_h_l77_c7_76e7_cond;
     auto_advance_MUX_uxn_device_h_l77_c7_76e7_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l77_c7_76e7_iftrue;
     auto_advance_MUX_uxn_device_h_l77_c7_76e7_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l77_c7_76e7_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l77_c7_76e7_return_output := auto_advance_MUX_uxn_device_h_l77_c7_76e7_return_output;

     -- result_vram_address_MUX[uxn_device_h_l118_c7_d5ea] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l118_c7_d5ea_cond <= VAR_result_vram_address_MUX_uxn_device_h_l118_c7_d5ea_cond;
     result_vram_address_MUX_uxn_device_h_l118_c7_d5ea_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l118_c7_d5ea_iftrue;
     result_vram_address_MUX_uxn_device_h_l118_c7_d5ea_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l118_c7_d5ea_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l118_c7_d5ea_return_output := result_vram_address_MUX_uxn_device_h_l118_c7_d5ea_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l77_c7_76e7] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l77_c7_76e7_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l77_c7_76e7_cond;
     result_vram_write_layer_MUX_uxn_device_h_l77_c7_76e7_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l77_c7_76e7_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l77_c7_76e7_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l77_c7_76e7_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l77_c7_76e7_return_output := result_vram_write_layer_MUX_uxn_device_h_l77_c7_76e7_return_output;

     -- ram_addr_MUX[uxn_device_h_l107_c7_5fb4] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l107_c7_5fb4_cond <= VAR_ram_addr_MUX_uxn_device_h_l107_c7_5fb4_cond;
     ram_addr_MUX_uxn_device_h_l107_c7_5fb4_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l107_c7_5fb4_iftrue;
     ram_addr_MUX_uxn_device_h_l107_c7_5fb4_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l107_c7_5fb4_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l107_c7_5fb4_return_output := ram_addr_MUX_uxn_device_h_l107_c7_5fb4_return_output;

     -- x_MUX[uxn_device_h_l95_c7_f81e] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l95_c7_f81e_cond <= VAR_x_MUX_uxn_device_h_l95_c7_f81e_cond;
     x_MUX_uxn_device_h_l95_c7_f81e_iftrue <= VAR_x_MUX_uxn_device_h_l95_c7_f81e_iftrue;
     x_MUX_uxn_device_h_l95_c7_f81e_iffalse <= VAR_x_MUX_uxn_device_h_l95_c7_f81e_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l95_c7_f81e_return_output := x_MUX_uxn_device_h_l95_c7_f81e_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l107_c7_5fb4] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l107_c7_5fb4_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_5fb4_cond;
     result_is_deo_done_MUX_uxn_device_h_l107_c7_5fb4_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_5fb4_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l107_c7_5fb4_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_5fb4_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_5fb4_return_output := result_is_deo_done_MUX_uxn_device_h_l107_c7_5fb4_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l84_c7_0b55] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l84_c7_0b55_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l84_c7_0b55_cond;
     result_is_vram_write_MUX_uxn_device_h_l84_c7_0b55_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l84_c7_0b55_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l84_c7_0b55_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l84_c7_0b55_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l84_c7_0b55_return_output := result_is_vram_write_MUX_uxn_device_h_l84_c7_0b55_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l112_c7_82e8] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l112_c7_82e8_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l112_c7_82e8_cond;
     result_device_ram_address_MUX_uxn_device_h_l112_c7_82e8_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l112_c7_82e8_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l112_c7_82e8_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l112_c7_82e8_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l112_c7_82e8_return_output := result_device_ram_address_MUX_uxn_device_h_l112_c7_82e8_return_output;

     -- Submodule level 11
     VAR_auto_advance_MUX_uxn_device_h_l72_c7_470e_iffalse := VAR_auto_advance_MUX_uxn_device_h_l77_c7_76e7_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l100_c7_ba7b_iffalse := VAR_ram_addr_MUX_uxn_device_h_l107_c7_5fb4_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_5fb4_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l112_c7_82e8_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c7_ba7b_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_5fb4_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l107_c7_5fb4_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l112_c7_82e8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l77_c7_76e7_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l84_c7_0b55_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l107_c7_5fb4_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l112_c7_82e8_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l112_c7_82e8_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l118_c7_d5ea_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l72_c7_470e_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l77_c7_76e7_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l112_c7_82e8_iffalse := VAR_vram_addr_MUX_uxn_device_h_l118_c7_d5ea_return_output;
     VAR_x_MUX_uxn_device_h_l89_c7_6231_iffalse := VAR_x_MUX_uxn_device_h_l95_c7_f81e_return_output;
     VAR_y_MUX_uxn_device_h_l61_c7_5d0a_iffalse := VAR_y_MUX_uxn_device_h_l72_c7_470e_return_output;
     -- auto_advance_MUX[uxn_device_h_l72_c7_470e] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l72_c7_470e_cond <= VAR_auto_advance_MUX_uxn_device_h_l72_c7_470e_cond;
     auto_advance_MUX_uxn_device_h_l72_c7_470e_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l72_c7_470e_iftrue;
     auto_advance_MUX_uxn_device_h_l72_c7_470e_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l72_c7_470e_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l72_c7_470e_return_output := auto_advance_MUX_uxn_device_h_l72_c7_470e_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l77_c7_76e7] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l77_c7_76e7_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l77_c7_76e7_cond;
     result_is_vram_write_MUX_uxn_device_h_l77_c7_76e7_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l77_c7_76e7_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l77_c7_76e7_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l77_c7_76e7_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l77_c7_76e7_return_output := result_is_vram_write_MUX_uxn_device_h_l77_c7_76e7_return_output;

     -- y_MUX[uxn_device_h_l61_c7_5d0a] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l61_c7_5d0a_cond <= VAR_y_MUX_uxn_device_h_l61_c7_5d0a_cond;
     y_MUX_uxn_device_h_l61_c7_5d0a_iftrue <= VAR_y_MUX_uxn_device_h_l61_c7_5d0a_iftrue;
     y_MUX_uxn_device_h_l61_c7_5d0a_iffalse <= VAR_y_MUX_uxn_device_h_l61_c7_5d0a_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l61_c7_5d0a_return_output := y_MUX_uxn_device_h_l61_c7_5d0a_return_output;

     -- ram_addr_MUX[uxn_device_h_l100_c7_ba7b] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l100_c7_ba7b_cond <= VAR_ram_addr_MUX_uxn_device_h_l100_c7_ba7b_cond;
     ram_addr_MUX_uxn_device_h_l100_c7_ba7b_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l100_c7_ba7b_iftrue;
     ram_addr_MUX_uxn_device_h_l100_c7_ba7b_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l100_c7_ba7b_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l100_c7_ba7b_return_output := ram_addr_MUX_uxn_device_h_l100_c7_ba7b_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l72_c7_470e] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l72_c7_470e_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l72_c7_470e_cond;
     result_vram_write_layer_MUX_uxn_device_h_l72_c7_470e_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l72_c7_470e_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l72_c7_470e_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l72_c7_470e_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l72_c7_470e_return_output := result_vram_write_layer_MUX_uxn_device_h_l72_c7_470e_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l100_c7_ba7b] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l100_c7_ba7b_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l100_c7_ba7b_cond;
     result_is_deo_done_MUX_uxn_device_h_l100_c7_ba7b_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l100_c7_ba7b_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l100_c7_ba7b_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l100_c7_ba7b_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c7_ba7b_return_output := result_is_deo_done_MUX_uxn_device_h_l100_c7_ba7b_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l107_c7_5fb4] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l107_c7_5fb4_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_5fb4_cond;
     result_device_ram_address_MUX_uxn_device_h_l107_c7_5fb4_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_5fb4_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l107_c7_5fb4_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_5fb4_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_5fb4_return_output := result_device_ram_address_MUX_uxn_device_h_l107_c7_5fb4_return_output;

     -- result_vram_address_MUX[uxn_device_h_l112_c7_82e8] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l112_c7_82e8_cond <= VAR_result_vram_address_MUX_uxn_device_h_l112_c7_82e8_cond;
     result_vram_address_MUX_uxn_device_h_l112_c7_82e8_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l112_c7_82e8_iftrue;
     result_vram_address_MUX_uxn_device_h_l112_c7_82e8_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l112_c7_82e8_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l112_c7_82e8_return_output := result_vram_address_MUX_uxn_device_h_l112_c7_82e8_return_output;

     -- vram_addr_MUX[uxn_device_h_l112_c7_82e8] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l112_c7_82e8_cond <= VAR_vram_addr_MUX_uxn_device_h_l112_c7_82e8_cond;
     vram_addr_MUX_uxn_device_h_l112_c7_82e8_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l112_c7_82e8_iftrue;
     vram_addr_MUX_uxn_device_h_l112_c7_82e8_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l112_c7_82e8_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l112_c7_82e8_return_output := vram_addr_MUX_uxn_device_h_l112_c7_82e8_return_output;

     -- x_MUX[uxn_device_h_l89_c7_6231] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l89_c7_6231_cond <= VAR_x_MUX_uxn_device_h_l89_c7_6231_cond;
     x_MUX_uxn_device_h_l89_c7_6231_iftrue <= VAR_x_MUX_uxn_device_h_l89_c7_6231_iftrue;
     x_MUX_uxn_device_h_l89_c7_6231_iffalse <= VAR_x_MUX_uxn_device_h_l89_c7_6231_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l89_c7_6231_return_output := x_MUX_uxn_device_h_l89_c7_6231_return_output;

     -- result_u8_value_MUX[uxn_device_h_l107_c7_5fb4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l107_c7_5fb4_cond <= VAR_result_u8_value_MUX_uxn_device_h_l107_c7_5fb4_cond;
     result_u8_value_MUX_uxn_device_h_l107_c7_5fb4_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l107_c7_5fb4_iftrue;
     result_u8_value_MUX_uxn_device_h_l107_c7_5fb4_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l107_c7_5fb4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l107_c7_5fb4_return_output := result_u8_value_MUX_uxn_device_h_l107_c7_5fb4_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l107_c7_5fb4] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l107_c7_5fb4_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l107_c7_5fb4_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l107_c7_5fb4_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l107_c7_5fb4_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l107_c7_5fb4_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l107_c7_5fb4_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l107_c7_5fb4_return_output := result_is_device_ram_write_MUX_uxn_device_h_l107_c7_5fb4_return_output;

     -- Submodule level 12
     VAR_auto_advance_MUX_uxn_device_h_l61_c7_5d0a_iffalse := VAR_auto_advance_MUX_uxn_device_h_l72_c7_470e_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l95_c7_f81e_iffalse := VAR_ram_addr_MUX_uxn_device_h_l100_c7_ba7b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c7_ba7b_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_5fb4_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l95_c7_f81e_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l100_c7_ba7b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l100_c7_ba7b_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l107_c7_5fb4_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_470e_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l77_c7_76e7_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l100_c7_ba7b_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l107_c7_5fb4_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l107_c7_5fb4_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l112_c7_82e8_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l61_c7_5d0a_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l72_c7_470e_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l107_c7_5fb4_iffalse := VAR_vram_addr_MUX_uxn_device_h_l112_c7_82e8_return_output;
     VAR_x_MUX_uxn_device_h_l84_c7_0b55_iffalse := VAR_x_MUX_uxn_device_h_l89_c7_6231_return_output;
     VAR_y_MUX_uxn_device_h_l56_c7_f9d9_iffalse := VAR_y_MUX_uxn_device_h_l61_c7_5d0a_return_output;
     -- result_is_deo_done_MUX[uxn_device_h_l95_c7_f81e] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l95_c7_f81e_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l95_c7_f81e_cond;
     result_is_deo_done_MUX_uxn_device_h_l95_c7_f81e_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l95_c7_f81e_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l95_c7_f81e_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l95_c7_f81e_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l95_c7_f81e_return_output := result_is_deo_done_MUX_uxn_device_h_l95_c7_f81e_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l72_c7_470e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l72_c7_470e_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_470e_cond;
     result_is_vram_write_MUX_uxn_device_h_l72_c7_470e_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_470e_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l72_c7_470e_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_470e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_470e_return_output := result_is_vram_write_MUX_uxn_device_h_l72_c7_470e_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l100_c7_ba7b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l100_c7_ba7b_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l100_c7_ba7b_cond;
     result_device_ram_address_MUX_uxn_device_h_l100_c7_ba7b_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l100_c7_ba7b_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l100_c7_ba7b_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l100_c7_ba7b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c7_ba7b_return_output := result_device_ram_address_MUX_uxn_device_h_l100_c7_ba7b_return_output;

     -- x_MUX[uxn_device_h_l84_c7_0b55] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l84_c7_0b55_cond <= VAR_x_MUX_uxn_device_h_l84_c7_0b55_cond;
     x_MUX_uxn_device_h_l84_c7_0b55_iftrue <= VAR_x_MUX_uxn_device_h_l84_c7_0b55_iftrue;
     x_MUX_uxn_device_h_l84_c7_0b55_iffalse <= VAR_x_MUX_uxn_device_h_l84_c7_0b55_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l84_c7_0b55_return_output := x_MUX_uxn_device_h_l84_c7_0b55_return_output;

     -- auto_advance_MUX[uxn_device_h_l61_c7_5d0a] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l61_c7_5d0a_cond <= VAR_auto_advance_MUX_uxn_device_h_l61_c7_5d0a_cond;
     auto_advance_MUX_uxn_device_h_l61_c7_5d0a_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l61_c7_5d0a_iftrue;
     auto_advance_MUX_uxn_device_h_l61_c7_5d0a_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l61_c7_5d0a_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l61_c7_5d0a_return_output := auto_advance_MUX_uxn_device_h_l61_c7_5d0a_return_output;

     -- y_MUX[uxn_device_h_l56_c7_f9d9] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l56_c7_f9d9_cond <= VAR_y_MUX_uxn_device_h_l56_c7_f9d9_cond;
     y_MUX_uxn_device_h_l56_c7_f9d9_iftrue <= VAR_y_MUX_uxn_device_h_l56_c7_f9d9_iftrue;
     y_MUX_uxn_device_h_l56_c7_f9d9_iffalse <= VAR_y_MUX_uxn_device_h_l56_c7_f9d9_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l56_c7_f9d9_return_output := y_MUX_uxn_device_h_l56_c7_f9d9_return_output;

     -- result_u8_value_MUX[uxn_device_h_l100_c7_ba7b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l100_c7_ba7b_cond <= VAR_result_u8_value_MUX_uxn_device_h_l100_c7_ba7b_cond;
     result_u8_value_MUX_uxn_device_h_l100_c7_ba7b_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l100_c7_ba7b_iftrue;
     result_u8_value_MUX_uxn_device_h_l100_c7_ba7b_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l100_c7_ba7b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l100_c7_ba7b_return_output := result_u8_value_MUX_uxn_device_h_l100_c7_ba7b_return_output;

     -- result_vram_address_MUX[uxn_device_h_l107_c7_5fb4] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l107_c7_5fb4_cond <= VAR_result_vram_address_MUX_uxn_device_h_l107_c7_5fb4_cond;
     result_vram_address_MUX_uxn_device_h_l107_c7_5fb4_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l107_c7_5fb4_iftrue;
     result_vram_address_MUX_uxn_device_h_l107_c7_5fb4_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l107_c7_5fb4_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l107_c7_5fb4_return_output := result_vram_address_MUX_uxn_device_h_l107_c7_5fb4_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l100_c7_ba7b] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l100_c7_ba7b_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l100_c7_ba7b_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l100_c7_ba7b_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l100_c7_ba7b_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l100_c7_ba7b_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l100_c7_ba7b_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l100_c7_ba7b_return_output := result_is_device_ram_write_MUX_uxn_device_h_l100_c7_ba7b_return_output;

     -- vram_addr_MUX[uxn_device_h_l107_c7_5fb4] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l107_c7_5fb4_cond <= VAR_vram_addr_MUX_uxn_device_h_l107_c7_5fb4_cond;
     vram_addr_MUX_uxn_device_h_l107_c7_5fb4_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l107_c7_5fb4_iftrue;
     vram_addr_MUX_uxn_device_h_l107_c7_5fb4_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l107_c7_5fb4_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l107_c7_5fb4_return_output := vram_addr_MUX_uxn_device_h_l107_c7_5fb4_return_output;

     -- ram_addr_MUX[uxn_device_h_l95_c7_f81e] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l95_c7_f81e_cond <= VAR_ram_addr_MUX_uxn_device_h_l95_c7_f81e_cond;
     ram_addr_MUX_uxn_device_h_l95_c7_f81e_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l95_c7_f81e_iftrue;
     ram_addr_MUX_uxn_device_h_l95_c7_f81e_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l95_c7_f81e_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l95_c7_f81e_return_output := ram_addr_MUX_uxn_device_h_l95_c7_f81e_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l61_c7_5d0a] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l61_c7_5d0a_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l61_c7_5d0a_cond;
     result_vram_write_layer_MUX_uxn_device_h_l61_c7_5d0a_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l61_c7_5d0a_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l61_c7_5d0a_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l61_c7_5d0a_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l61_c7_5d0a_return_output := result_vram_write_layer_MUX_uxn_device_h_l61_c7_5d0a_return_output;

     -- Submodule level 13
     VAR_auto_advance_MUX_uxn_device_h_l56_c7_f9d9_iffalse := VAR_auto_advance_MUX_uxn_device_h_l61_c7_5d0a_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l89_c7_6231_iffalse := VAR_ram_addr_MUX_uxn_device_h_l95_c7_f81e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l95_c7_f81e_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l100_c7_ba7b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_6231_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l95_c7_f81e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l95_c7_f81e_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l100_c7_ba7b_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l61_c7_5d0a_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_470e_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l95_c7_f81e_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l100_c7_ba7b_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l100_c7_ba7b_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l107_c7_5fb4_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l56_c7_f9d9_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l61_c7_5d0a_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l100_c7_ba7b_iffalse := VAR_vram_addr_MUX_uxn_device_h_l107_c7_5fb4_return_output;
     VAR_x_MUX_uxn_device_h_l77_c7_76e7_iffalse := VAR_x_MUX_uxn_device_h_l84_c7_0b55_return_output;
     VAR_y_MUX_uxn_device_h_l42_c2_c27c_iffalse := VAR_y_MUX_uxn_device_h_l56_c7_f9d9_return_output;
     -- result_is_device_ram_write_MUX[uxn_device_h_l95_c7_f81e] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l95_c7_f81e_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l95_c7_f81e_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l95_c7_f81e_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l95_c7_f81e_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l95_c7_f81e_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l95_c7_f81e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l95_c7_f81e_return_output := result_is_device_ram_write_MUX_uxn_device_h_l95_c7_f81e_return_output;

     -- ram_addr_MUX[uxn_device_h_l89_c7_6231] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l89_c7_6231_cond <= VAR_ram_addr_MUX_uxn_device_h_l89_c7_6231_cond;
     ram_addr_MUX_uxn_device_h_l89_c7_6231_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l89_c7_6231_iftrue;
     ram_addr_MUX_uxn_device_h_l89_c7_6231_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l89_c7_6231_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l89_c7_6231_return_output := ram_addr_MUX_uxn_device_h_l89_c7_6231_return_output;

     -- auto_advance_MUX[uxn_device_h_l56_c7_f9d9] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l56_c7_f9d9_cond <= VAR_auto_advance_MUX_uxn_device_h_l56_c7_f9d9_cond;
     auto_advance_MUX_uxn_device_h_l56_c7_f9d9_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l56_c7_f9d9_iftrue;
     auto_advance_MUX_uxn_device_h_l56_c7_f9d9_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l56_c7_f9d9_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l56_c7_f9d9_return_output := auto_advance_MUX_uxn_device_h_l56_c7_f9d9_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l56_c7_f9d9] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l56_c7_f9d9_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l56_c7_f9d9_cond;
     result_vram_write_layer_MUX_uxn_device_h_l56_c7_f9d9_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l56_c7_f9d9_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l56_c7_f9d9_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l56_c7_f9d9_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l56_c7_f9d9_return_output := result_vram_write_layer_MUX_uxn_device_h_l56_c7_f9d9_return_output;

     -- result_vram_address_MUX[uxn_device_h_l100_c7_ba7b] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l100_c7_ba7b_cond <= VAR_result_vram_address_MUX_uxn_device_h_l100_c7_ba7b_cond;
     result_vram_address_MUX_uxn_device_h_l100_c7_ba7b_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l100_c7_ba7b_iftrue;
     result_vram_address_MUX_uxn_device_h_l100_c7_ba7b_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l100_c7_ba7b_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l100_c7_ba7b_return_output := result_vram_address_MUX_uxn_device_h_l100_c7_ba7b_return_output;

     -- y_MUX[uxn_device_h_l42_c2_c27c] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l42_c2_c27c_cond <= VAR_y_MUX_uxn_device_h_l42_c2_c27c_cond;
     y_MUX_uxn_device_h_l42_c2_c27c_iftrue <= VAR_y_MUX_uxn_device_h_l42_c2_c27c_iftrue;
     y_MUX_uxn_device_h_l42_c2_c27c_iffalse <= VAR_y_MUX_uxn_device_h_l42_c2_c27c_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l42_c2_c27c_return_output := y_MUX_uxn_device_h_l42_c2_c27c_return_output;

     -- x_MUX[uxn_device_h_l77_c7_76e7] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l77_c7_76e7_cond <= VAR_x_MUX_uxn_device_h_l77_c7_76e7_cond;
     x_MUX_uxn_device_h_l77_c7_76e7_iftrue <= VAR_x_MUX_uxn_device_h_l77_c7_76e7_iftrue;
     x_MUX_uxn_device_h_l77_c7_76e7_iffalse <= VAR_x_MUX_uxn_device_h_l77_c7_76e7_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l77_c7_76e7_return_output := x_MUX_uxn_device_h_l77_c7_76e7_return_output;

     -- result_u8_value_MUX[uxn_device_h_l95_c7_f81e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l95_c7_f81e_cond <= VAR_result_u8_value_MUX_uxn_device_h_l95_c7_f81e_cond;
     result_u8_value_MUX_uxn_device_h_l95_c7_f81e_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l95_c7_f81e_iftrue;
     result_u8_value_MUX_uxn_device_h_l95_c7_f81e_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l95_c7_f81e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l95_c7_f81e_return_output := result_u8_value_MUX_uxn_device_h_l95_c7_f81e_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l61_c7_5d0a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l61_c7_5d0a_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l61_c7_5d0a_cond;
     result_is_vram_write_MUX_uxn_device_h_l61_c7_5d0a_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l61_c7_5d0a_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l61_c7_5d0a_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l61_c7_5d0a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l61_c7_5d0a_return_output := result_is_vram_write_MUX_uxn_device_h_l61_c7_5d0a_return_output;

     -- vram_addr_MUX[uxn_device_h_l100_c7_ba7b] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l100_c7_ba7b_cond <= VAR_vram_addr_MUX_uxn_device_h_l100_c7_ba7b_cond;
     vram_addr_MUX_uxn_device_h_l100_c7_ba7b_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l100_c7_ba7b_iftrue;
     vram_addr_MUX_uxn_device_h_l100_c7_ba7b_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l100_c7_ba7b_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l100_c7_ba7b_return_output := vram_addr_MUX_uxn_device_h_l100_c7_ba7b_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l89_c7_6231] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l89_c7_6231_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_6231_cond;
     result_is_deo_done_MUX_uxn_device_h_l89_c7_6231_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_6231_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l89_c7_6231_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_6231_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_6231_return_output := result_is_deo_done_MUX_uxn_device_h_l89_c7_6231_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l95_c7_f81e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l95_c7_f81e_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l95_c7_f81e_cond;
     result_device_ram_address_MUX_uxn_device_h_l95_c7_f81e_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l95_c7_f81e_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l95_c7_f81e_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l95_c7_f81e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l95_c7_f81e_return_output := result_device_ram_address_MUX_uxn_device_h_l95_c7_f81e_return_output;

     -- Submodule level 14
     VAR_auto_advance_MUX_uxn_device_h_l42_c2_c27c_iffalse := VAR_auto_advance_MUX_uxn_device_h_l56_c7_f9d9_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l84_c7_0b55_iffalse := VAR_ram_addr_MUX_uxn_device_h_l89_c7_6231_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_6231_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l95_c7_f81e_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l84_c7_0b55_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_6231_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l89_c7_6231_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l95_c7_f81e_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l56_c7_f9d9_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l61_c7_5d0a_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l89_c7_6231_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l95_c7_f81e_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l95_c7_f81e_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l100_c7_ba7b_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l42_c2_c27c_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l56_c7_f9d9_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l95_c7_f81e_iffalse := VAR_vram_addr_MUX_uxn_device_h_l100_c7_ba7b_return_output;
     VAR_x_MUX_uxn_device_h_l72_c7_470e_iffalse := VAR_x_MUX_uxn_device_h_l77_c7_76e7_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l42_c2_c27c_return_output;
     -- result_is_vram_write_MUX[uxn_device_h_l56_c7_f9d9] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l56_c7_f9d9_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l56_c7_f9d9_cond;
     result_is_vram_write_MUX_uxn_device_h_l56_c7_f9d9_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l56_c7_f9d9_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l56_c7_f9d9_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l56_c7_f9d9_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l56_c7_f9d9_return_output := result_is_vram_write_MUX_uxn_device_h_l56_c7_f9d9_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l42_c2_c27c] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l42_c2_c27c_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l42_c2_c27c_cond;
     result_vram_write_layer_MUX_uxn_device_h_l42_c2_c27c_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l42_c2_c27c_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l42_c2_c27c_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l42_c2_c27c_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l42_c2_c27c_return_output := result_vram_write_layer_MUX_uxn_device_h_l42_c2_c27c_return_output;

     -- result_vram_address_MUX[uxn_device_h_l95_c7_f81e] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l95_c7_f81e_cond <= VAR_result_vram_address_MUX_uxn_device_h_l95_c7_f81e_cond;
     result_vram_address_MUX_uxn_device_h_l95_c7_f81e_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l95_c7_f81e_iftrue;
     result_vram_address_MUX_uxn_device_h_l95_c7_f81e_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l95_c7_f81e_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l95_c7_f81e_return_output := result_vram_address_MUX_uxn_device_h_l95_c7_f81e_return_output;

     -- ram_addr_MUX[uxn_device_h_l84_c7_0b55] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l84_c7_0b55_cond <= VAR_ram_addr_MUX_uxn_device_h_l84_c7_0b55_cond;
     ram_addr_MUX_uxn_device_h_l84_c7_0b55_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l84_c7_0b55_iftrue;
     ram_addr_MUX_uxn_device_h_l84_c7_0b55_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l84_c7_0b55_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l84_c7_0b55_return_output := ram_addr_MUX_uxn_device_h_l84_c7_0b55_return_output;

     -- result_u8_value_MUX[uxn_device_h_l89_c7_6231] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l89_c7_6231_cond <= VAR_result_u8_value_MUX_uxn_device_h_l89_c7_6231_cond;
     result_u8_value_MUX_uxn_device_h_l89_c7_6231_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l89_c7_6231_iftrue;
     result_u8_value_MUX_uxn_device_h_l89_c7_6231_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l89_c7_6231_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l89_c7_6231_return_output := result_u8_value_MUX_uxn_device_h_l89_c7_6231_return_output;

     -- auto_advance_MUX[uxn_device_h_l42_c2_c27c] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l42_c2_c27c_cond <= VAR_auto_advance_MUX_uxn_device_h_l42_c2_c27c_cond;
     auto_advance_MUX_uxn_device_h_l42_c2_c27c_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l42_c2_c27c_iftrue;
     auto_advance_MUX_uxn_device_h_l42_c2_c27c_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l42_c2_c27c_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l42_c2_c27c_return_output := auto_advance_MUX_uxn_device_h_l42_c2_c27c_return_output;

     -- x_MUX[uxn_device_h_l72_c7_470e] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l72_c7_470e_cond <= VAR_x_MUX_uxn_device_h_l72_c7_470e_cond;
     x_MUX_uxn_device_h_l72_c7_470e_iftrue <= VAR_x_MUX_uxn_device_h_l72_c7_470e_iftrue;
     x_MUX_uxn_device_h_l72_c7_470e_iffalse <= VAR_x_MUX_uxn_device_h_l72_c7_470e_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l72_c7_470e_return_output := x_MUX_uxn_device_h_l72_c7_470e_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l89_c7_6231] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l89_c7_6231_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_6231_cond;
     result_device_ram_address_MUX_uxn_device_h_l89_c7_6231_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_6231_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l89_c7_6231_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_6231_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_6231_return_output := result_device_ram_address_MUX_uxn_device_h_l89_c7_6231_return_output;

     -- vram_addr_MUX[uxn_device_h_l95_c7_f81e] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l95_c7_f81e_cond <= VAR_vram_addr_MUX_uxn_device_h_l95_c7_f81e_cond;
     vram_addr_MUX_uxn_device_h_l95_c7_f81e_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l95_c7_f81e_iftrue;
     vram_addr_MUX_uxn_device_h_l95_c7_f81e_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l95_c7_f81e_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l95_c7_f81e_return_output := vram_addr_MUX_uxn_device_h_l95_c7_f81e_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l84_c7_0b55] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l84_c7_0b55_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l84_c7_0b55_cond;
     result_is_deo_done_MUX_uxn_device_h_l84_c7_0b55_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l84_c7_0b55_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l84_c7_0b55_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l84_c7_0b55_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l84_c7_0b55_return_output := result_is_deo_done_MUX_uxn_device_h_l84_c7_0b55_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l89_c7_6231] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l89_c7_6231_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l89_c7_6231_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l89_c7_6231_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l89_c7_6231_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l89_c7_6231_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l89_c7_6231_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l89_c7_6231_return_output := result_is_device_ram_write_MUX_uxn_device_h_l89_c7_6231_return_output;

     -- Submodule level 15
     REG_VAR_auto_advance := VAR_auto_advance_MUX_uxn_device_h_l42_c2_c27c_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l77_c7_76e7_iffalse := VAR_ram_addr_MUX_uxn_device_h_l84_c7_0b55_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l84_c7_0b55_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_6231_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l77_c7_76e7_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l84_c7_0b55_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l84_c7_0b55_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l89_c7_6231_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l42_c2_c27c_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l56_c7_f9d9_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l84_c7_0b55_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l89_c7_6231_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l89_c7_6231_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l95_c7_f81e_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l89_c7_6231_iffalse := VAR_vram_addr_MUX_uxn_device_h_l95_c7_f81e_return_output;
     VAR_x_MUX_uxn_device_h_l61_c7_5d0a_iffalse := VAR_x_MUX_uxn_device_h_l72_c7_470e_return_output;
     -- result_vram_address_MUX[uxn_device_h_l89_c7_6231] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l89_c7_6231_cond <= VAR_result_vram_address_MUX_uxn_device_h_l89_c7_6231_cond;
     result_vram_address_MUX_uxn_device_h_l89_c7_6231_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l89_c7_6231_iftrue;
     result_vram_address_MUX_uxn_device_h_l89_c7_6231_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l89_c7_6231_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l89_c7_6231_return_output := result_vram_address_MUX_uxn_device_h_l89_c7_6231_return_output;

     -- ram_addr_MUX[uxn_device_h_l77_c7_76e7] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l77_c7_76e7_cond <= VAR_ram_addr_MUX_uxn_device_h_l77_c7_76e7_cond;
     ram_addr_MUX_uxn_device_h_l77_c7_76e7_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l77_c7_76e7_iftrue;
     ram_addr_MUX_uxn_device_h_l77_c7_76e7_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l77_c7_76e7_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l77_c7_76e7_return_output := ram_addr_MUX_uxn_device_h_l77_c7_76e7_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l84_c7_0b55] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l84_c7_0b55_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l84_c7_0b55_cond;
     result_device_ram_address_MUX_uxn_device_h_l84_c7_0b55_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l84_c7_0b55_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l84_c7_0b55_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l84_c7_0b55_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l84_c7_0b55_return_output := result_device_ram_address_MUX_uxn_device_h_l84_c7_0b55_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l77_c7_76e7] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l77_c7_76e7_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l77_c7_76e7_cond;
     result_is_deo_done_MUX_uxn_device_h_l77_c7_76e7_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l77_c7_76e7_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l77_c7_76e7_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l77_c7_76e7_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l77_c7_76e7_return_output := result_is_deo_done_MUX_uxn_device_h_l77_c7_76e7_return_output;

     -- result_u8_value_MUX[uxn_device_h_l84_c7_0b55] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l84_c7_0b55_cond <= VAR_result_u8_value_MUX_uxn_device_h_l84_c7_0b55_cond;
     result_u8_value_MUX_uxn_device_h_l84_c7_0b55_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l84_c7_0b55_iftrue;
     result_u8_value_MUX_uxn_device_h_l84_c7_0b55_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l84_c7_0b55_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l84_c7_0b55_return_output := result_u8_value_MUX_uxn_device_h_l84_c7_0b55_return_output;

     -- vram_addr_MUX[uxn_device_h_l89_c7_6231] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l89_c7_6231_cond <= VAR_vram_addr_MUX_uxn_device_h_l89_c7_6231_cond;
     vram_addr_MUX_uxn_device_h_l89_c7_6231_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l89_c7_6231_iftrue;
     vram_addr_MUX_uxn_device_h_l89_c7_6231_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l89_c7_6231_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l89_c7_6231_return_output := vram_addr_MUX_uxn_device_h_l89_c7_6231_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l42_c2_c27c] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l42_c2_c27c_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l42_c2_c27c_cond;
     result_is_vram_write_MUX_uxn_device_h_l42_c2_c27c_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l42_c2_c27c_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l42_c2_c27c_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l42_c2_c27c_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l42_c2_c27c_return_output := result_is_vram_write_MUX_uxn_device_h_l42_c2_c27c_return_output;

     -- x_MUX[uxn_device_h_l61_c7_5d0a] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l61_c7_5d0a_cond <= VAR_x_MUX_uxn_device_h_l61_c7_5d0a_cond;
     x_MUX_uxn_device_h_l61_c7_5d0a_iftrue <= VAR_x_MUX_uxn_device_h_l61_c7_5d0a_iftrue;
     x_MUX_uxn_device_h_l61_c7_5d0a_iffalse <= VAR_x_MUX_uxn_device_h_l61_c7_5d0a_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l61_c7_5d0a_return_output := x_MUX_uxn_device_h_l61_c7_5d0a_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l84_c7_0b55] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l84_c7_0b55_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l84_c7_0b55_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l84_c7_0b55_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l84_c7_0b55_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l84_c7_0b55_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l84_c7_0b55_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l84_c7_0b55_return_output := result_is_device_ram_write_MUX_uxn_device_h_l84_c7_0b55_return_output;

     -- Submodule level 16
     VAR_ram_addr_MUX_uxn_device_h_l72_c7_470e_iffalse := VAR_ram_addr_MUX_uxn_device_h_l77_c7_76e7_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l77_c7_76e7_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l84_c7_0b55_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_470e_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l77_c7_76e7_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l77_c7_76e7_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l84_c7_0b55_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l77_c7_76e7_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l84_c7_0b55_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l84_c7_0b55_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l89_c7_6231_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l84_c7_0b55_iffalse := VAR_vram_addr_MUX_uxn_device_h_l89_c7_6231_return_output;
     VAR_x_MUX_uxn_device_h_l56_c7_f9d9_iffalse := VAR_x_MUX_uxn_device_h_l61_c7_5d0a_return_output;
     -- vram_addr_MUX[uxn_device_h_l84_c7_0b55] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l84_c7_0b55_cond <= VAR_vram_addr_MUX_uxn_device_h_l84_c7_0b55_cond;
     vram_addr_MUX_uxn_device_h_l84_c7_0b55_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l84_c7_0b55_iftrue;
     vram_addr_MUX_uxn_device_h_l84_c7_0b55_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l84_c7_0b55_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l84_c7_0b55_return_output := vram_addr_MUX_uxn_device_h_l84_c7_0b55_return_output;

     -- ram_addr_MUX[uxn_device_h_l72_c7_470e] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l72_c7_470e_cond <= VAR_ram_addr_MUX_uxn_device_h_l72_c7_470e_cond;
     ram_addr_MUX_uxn_device_h_l72_c7_470e_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l72_c7_470e_iftrue;
     ram_addr_MUX_uxn_device_h_l72_c7_470e_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l72_c7_470e_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l72_c7_470e_return_output := ram_addr_MUX_uxn_device_h_l72_c7_470e_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l77_c7_76e7] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l77_c7_76e7_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l77_c7_76e7_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l77_c7_76e7_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l77_c7_76e7_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l77_c7_76e7_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l77_c7_76e7_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l77_c7_76e7_return_output := result_is_device_ram_write_MUX_uxn_device_h_l77_c7_76e7_return_output;

     -- result_vram_address_MUX[uxn_device_h_l84_c7_0b55] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l84_c7_0b55_cond <= VAR_result_vram_address_MUX_uxn_device_h_l84_c7_0b55_cond;
     result_vram_address_MUX_uxn_device_h_l84_c7_0b55_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l84_c7_0b55_iftrue;
     result_vram_address_MUX_uxn_device_h_l84_c7_0b55_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l84_c7_0b55_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l84_c7_0b55_return_output := result_vram_address_MUX_uxn_device_h_l84_c7_0b55_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l77_c7_76e7] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l77_c7_76e7_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l77_c7_76e7_cond;
     result_device_ram_address_MUX_uxn_device_h_l77_c7_76e7_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l77_c7_76e7_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l77_c7_76e7_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l77_c7_76e7_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l77_c7_76e7_return_output := result_device_ram_address_MUX_uxn_device_h_l77_c7_76e7_return_output;

     -- result_u8_value_MUX[uxn_device_h_l77_c7_76e7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l77_c7_76e7_cond <= VAR_result_u8_value_MUX_uxn_device_h_l77_c7_76e7_cond;
     result_u8_value_MUX_uxn_device_h_l77_c7_76e7_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l77_c7_76e7_iftrue;
     result_u8_value_MUX_uxn_device_h_l77_c7_76e7_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l77_c7_76e7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l77_c7_76e7_return_output := result_u8_value_MUX_uxn_device_h_l77_c7_76e7_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l72_c7_470e] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l72_c7_470e_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_470e_cond;
     result_is_deo_done_MUX_uxn_device_h_l72_c7_470e_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_470e_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l72_c7_470e_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_470e_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_470e_return_output := result_is_deo_done_MUX_uxn_device_h_l72_c7_470e_return_output;

     -- x_MUX[uxn_device_h_l56_c7_f9d9] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l56_c7_f9d9_cond <= VAR_x_MUX_uxn_device_h_l56_c7_f9d9_cond;
     x_MUX_uxn_device_h_l56_c7_f9d9_iftrue <= VAR_x_MUX_uxn_device_h_l56_c7_f9d9_iftrue;
     x_MUX_uxn_device_h_l56_c7_f9d9_iffalse <= VAR_x_MUX_uxn_device_h_l56_c7_f9d9_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l56_c7_f9d9_return_output := x_MUX_uxn_device_h_l56_c7_f9d9_return_output;

     -- Submodule level 17
     VAR_ram_addr_MUX_uxn_device_h_l61_c7_5d0a_iffalse := VAR_ram_addr_MUX_uxn_device_h_l72_c7_470e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_470e_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l77_c7_76e7_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l61_c7_5d0a_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_470e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l72_c7_470e_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l77_c7_76e7_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l72_c7_470e_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l77_c7_76e7_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l77_c7_76e7_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l84_c7_0b55_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l77_c7_76e7_iffalse := VAR_vram_addr_MUX_uxn_device_h_l84_c7_0b55_return_output;
     VAR_x_MUX_uxn_device_h_l42_c2_c27c_iffalse := VAR_x_MUX_uxn_device_h_l56_c7_f9d9_return_output;
     -- result_vram_address_MUX[uxn_device_h_l77_c7_76e7] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l77_c7_76e7_cond <= VAR_result_vram_address_MUX_uxn_device_h_l77_c7_76e7_cond;
     result_vram_address_MUX_uxn_device_h_l77_c7_76e7_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l77_c7_76e7_iftrue;
     result_vram_address_MUX_uxn_device_h_l77_c7_76e7_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l77_c7_76e7_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l77_c7_76e7_return_output := result_vram_address_MUX_uxn_device_h_l77_c7_76e7_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l61_c7_5d0a] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l61_c7_5d0a_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l61_c7_5d0a_cond;
     result_is_deo_done_MUX_uxn_device_h_l61_c7_5d0a_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l61_c7_5d0a_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l61_c7_5d0a_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l61_c7_5d0a_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l61_c7_5d0a_return_output := result_is_deo_done_MUX_uxn_device_h_l61_c7_5d0a_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l72_c7_470e] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l72_c7_470e_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l72_c7_470e_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l72_c7_470e_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l72_c7_470e_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l72_c7_470e_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l72_c7_470e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l72_c7_470e_return_output := result_is_device_ram_write_MUX_uxn_device_h_l72_c7_470e_return_output;

     -- x_MUX[uxn_device_h_l42_c2_c27c] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l42_c2_c27c_cond <= VAR_x_MUX_uxn_device_h_l42_c2_c27c_cond;
     x_MUX_uxn_device_h_l42_c2_c27c_iftrue <= VAR_x_MUX_uxn_device_h_l42_c2_c27c_iftrue;
     x_MUX_uxn_device_h_l42_c2_c27c_iffalse <= VAR_x_MUX_uxn_device_h_l42_c2_c27c_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l42_c2_c27c_return_output := x_MUX_uxn_device_h_l42_c2_c27c_return_output;

     -- ram_addr_MUX[uxn_device_h_l61_c7_5d0a] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l61_c7_5d0a_cond <= VAR_ram_addr_MUX_uxn_device_h_l61_c7_5d0a_cond;
     ram_addr_MUX_uxn_device_h_l61_c7_5d0a_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l61_c7_5d0a_iftrue;
     ram_addr_MUX_uxn_device_h_l61_c7_5d0a_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l61_c7_5d0a_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l61_c7_5d0a_return_output := ram_addr_MUX_uxn_device_h_l61_c7_5d0a_return_output;

     -- result_u8_value_MUX[uxn_device_h_l72_c7_470e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l72_c7_470e_cond <= VAR_result_u8_value_MUX_uxn_device_h_l72_c7_470e_cond;
     result_u8_value_MUX_uxn_device_h_l72_c7_470e_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l72_c7_470e_iftrue;
     result_u8_value_MUX_uxn_device_h_l72_c7_470e_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l72_c7_470e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l72_c7_470e_return_output := result_u8_value_MUX_uxn_device_h_l72_c7_470e_return_output;

     -- vram_addr_MUX[uxn_device_h_l77_c7_76e7] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l77_c7_76e7_cond <= VAR_vram_addr_MUX_uxn_device_h_l77_c7_76e7_cond;
     vram_addr_MUX_uxn_device_h_l77_c7_76e7_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l77_c7_76e7_iftrue;
     vram_addr_MUX_uxn_device_h_l77_c7_76e7_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l77_c7_76e7_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l77_c7_76e7_return_output := vram_addr_MUX_uxn_device_h_l77_c7_76e7_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l72_c7_470e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l72_c7_470e_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_470e_cond;
     result_device_ram_address_MUX_uxn_device_h_l72_c7_470e_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_470e_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l72_c7_470e_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_470e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_470e_return_output := result_device_ram_address_MUX_uxn_device_h_l72_c7_470e_return_output;

     -- Submodule level 18
     VAR_ram_addr_MUX_uxn_device_h_l56_c7_f9d9_iffalse := VAR_ram_addr_MUX_uxn_device_h_l61_c7_5d0a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l61_c7_5d0a_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_470e_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l56_c7_f9d9_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l61_c7_5d0a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l61_c7_5d0a_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l72_c7_470e_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l61_c7_5d0a_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l72_c7_470e_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l72_c7_470e_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l77_c7_76e7_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l72_c7_470e_iffalse := VAR_vram_addr_MUX_uxn_device_h_l77_c7_76e7_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l42_c2_c27c_return_output;
     -- vram_addr_MUX[uxn_device_h_l72_c7_470e] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l72_c7_470e_cond <= VAR_vram_addr_MUX_uxn_device_h_l72_c7_470e_cond;
     vram_addr_MUX_uxn_device_h_l72_c7_470e_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l72_c7_470e_iftrue;
     vram_addr_MUX_uxn_device_h_l72_c7_470e_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l72_c7_470e_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l72_c7_470e_return_output := vram_addr_MUX_uxn_device_h_l72_c7_470e_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l61_c7_5d0a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l61_c7_5d0a_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l61_c7_5d0a_cond;
     result_device_ram_address_MUX_uxn_device_h_l61_c7_5d0a_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l61_c7_5d0a_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l61_c7_5d0a_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l61_c7_5d0a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l61_c7_5d0a_return_output := result_device_ram_address_MUX_uxn_device_h_l61_c7_5d0a_return_output;

     -- result_vram_address_MUX[uxn_device_h_l72_c7_470e] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l72_c7_470e_cond <= VAR_result_vram_address_MUX_uxn_device_h_l72_c7_470e_cond;
     result_vram_address_MUX_uxn_device_h_l72_c7_470e_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l72_c7_470e_iftrue;
     result_vram_address_MUX_uxn_device_h_l72_c7_470e_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l72_c7_470e_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l72_c7_470e_return_output := result_vram_address_MUX_uxn_device_h_l72_c7_470e_return_output;

     -- result_u8_value_MUX[uxn_device_h_l61_c7_5d0a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l61_c7_5d0a_cond <= VAR_result_u8_value_MUX_uxn_device_h_l61_c7_5d0a_cond;
     result_u8_value_MUX_uxn_device_h_l61_c7_5d0a_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l61_c7_5d0a_iftrue;
     result_u8_value_MUX_uxn_device_h_l61_c7_5d0a_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l61_c7_5d0a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l61_c7_5d0a_return_output := result_u8_value_MUX_uxn_device_h_l61_c7_5d0a_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l61_c7_5d0a] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l61_c7_5d0a_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l61_c7_5d0a_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l61_c7_5d0a_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l61_c7_5d0a_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l61_c7_5d0a_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l61_c7_5d0a_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l61_c7_5d0a_return_output := result_is_device_ram_write_MUX_uxn_device_h_l61_c7_5d0a_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l56_c7_f9d9] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l56_c7_f9d9_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l56_c7_f9d9_cond;
     result_is_deo_done_MUX_uxn_device_h_l56_c7_f9d9_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l56_c7_f9d9_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l56_c7_f9d9_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l56_c7_f9d9_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l56_c7_f9d9_return_output := result_is_deo_done_MUX_uxn_device_h_l56_c7_f9d9_return_output;

     -- ram_addr_MUX[uxn_device_h_l56_c7_f9d9] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l56_c7_f9d9_cond <= VAR_ram_addr_MUX_uxn_device_h_l56_c7_f9d9_cond;
     ram_addr_MUX_uxn_device_h_l56_c7_f9d9_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l56_c7_f9d9_iftrue;
     ram_addr_MUX_uxn_device_h_l56_c7_f9d9_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l56_c7_f9d9_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l56_c7_f9d9_return_output := ram_addr_MUX_uxn_device_h_l56_c7_f9d9_return_output;

     -- Submodule level 19
     VAR_ram_addr_MUX_uxn_device_h_l42_c2_c27c_iffalse := VAR_ram_addr_MUX_uxn_device_h_l56_c7_f9d9_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l56_c7_f9d9_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l61_c7_5d0a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l42_c2_c27c_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l56_c7_f9d9_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l56_c7_f9d9_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l61_c7_5d0a_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l56_c7_f9d9_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l61_c7_5d0a_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l61_c7_5d0a_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l72_c7_470e_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l61_c7_5d0a_iffalse := VAR_vram_addr_MUX_uxn_device_h_l72_c7_470e_return_output;
     -- vram_addr_MUX[uxn_device_h_l61_c7_5d0a] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l61_c7_5d0a_cond <= VAR_vram_addr_MUX_uxn_device_h_l61_c7_5d0a_cond;
     vram_addr_MUX_uxn_device_h_l61_c7_5d0a_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l61_c7_5d0a_iftrue;
     vram_addr_MUX_uxn_device_h_l61_c7_5d0a_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l61_c7_5d0a_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l61_c7_5d0a_return_output := vram_addr_MUX_uxn_device_h_l61_c7_5d0a_return_output;

     -- result_vram_address_MUX[uxn_device_h_l61_c7_5d0a] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l61_c7_5d0a_cond <= VAR_result_vram_address_MUX_uxn_device_h_l61_c7_5d0a_cond;
     result_vram_address_MUX_uxn_device_h_l61_c7_5d0a_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l61_c7_5d0a_iftrue;
     result_vram_address_MUX_uxn_device_h_l61_c7_5d0a_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l61_c7_5d0a_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l61_c7_5d0a_return_output := result_vram_address_MUX_uxn_device_h_l61_c7_5d0a_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l56_c7_f9d9] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l56_c7_f9d9_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l56_c7_f9d9_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l56_c7_f9d9_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l56_c7_f9d9_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l56_c7_f9d9_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l56_c7_f9d9_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l56_c7_f9d9_return_output := result_is_device_ram_write_MUX_uxn_device_h_l56_c7_f9d9_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l56_c7_f9d9] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l56_c7_f9d9_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l56_c7_f9d9_cond;
     result_device_ram_address_MUX_uxn_device_h_l56_c7_f9d9_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l56_c7_f9d9_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l56_c7_f9d9_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l56_c7_f9d9_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l56_c7_f9d9_return_output := result_device_ram_address_MUX_uxn_device_h_l56_c7_f9d9_return_output;

     -- result_u8_value_MUX[uxn_device_h_l56_c7_f9d9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l56_c7_f9d9_cond <= VAR_result_u8_value_MUX_uxn_device_h_l56_c7_f9d9_cond;
     result_u8_value_MUX_uxn_device_h_l56_c7_f9d9_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l56_c7_f9d9_iftrue;
     result_u8_value_MUX_uxn_device_h_l56_c7_f9d9_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l56_c7_f9d9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l56_c7_f9d9_return_output := result_u8_value_MUX_uxn_device_h_l56_c7_f9d9_return_output;

     -- ram_addr_MUX[uxn_device_h_l42_c2_c27c] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l42_c2_c27c_cond <= VAR_ram_addr_MUX_uxn_device_h_l42_c2_c27c_cond;
     ram_addr_MUX_uxn_device_h_l42_c2_c27c_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l42_c2_c27c_iftrue;
     ram_addr_MUX_uxn_device_h_l42_c2_c27c_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l42_c2_c27c_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l42_c2_c27c_return_output := ram_addr_MUX_uxn_device_h_l42_c2_c27c_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l42_c2_c27c] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l42_c2_c27c_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l42_c2_c27c_cond;
     result_is_deo_done_MUX_uxn_device_h_l42_c2_c27c_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l42_c2_c27c_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l42_c2_c27c_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l42_c2_c27c_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l42_c2_c27c_return_output := result_is_deo_done_MUX_uxn_device_h_l42_c2_c27c_return_output;

     -- Submodule level 20
     REG_VAR_ram_addr := VAR_ram_addr_MUX_uxn_device_h_l42_c2_c27c_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l42_c2_c27c_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l56_c7_f9d9_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c2_c27c_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l56_c7_f9d9_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l42_c2_c27c_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l56_c7_f9d9_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l56_c7_f9d9_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l61_c7_5d0a_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l56_c7_f9d9_iffalse := VAR_vram_addr_MUX_uxn_device_h_l61_c7_5d0a_return_output;
     -- result_u8_value_MUX[uxn_device_h_l42_c2_c27c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l42_c2_c27c_cond <= VAR_result_u8_value_MUX_uxn_device_h_l42_c2_c27c_cond;
     result_u8_value_MUX_uxn_device_h_l42_c2_c27c_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l42_c2_c27c_iftrue;
     result_u8_value_MUX_uxn_device_h_l42_c2_c27c_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l42_c2_c27c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l42_c2_c27c_return_output := result_u8_value_MUX_uxn_device_h_l42_c2_c27c_return_output;

     -- result_vram_address_MUX[uxn_device_h_l56_c7_f9d9] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l56_c7_f9d9_cond <= VAR_result_vram_address_MUX_uxn_device_h_l56_c7_f9d9_cond;
     result_vram_address_MUX_uxn_device_h_l56_c7_f9d9_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l56_c7_f9d9_iftrue;
     result_vram_address_MUX_uxn_device_h_l56_c7_f9d9_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l56_c7_f9d9_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l56_c7_f9d9_return_output := result_vram_address_MUX_uxn_device_h_l56_c7_f9d9_return_output;

     -- vram_addr_MUX[uxn_device_h_l56_c7_f9d9] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l56_c7_f9d9_cond <= VAR_vram_addr_MUX_uxn_device_h_l56_c7_f9d9_cond;
     vram_addr_MUX_uxn_device_h_l56_c7_f9d9_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l56_c7_f9d9_iftrue;
     vram_addr_MUX_uxn_device_h_l56_c7_f9d9_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l56_c7_f9d9_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l56_c7_f9d9_return_output := vram_addr_MUX_uxn_device_h_l56_c7_f9d9_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l42_c2_c27c] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l42_c2_c27c_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c2_c27c_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l42_c2_c27c_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c2_c27c_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l42_c2_c27c_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c2_c27c_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c2_c27c_return_output := result_is_device_ram_write_MUX_uxn_device_h_l42_c2_c27c_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l42_c2_c27c] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l42_c2_c27c_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l42_c2_c27c_cond;
     result_device_ram_address_MUX_uxn_device_h_l42_c2_c27c_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l42_c2_c27c_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l42_c2_c27c_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l42_c2_c27c_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l42_c2_c27c_return_output := result_device_ram_address_MUX_uxn_device_h_l42_c2_c27c_return_output;

     -- Submodule level 21
     VAR_result_vram_address_MUX_uxn_device_h_l42_c2_c27c_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l56_c7_f9d9_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l42_c2_c27c_iffalse := VAR_vram_addr_MUX_uxn_device_h_l56_c7_f9d9_return_output;
     -- vram_addr_MUX[uxn_device_h_l42_c2_c27c] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l42_c2_c27c_cond <= VAR_vram_addr_MUX_uxn_device_h_l42_c2_c27c_cond;
     vram_addr_MUX_uxn_device_h_l42_c2_c27c_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l42_c2_c27c_iftrue;
     vram_addr_MUX_uxn_device_h_l42_c2_c27c_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l42_c2_c27c_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l42_c2_c27c_return_output := vram_addr_MUX_uxn_device_h_l42_c2_c27c_return_output;

     -- result_vram_address_MUX[uxn_device_h_l42_c2_c27c] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l42_c2_c27c_cond <= VAR_result_vram_address_MUX_uxn_device_h_l42_c2_c27c_cond;
     result_vram_address_MUX_uxn_device_h_l42_c2_c27c_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l42_c2_c27c_iftrue;
     result_vram_address_MUX_uxn_device_h_l42_c2_c27c_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l42_c2_c27c_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l42_c2_c27c_return_output := result_vram_address_MUX_uxn_device_h_l42_c2_c27c_return_output;

     -- Submodule level 22
     REG_VAR_vram_addr := VAR_vram_addr_MUX_uxn_device_h_l42_c2_c27c_return_output;
     -- CONST_REF_RD_device_out_result_t_device_out_result_t_ef4b_uxn_device_h_l34_l221_DUPLICATE_4463 LATENCY=0
     VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_ef4b_uxn_device_h_l34_l221_DUPLICATE_4463_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_ef4b(
     result,
     VAR_result_is_vram_write_MUX_uxn_device_h_l42_c2_c27c_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l42_c2_c27c_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l42_c2_c27c_return_output,
     VAR_result_vram_write_layer_MUX_uxn_device_h_l42_c2_c27c_return_output,
     VAR_result_vram_address_MUX_uxn_device_h_l42_c2_c27c_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c2_c27c_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l42_c2_c27c_return_output);

     -- Submodule level 23
     REG_VAR_result := VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_ef4b_uxn_device_h_l34_l221_DUPLICATE_4463_return_output;
     VAR_return_output := VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_ef4b_uxn_device_h_l34_l221_DUPLICATE_4463_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_vram_addr <= REG_VAR_vram_addr;
REG_COMB_x <= REG_VAR_x;
REG_COMB_y <= REG_VAR_y;
REG_COMB_ram_addr <= REG_VAR_ram_addr;
REG_COMB_ctrl <= REG_VAR_ctrl;
REG_COMB_auto_advance <= REG_VAR_auto_advance;
REG_COMB_color <= REG_VAR_color;
REG_COMB_is_pixel_port <= REG_VAR_is_pixel_port;
REG_COMB_is_sprite_port <= REG_VAR_is_sprite_port;
REG_COMB_is_drawing_port <= REG_VAR_is_drawing_port;
REG_COMB_ctrl_mode <= REG_VAR_ctrl_mode;
REG_COMB_flip_x <= REG_VAR_flip_x;
REG_COMB_flip_y <= REG_VAR_flip_y;
REG_COMB_layer <= REG_VAR_layer;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     vram_addr <= REG_COMB_vram_addr;
     x <= REG_COMB_x;
     y <= REG_COMB_y;
     ram_addr <= REG_COMB_ram_addr;
     ctrl <= REG_COMB_ctrl;
     auto_advance <= REG_COMB_auto_advance;
     color <= REG_COMB_color;
     is_pixel_port <= REG_COMB_is_pixel_port;
     is_sprite_port <= REG_COMB_is_sprite_port;
     is_drawing_port <= REG_COMB_is_drawing_port;
     ctrl_mode <= REG_COMB_ctrl_mode;
     flip_x <= REG_COMB_flip_x;
     flip_y <= REG_COMB_flip_y;
     layer <= REG_COMB_layer;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
