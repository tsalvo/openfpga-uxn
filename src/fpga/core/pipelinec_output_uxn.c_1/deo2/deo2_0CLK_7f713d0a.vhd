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
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 144
entity deo2_0CLK_7f713d0a is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo2_0CLK_7f713d0a;
architecture arch of deo2_0CLK_7f713d0a is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal l8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal current_deo_phase : unsigned(7 downto 0) := to_unsigned(0, 8);
signal deo_param0 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal deo_param1 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal is_second_deo : unsigned(0 downto 0) := to_unsigned(0, 1);
signal result : opcode_result_t := opcode_result_t_NULL;
signal device_out_result : device_out_result_t := device_out_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_l8 : unsigned(7 downto 0);
signal REG_COMB_current_deo_phase : unsigned(7 downto 0);
signal REG_COMB_deo_param0 : unsigned(7 downto 0);
signal REG_COMB_deo_param1 : unsigned(7 downto 0);
signal REG_COMB_is_second_deo : unsigned(0 downto 0);
signal REG_COMB_result : opcode_result_t;
signal REG_COMB_device_out_result : device_out_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l567_c6_ef3a]
signal BIN_OP_EQ_uxn_opcodes_h_l567_c6_ef3a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l567_c6_ef3a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l567_c6_ef3a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l574_c7_fb15]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_fb15_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_fb15_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l567_c2_57fb]
signal n8_MUX_uxn_opcodes_h_l567_c2_57fb_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l567_c2_57fb_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l567_c2_57fb]
signal is_second_deo_MUX_uxn_opcodes_h_l567_c2_57fb_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l567_c2_57fb_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l567_c2_57fb]
signal deo_param1_MUX_uxn_opcodes_h_l567_c2_57fb_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l567_c2_57fb_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l567_c2_57fb]
signal t8_MUX_uxn_opcodes_h_l567_c2_57fb_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l567_c2_57fb_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l567_c2_57fb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_57fb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_57fb_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l567_c2_57fb]
signal result_u8_value_MUX_uxn_opcodes_h_l567_c2_57fb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l567_c2_57fb_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l567_c2_57fb]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_57fb_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_57fb_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l567_c2_57fb]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l567_c2_57fb_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l567_c2_57fb_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l567_c2_57fb]
signal result_vram_address_MUX_uxn_opcodes_h_l567_c2_57fb_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l567_c2_57fb_return_output : unsigned(31 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l567_c2_57fb]
signal result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_57fb_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_57fb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l567_c2_57fb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_57fb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_57fb_return_output : signed(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l567_c2_57fb]
signal result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_57fb_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_57fb_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l567_c2_57fb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_57fb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_57fb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l567_c2_57fb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_57fb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_57fb_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l567_c2_57fb]
signal device_out_result_MUX_uxn_opcodes_h_l567_c2_57fb_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l567_c2_57fb_return_output : device_out_result_t;

-- current_deo_phase_MUX[uxn_opcodes_h_l567_c2_57fb]
signal current_deo_phase_MUX_uxn_opcodes_h_l567_c2_57fb_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l567_c2_57fb_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l567_c2_57fb]
signal deo_param0_MUX_uxn_opcodes_h_l567_c2_57fb_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l567_c2_57fb_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l567_c2_57fb]
signal l8_MUX_uxn_opcodes_h_l567_c2_57fb_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l567_c2_57fb_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l574_c11_7413]
signal BIN_OP_EQ_uxn_opcodes_h_l574_c11_7413_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l574_c11_7413_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l574_c11_7413_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l577_c7_5538]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_5538_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_5538_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_5538_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_5538_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l574_c7_fb15]
signal n8_MUX_uxn_opcodes_h_l574_c7_fb15_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l574_c7_fb15_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l574_c7_fb15]
signal is_second_deo_MUX_uxn_opcodes_h_l574_c7_fb15_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l574_c7_fb15_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l574_c7_fb15]
signal deo_param1_MUX_uxn_opcodes_h_l574_c7_fb15_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l574_c7_fb15_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l574_c7_fb15]
signal t8_MUX_uxn_opcodes_h_l574_c7_fb15_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l574_c7_fb15_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l574_c7_fb15]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_fb15_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_fb15_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l574_c7_fb15]
signal result_u8_value_MUX_uxn_opcodes_h_l574_c7_fb15_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l574_c7_fb15_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l574_c7_fb15]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_fb15_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_fb15_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l574_c7_fb15]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_fb15_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_fb15_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l574_c7_fb15]
signal result_vram_address_MUX_uxn_opcodes_h_l574_c7_fb15_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l574_c7_fb15_return_output : unsigned(31 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l574_c7_fb15]
signal result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_fb15_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_fb15_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l574_c7_fb15]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_fb15_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_fb15_return_output : signed(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l574_c7_fb15]
signal result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_fb15_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_fb15_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l574_c7_fb15]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_fb15_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_fb15_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l574_c7_fb15]
signal result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_fb15_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_fb15_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l574_c7_fb15]
signal device_out_result_MUX_uxn_opcodes_h_l574_c7_fb15_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l574_c7_fb15_return_output : device_out_result_t;

-- current_deo_phase_MUX[uxn_opcodes_h_l574_c7_fb15]
signal current_deo_phase_MUX_uxn_opcodes_h_l574_c7_fb15_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l574_c7_fb15_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l574_c7_fb15]
signal deo_param0_MUX_uxn_opcodes_h_l574_c7_fb15_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l574_c7_fb15_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l574_c7_fb15]
signal l8_MUX_uxn_opcodes_h_l574_c7_fb15_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l574_c7_fb15_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l577_c11_6814]
signal BIN_OP_EQ_uxn_opcodes_h_l577_c11_6814_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l577_c11_6814_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l577_c11_6814_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l581_c7_d4bf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_d4bf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l577_c7_5538]
signal n8_MUX_uxn_opcodes_h_l577_c7_5538_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l577_c7_5538_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l577_c7_5538_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l577_c7_5538_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l577_c7_5538]
signal is_second_deo_MUX_uxn_opcodes_h_l577_c7_5538_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l577_c7_5538_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l577_c7_5538_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l577_c7_5538_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l577_c7_5538]
signal deo_param1_MUX_uxn_opcodes_h_l577_c7_5538_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l577_c7_5538_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l577_c7_5538_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l577_c7_5538_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l577_c7_5538]
signal t8_MUX_uxn_opcodes_h_l577_c7_5538_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l577_c7_5538_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l577_c7_5538_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l577_c7_5538_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l577_c7_5538]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_5538_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_5538_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_5538_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_5538_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l577_c7_5538]
signal result_u8_value_MUX_uxn_opcodes_h_l577_c7_5538_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l577_c7_5538_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l577_c7_5538_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l577_c7_5538_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l577_c7_5538]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_5538_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_5538_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_5538_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_5538_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l577_c7_5538]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_5538_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_5538_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_5538_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_5538_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l577_c7_5538]
signal result_vram_address_MUX_uxn_opcodes_h_l577_c7_5538_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l577_c7_5538_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l577_c7_5538_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l577_c7_5538_return_output : unsigned(31 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l577_c7_5538]
signal result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_5538_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_5538_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_5538_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_5538_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l577_c7_5538]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_5538_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_5538_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_5538_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_5538_return_output : signed(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l577_c7_5538]
signal result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_5538_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_5538_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_5538_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_5538_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l577_c7_5538]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_5538_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_5538_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_5538_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_5538_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l577_c7_5538]
signal result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_5538_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_5538_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_5538_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_5538_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l577_c7_5538]
signal device_out_result_MUX_uxn_opcodes_h_l577_c7_5538_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l577_c7_5538_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l577_c7_5538_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l577_c7_5538_return_output : device_out_result_t;

-- current_deo_phase_MUX[uxn_opcodes_h_l577_c7_5538]
signal current_deo_phase_MUX_uxn_opcodes_h_l577_c7_5538_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l577_c7_5538_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l577_c7_5538_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l577_c7_5538_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l577_c7_5538]
signal deo_param0_MUX_uxn_opcodes_h_l577_c7_5538_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l577_c7_5538_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l577_c7_5538_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l577_c7_5538_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l577_c7_5538]
signal l8_MUX_uxn_opcodes_h_l577_c7_5538_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l577_c7_5538_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l577_c7_5538_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l577_c7_5538_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l581_c11_858f]
signal BIN_OP_EQ_uxn_opcodes_h_l581_c11_858f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l581_c11_858f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l581_c11_858f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l584_c7_a30f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_a30f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_a30f_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l581_c7_d4bf]
signal n8_MUX_uxn_opcodes_h_l581_c7_d4bf_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l581_c7_d4bf]
signal is_second_deo_MUX_uxn_opcodes_h_l581_c7_d4bf_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l581_c7_d4bf]
signal deo_param1_MUX_uxn_opcodes_h_l581_c7_d4bf_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l581_c7_d4bf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_d4bf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l581_c7_d4bf]
signal result_u8_value_MUX_uxn_opcodes_h_l581_c7_d4bf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l581_c7_d4bf]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_d4bf_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l581_c7_d4bf]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_d4bf_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l581_c7_d4bf]
signal result_vram_address_MUX_uxn_opcodes_h_l581_c7_d4bf_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output : unsigned(31 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l581_c7_d4bf]
signal result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_d4bf_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l581_c7_d4bf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_d4bf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output : signed(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l581_c7_d4bf]
signal result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_d4bf_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l581_c7_d4bf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_d4bf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l581_c7_d4bf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d4bf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l581_c7_d4bf]
signal device_out_result_MUX_uxn_opcodes_h_l581_c7_d4bf_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output : device_out_result_t;

-- current_deo_phase_MUX[uxn_opcodes_h_l581_c7_d4bf]
signal current_deo_phase_MUX_uxn_opcodes_h_l581_c7_d4bf_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l581_c7_d4bf]
signal deo_param0_MUX_uxn_opcodes_h_l581_c7_d4bf_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l581_c7_d4bf]
signal l8_MUX_uxn_opcodes_h_l581_c7_d4bf_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l584_c11_1090]
signal BIN_OP_EQ_uxn_opcodes_h_l584_c11_1090_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l584_c11_1090_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l584_c11_1090_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l588_c7_5f19]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_5f19_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_5f19_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l584_c7_a30f]
signal n8_MUX_uxn_opcodes_h_l584_c7_a30f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l584_c7_a30f_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l584_c7_a30f]
signal is_second_deo_MUX_uxn_opcodes_h_l584_c7_a30f_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l584_c7_a30f_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l584_c7_a30f]
signal deo_param1_MUX_uxn_opcodes_h_l584_c7_a30f_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l584_c7_a30f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l584_c7_a30f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_a30f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_a30f_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l584_c7_a30f]
signal result_u8_value_MUX_uxn_opcodes_h_l584_c7_a30f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l584_c7_a30f_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l584_c7_a30f]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_a30f_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_a30f_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l584_c7_a30f]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_a30f_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_a30f_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l584_c7_a30f]
signal result_vram_address_MUX_uxn_opcodes_h_l584_c7_a30f_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l584_c7_a30f_return_output : unsigned(31 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l584_c7_a30f]
signal result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_a30f_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_a30f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l584_c7_a30f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_a30f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_a30f_return_output : signed(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l584_c7_a30f]
signal result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_a30f_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_a30f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l584_c7_a30f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_a30f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_a30f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l584_c7_a30f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_a30f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_a30f_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l584_c7_a30f]
signal device_out_result_MUX_uxn_opcodes_h_l584_c7_a30f_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l584_c7_a30f_return_output : device_out_result_t;

-- current_deo_phase_MUX[uxn_opcodes_h_l584_c7_a30f]
signal current_deo_phase_MUX_uxn_opcodes_h_l584_c7_a30f_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l584_c7_a30f_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l584_c7_a30f]
signal deo_param0_MUX_uxn_opcodes_h_l584_c7_a30f_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l584_c7_a30f_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l584_c7_a30f]
signal l8_MUX_uxn_opcodes_h_l584_c7_a30f_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l584_c7_a30f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l588_c11_2c75]
signal BIN_OP_EQ_uxn_opcodes_h_l588_c11_2c75_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l588_c11_2c75_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l588_c11_2c75_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l591_c7_efaa]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_efaa_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_efaa_return_output : unsigned(0 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l588_c7_5f19]
signal is_second_deo_MUX_uxn_opcodes_h_l588_c7_5f19_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l588_c7_5f19_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l588_c7_5f19]
signal deo_param1_MUX_uxn_opcodes_h_l588_c7_5f19_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l588_c7_5f19_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l588_c7_5f19]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_5f19_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_5f19_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l588_c7_5f19]
signal result_u8_value_MUX_uxn_opcodes_h_l588_c7_5f19_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l588_c7_5f19_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l588_c7_5f19]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_5f19_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_5f19_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l588_c7_5f19]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_5f19_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_5f19_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l588_c7_5f19]
signal result_vram_address_MUX_uxn_opcodes_h_l588_c7_5f19_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l588_c7_5f19_return_output : unsigned(31 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l588_c7_5f19]
signal result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_5f19_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_5f19_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l588_c7_5f19]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_5f19_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_5f19_return_output : signed(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l588_c7_5f19]
signal result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_5f19_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_5f19_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l588_c7_5f19]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_5f19_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_5f19_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l588_c7_5f19]
signal result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_5f19_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_5f19_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l588_c7_5f19]
signal device_out_result_MUX_uxn_opcodes_h_l588_c7_5f19_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l588_c7_5f19_return_output : device_out_result_t;

-- current_deo_phase_MUX[uxn_opcodes_h_l588_c7_5f19]
signal current_deo_phase_MUX_uxn_opcodes_h_l588_c7_5f19_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l588_c7_5f19_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l588_c7_5f19]
signal deo_param0_MUX_uxn_opcodes_h_l588_c7_5f19_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l588_c7_5f19_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l588_c7_5f19]
signal l8_MUX_uxn_opcodes_h_l588_c7_5f19_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l588_c7_5f19_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l591_c11_3748]
signal BIN_OP_EQ_uxn_opcodes_h_l591_c11_3748_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l591_c11_3748_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l591_c11_3748_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l597_c1_881d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_881d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_881d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_881d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_881d_return_output : unsigned(0 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l591_c7_efaa]
signal is_second_deo_MUX_uxn_opcodes_h_l591_c7_efaa_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l591_c7_efaa_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l591_c7_efaa]
signal deo_param1_MUX_uxn_opcodes_h_l591_c7_efaa_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l591_c7_efaa_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l591_c7_efaa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_efaa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_efaa_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l591_c7_efaa]
signal result_u8_value_MUX_uxn_opcodes_h_l591_c7_efaa_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l591_c7_efaa_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l591_c7_efaa]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_efaa_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_efaa_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l591_c7_efaa]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_efaa_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_efaa_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l591_c7_efaa]
signal result_vram_address_MUX_uxn_opcodes_h_l591_c7_efaa_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l591_c7_efaa_return_output : unsigned(31 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l591_c7_efaa]
signal result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_efaa_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_efaa_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l591_c7_efaa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_efaa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_efaa_return_output : signed(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l591_c7_efaa]
signal result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_efaa_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_efaa_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l591_c7_efaa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_efaa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_efaa_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l591_c7_efaa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_efaa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_efaa_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l591_c7_efaa]
signal device_out_result_MUX_uxn_opcodes_h_l591_c7_efaa_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l591_c7_efaa_return_output : device_out_result_t;

-- current_deo_phase_MUX[uxn_opcodes_h_l591_c7_efaa]
signal current_deo_phase_MUX_uxn_opcodes_h_l591_c7_efaa_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l591_c7_efaa_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l591_c7_efaa]
signal deo_param0_MUX_uxn_opcodes_h_l591_c7_efaa_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l591_c7_efaa_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l591_c7_efaa]
signal l8_MUX_uxn_opcodes_h_l591_c7_efaa_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l591_c7_efaa_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l595_c30_4192]
signal sp_relative_shift_uxn_opcodes_h_l595_c30_4192_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l595_c30_4192_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l595_c30_4192_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l595_c30_4192_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l599_c32_badd]
signal BIN_OP_PLUS_uxn_opcodes_h_l599_c32_badd_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l599_c32_badd_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l599_c32_badd_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l599_c16_89a3]
signal MUX_uxn_opcodes_h_l599_c16_89a3_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l599_c16_89a3_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l599_c16_89a3_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l599_c16_89a3_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l600_c16_9fe0]
signal MUX_uxn_opcodes_h_l600_c16_9fe0_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l600_c16_9fe0_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l600_c16_9fe0_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l600_c16_9fe0_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l601_c23_cf7c]
signal device_out_uxn_opcodes_h_l601_c23_cf7c_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l601_c23_cf7c_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l601_c23_cf7c_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l601_c23_cf7c_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l601_c23_cf7c_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l601_c23_cf7c_return_output : device_out_result_t;

-- BIN_OP_AND[uxn_opcodes_h_l608_c24_2bd0]
signal BIN_OP_AND_uxn_opcodes_h_l608_c24_2bd0_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l608_c24_2bd0_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l608_c24_2bd0_return_output : unsigned(0 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l609_c3_6ce4]
signal is_second_deo_MUX_uxn_opcodes_h_l609_c3_6ce4_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l609_c3_6ce4_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l609_c3_6ce4_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l609_c3_6ce4_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l609_c3_6ce4]
signal current_deo_phase_MUX_uxn_opcodes_h_l609_c3_6ce4_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l609_c3_6ce4_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l609_c3_6ce4_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l609_c3_6ce4_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l613_c4_3da1]
signal BIN_OP_PLUS_uxn_opcodes_h_l613_c4_3da1_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l613_c4_3da1_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l613_c4_3da1_return_output : unsigned(8 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_6e05( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.is_device_ram_write := ref_toks_3;
      base.vram_write_layer := ref_toks_4;
      base.vram_address := ref_toks_5;
      base.is_vram_write := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.device_ram_address := ref_toks_8;
      base.is_sp_shift := ref_toks_9;
      base.is_opc_done := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l567_c6_ef3a
BIN_OP_EQ_uxn_opcodes_h_l567_c6_ef3a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l567_c6_ef3a_left,
BIN_OP_EQ_uxn_opcodes_h_l567_c6_ef3a_right,
BIN_OP_EQ_uxn_opcodes_h_l567_c6_ef3a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_fb15
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_fb15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_fb15_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_fb15_return_output);

-- n8_MUX_uxn_opcodes_h_l567_c2_57fb
n8_MUX_uxn_opcodes_h_l567_c2_57fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l567_c2_57fb_cond,
n8_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue,
n8_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse,
n8_MUX_uxn_opcodes_h_l567_c2_57fb_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l567_c2_57fb
is_second_deo_MUX_uxn_opcodes_h_l567_c2_57fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l567_c2_57fb_cond,
is_second_deo_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l567_c2_57fb_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l567_c2_57fb
deo_param1_MUX_uxn_opcodes_h_l567_c2_57fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l567_c2_57fb_cond,
deo_param1_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue,
deo_param1_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse,
deo_param1_MUX_uxn_opcodes_h_l567_c2_57fb_return_output);

-- t8_MUX_uxn_opcodes_h_l567_c2_57fb
t8_MUX_uxn_opcodes_h_l567_c2_57fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l567_c2_57fb_cond,
t8_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue,
t8_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse,
t8_MUX_uxn_opcodes_h_l567_c2_57fb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_57fb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_57fb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_57fb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_57fb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l567_c2_57fb
result_u8_value_MUX_uxn_opcodes_h_l567_c2_57fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l567_c2_57fb_cond,
result_u8_value_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l567_c2_57fb_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_57fb
result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_57fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_57fb_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_57fb_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l567_c2_57fb
result_vram_write_layer_MUX_uxn_opcodes_h_l567_c2_57fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l567_c2_57fb_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l567_c2_57fb_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l567_c2_57fb
result_vram_address_MUX_uxn_opcodes_h_l567_c2_57fb : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l567_c2_57fb_cond,
result_vram_address_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l567_c2_57fb_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_57fb
result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_57fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_57fb_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_57fb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_57fb
result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_57fb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_57fb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_57fb_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_57fb
result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_57fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_57fb_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_57fb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_57fb
result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_57fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_57fb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_57fb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_57fb
result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_57fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_57fb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_57fb_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l567_c2_57fb
device_out_result_MUX_uxn_opcodes_h_l567_c2_57fb : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l567_c2_57fb_cond,
device_out_result_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue,
device_out_result_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse,
device_out_result_MUX_uxn_opcodes_h_l567_c2_57fb_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l567_c2_57fb
current_deo_phase_MUX_uxn_opcodes_h_l567_c2_57fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l567_c2_57fb_cond,
current_deo_phase_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l567_c2_57fb_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l567_c2_57fb
deo_param0_MUX_uxn_opcodes_h_l567_c2_57fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l567_c2_57fb_cond,
deo_param0_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue,
deo_param0_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse,
deo_param0_MUX_uxn_opcodes_h_l567_c2_57fb_return_output);

-- l8_MUX_uxn_opcodes_h_l567_c2_57fb
l8_MUX_uxn_opcodes_h_l567_c2_57fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l567_c2_57fb_cond,
l8_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue,
l8_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse,
l8_MUX_uxn_opcodes_h_l567_c2_57fb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l574_c11_7413
BIN_OP_EQ_uxn_opcodes_h_l574_c11_7413 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l574_c11_7413_left,
BIN_OP_EQ_uxn_opcodes_h_l574_c11_7413_right,
BIN_OP_EQ_uxn_opcodes_h_l574_c11_7413_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_5538
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_5538 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_5538_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_5538_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_5538_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_5538_return_output);

-- n8_MUX_uxn_opcodes_h_l574_c7_fb15
n8_MUX_uxn_opcodes_h_l574_c7_fb15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l574_c7_fb15_cond,
n8_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue,
n8_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse,
n8_MUX_uxn_opcodes_h_l574_c7_fb15_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l574_c7_fb15
is_second_deo_MUX_uxn_opcodes_h_l574_c7_fb15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l574_c7_fb15_cond,
is_second_deo_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l574_c7_fb15_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l574_c7_fb15
deo_param1_MUX_uxn_opcodes_h_l574_c7_fb15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l574_c7_fb15_cond,
deo_param1_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue,
deo_param1_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse,
deo_param1_MUX_uxn_opcodes_h_l574_c7_fb15_return_output);

-- t8_MUX_uxn_opcodes_h_l574_c7_fb15
t8_MUX_uxn_opcodes_h_l574_c7_fb15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l574_c7_fb15_cond,
t8_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue,
t8_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse,
t8_MUX_uxn_opcodes_h_l574_c7_fb15_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_fb15
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_fb15 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_fb15_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_fb15_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l574_c7_fb15
result_u8_value_MUX_uxn_opcodes_h_l574_c7_fb15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l574_c7_fb15_cond,
result_u8_value_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l574_c7_fb15_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_fb15
result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_fb15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_fb15_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_fb15_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_fb15
result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_fb15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_fb15_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_fb15_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l574_c7_fb15
result_vram_address_MUX_uxn_opcodes_h_l574_c7_fb15 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l574_c7_fb15_cond,
result_vram_address_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l574_c7_fb15_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_fb15
result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_fb15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_fb15_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_fb15_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_fb15
result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_fb15 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_fb15_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_fb15_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_fb15
result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_fb15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_fb15_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_fb15_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_fb15
result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_fb15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_fb15_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_fb15_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_fb15
result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_fb15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_fb15_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_fb15_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l574_c7_fb15
device_out_result_MUX_uxn_opcodes_h_l574_c7_fb15 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l574_c7_fb15_cond,
device_out_result_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue,
device_out_result_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse,
device_out_result_MUX_uxn_opcodes_h_l574_c7_fb15_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l574_c7_fb15
current_deo_phase_MUX_uxn_opcodes_h_l574_c7_fb15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l574_c7_fb15_cond,
current_deo_phase_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l574_c7_fb15_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l574_c7_fb15
deo_param0_MUX_uxn_opcodes_h_l574_c7_fb15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l574_c7_fb15_cond,
deo_param0_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue,
deo_param0_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse,
deo_param0_MUX_uxn_opcodes_h_l574_c7_fb15_return_output);

-- l8_MUX_uxn_opcodes_h_l574_c7_fb15
l8_MUX_uxn_opcodes_h_l574_c7_fb15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l574_c7_fb15_cond,
l8_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue,
l8_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse,
l8_MUX_uxn_opcodes_h_l574_c7_fb15_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l577_c11_6814
BIN_OP_EQ_uxn_opcodes_h_l577_c11_6814 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l577_c11_6814_left,
BIN_OP_EQ_uxn_opcodes_h_l577_c11_6814_right,
BIN_OP_EQ_uxn_opcodes_h_l577_c11_6814_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_d4bf
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_d4bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_d4bf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output);

-- n8_MUX_uxn_opcodes_h_l577_c7_5538
n8_MUX_uxn_opcodes_h_l577_c7_5538 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l577_c7_5538_cond,
n8_MUX_uxn_opcodes_h_l577_c7_5538_iftrue,
n8_MUX_uxn_opcodes_h_l577_c7_5538_iffalse,
n8_MUX_uxn_opcodes_h_l577_c7_5538_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l577_c7_5538
is_second_deo_MUX_uxn_opcodes_h_l577_c7_5538 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l577_c7_5538_cond,
is_second_deo_MUX_uxn_opcodes_h_l577_c7_5538_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l577_c7_5538_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l577_c7_5538_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l577_c7_5538
deo_param1_MUX_uxn_opcodes_h_l577_c7_5538 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l577_c7_5538_cond,
deo_param1_MUX_uxn_opcodes_h_l577_c7_5538_iftrue,
deo_param1_MUX_uxn_opcodes_h_l577_c7_5538_iffalse,
deo_param1_MUX_uxn_opcodes_h_l577_c7_5538_return_output);

-- t8_MUX_uxn_opcodes_h_l577_c7_5538
t8_MUX_uxn_opcodes_h_l577_c7_5538 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l577_c7_5538_cond,
t8_MUX_uxn_opcodes_h_l577_c7_5538_iftrue,
t8_MUX_uxn_opcodes_h_l577_c7_5538_iffalse,
t8_MUX_uxn_opcodes_h_l577_c7_5538_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_5538
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_5538 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_5538_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_5538_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_5538_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_5538_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l577_c7_5538
result_u8_value_MUX_uxn_opcodes_h_l577_c7_5538 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l577_c7_5538_cond,
result_u8_value_MUX_uxn_opcodes_h_l577_c7_5538_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l577_c7_5538_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l577_c7_5538_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_5538
result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_5538 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_5538_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_5538_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_5538_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_5538_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_5538
result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_5538 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_5538_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_5538_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_5538_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_5538_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l577_c7_5538
result_vram_address_MUX_uxn_opcodes_h_l577_c7_5538 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l577_c7_5538_cond,
result_vram_address_MUX_uxn_opcodes_h_l577_c7_5538_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l577_c7_5538_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l577_c7_5538_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_5538
result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_5538 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_5538_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_5538_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_5538_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_5538_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_5538
result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_5538 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_5538_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_5538_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_5538_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_5538_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_5538
result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_5538 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_5538_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_5538_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_5538_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_5538_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_5538
result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_5538 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_5538_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_5538_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_5538_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_5538_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_5538
result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_5538 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_5538_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_5538_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_5538_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_5538_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l577_c7_5538
device_out_result_MUX_uxn_opcodes_h_l577_c7_5538 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l577_c7_5538_cond,
device_out_result_MUX_uxn_opcodes_h_l577_c7_5538_iftrue,
device_out_result_MUX_uxn_opcodes_h_l577_c7_5538_iffalse,
device_out_result_MUX_uxn_opcodes_h_l577_c7_5538_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l577_c7_5538
current_deo_phase_MUX_uxn_opcodes_h_l577_c7_5538 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l577_c7_5538_cond,
current_deo_phase_MUX_uxn_opcodes_h_l577_c7_5538_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l577_c7_5538_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l577_c7_5538_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l577_c7_5538
deo_param0_MUX_uxn_opcodes_h_l577_c7_5538 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l577_c7_5538_cond,
deo_param0_MUX_uxn_opcodes_h_l577_c7_5538_iftrue,
deo_param0_MUX_uxn_opcodes_h_l577_c7_5538_iffalse,
deo_param0_MUX_uxn_opcodes_h_l577_c7_5538_return_output);

-- l8_MUX_uxn_opcodes_h_l577_c7_5538
l8_MUX_uxn_opcodes_h_l577_c7_5538 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l577_c7_5538_cond,
l8_MUX_uxn_opcodes_h_l577_c7_5538_iftrue,
l8_MUX_uxn_opcodes_h_l577_c7_5538_iffalse,
l8_MUX_uxn_opcodes_h_l577_c7_5538_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l581_c11_858f
BIN_OP_EQ_uxn_opcodes_h_l581_c11_858f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l581_c11_858f_left,
BIN_OP_EQ_uxn_opcodes_h_l581_c11_858f_right,
BIN_OP_EQ_uxn_opcodes_h_l581_c11_858f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_a30f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_a30f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_a30f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_a30f_return_output);

-- n8_MUX_uxn_opcodes_h_l581_c7_d4bf
n8_MUX_uxn_opcodes_h_l581_c7_d4bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l581_c7_d4bf_cond,
n8_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue,
n8_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse,
n8_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l581_c7_d4bf
is_second_deo_MUX_uxn_opcodes_h_l581_c7_d4bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l581_c7_d4bf_cond,
is_second_deo_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l581_c7_d4bf
deo_param1_MUX_uxn_opcodes_h_l581_c7_d4bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l581_c7_d4bf_cond,
deo_param1_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue,
deo_param1_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse,
deo_param1_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_d4bf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_d4bf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_d4bf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l581_c7_d4bf
result_u8_value_MUX_uxn_opcodes_h_l581_c7_d4bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l581_c7_d4bf_cond,
result_u8_value_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_d4bf
result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_d4bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_d4bf_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_d4bf
result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_d4bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_d4bf_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l581_c7_d4bf
result_vram_address_MUX_uxn_opcodes_h_l581_c7_d4bf : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l581_c7_d4bf_cond,
result_vram_address_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_d4bf
result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_d4bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_d4bf_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_d4bf
result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_d4bf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_d4bf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_d4bf
result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_d4bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_d4bf_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_d4bf
result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_d4bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_d4bf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d4bf
result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d4bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d4bf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l581_c7_d4bf
device_out_result_MUX_uxn_opcodes_h_l581_c7_d4bf : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l581_c7_d4bf_cond,
device_out_result_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue,
device_out_result_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse,
device_out_result_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l581_c7_d4bf
current_deo_phase_MUX_uxn_opcodes_h_l581_c7_d4bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l581_c7_d4bf_cond,
current_deo_phase_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l581_c7_d4bf
deo_param0_MUX_uxn_opcodes_h_l581_c7_d4bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l581_c7_d4bf_cond,
deo_param0_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue,
deo_param0_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse,
deo_param0_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output);

-- l8_MUX_uxn_opcodes_h_l581_c7_d4bf
l8_MUX_uxn_opcodes_h_l581_c7_d4bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l581_c7_d4bf_cond,
l8_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue,
l8_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse,
l8_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l584_c11_1090
BIN_OP_EQ_uxn_opcodes_h_l584_c11_1090 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l584_c11_1090_left,
BIN_OP_EQ_uxn_opcodes_h_l584_c11_1090_right,
BIN_OP_EQ_uxn_opcodes_h_l584_c11_1090_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_5f19
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_5f19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_5f19_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_5f19_return_output);

-- n8_MUX_uxn_opcodes_h_l584_c7_a30f
n8_MUX_uxn_opcodes_h_l584_c7_a30f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l584_c7_a30f_cond,
n8_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue,
n8_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse,
n8_MUX_uxn_opcodes_h_l584_c7_a30f_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l584_c7_a30f
is_second_deo_MUX_uxn_opcodes_h_l584_c7_a30f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l584_c7_a30f_cond,
is_second_deo_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l584_c7_a30f_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l584_c7_a30f
deo_param1_MUX_uxn_opcodes_h_l584_c7_a30f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l584_c7_a30f_cond,
deo_param1_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue,
deo_param1_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse,
deo_param1_MUX_uxn_opcodes_h_l584_c7_a30f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_a30f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_a30f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_a30f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_a30f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l584_c7_a30f
result_u8_value_MUX_uxn_opcodes_h_l584_c7_a30f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l584_c7_a30f_cond,
result_u8_value_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l584_c7_a30f_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_a30f
result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_a30f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_a30f_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_a30f_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_a30f
result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_a30f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_a30f_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_a30f_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l584_c7_a30f
result_vram_address_MUX_uxn_opcodes_h_l584_c7_a30f : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l584_c7_a30f_cond,
result_vram_address_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l584_c7_a30f_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_a30f
result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_a30f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_a30f_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_a30f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_a30f
result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_a30f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_a30f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_a30f_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_a30f
result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_a30f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_a30f_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_a30f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_a30f
result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_a30f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_a30f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_a30f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_a30f
result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_a30f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_a30f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_a30f_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l584_c7_a30f
device_out_result_MUX_uxn_opcodes_h_l584_c7_a30f : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l584_c7_a30f_cond,
device_out_result_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue,
device_out_result_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse,
device_out_result_MUX_uxn_opcodes_h_l584_c7_a30f_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l584_c7_a30f
current_deo_phase_MUX_uxn_opcodes_h_l584_c7_a30f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l584_c7_a30f_cond,
current_deo_phase_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l584_c7_a30f_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l584_c7_a30f
deo_param0_MUX_uxn_opcodes_h_l584_c7_a30f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l584_c7_a30f_cond,
deo_param0_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue,
deo_param0_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse,
deo_param0_MUX_uxn_opcodes_h_l584_c7_a30f_return_output);

-- l8_MUX_uxn_opcodes_h_l584_c7_a30f
l8_MUX_uxn_opcodes_h_l584_c7_a30f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l584_c7_a30f_cond,
l8_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue,
l8_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse,
l8_MUX_uxn_opcodes_h_l584_c7_a30f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l588_c11_2c75
BIN_OP_EQ_uxn_opcodes_h_l588_c11_2c75 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l588_c11_2c75_left,
BIN_OP_EQ_uxn_opcodes_h_l588_c11_2c75_right,
BIN_OP_EQ_uxn_opcodes_h_l588_c11_2c75_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_efaa
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_efaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_efaa_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_efaa_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l588_c7_5f19
is_second_deo_MUX_uxn_opcodes_h_l588_c7_5f19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l588_c7_5f19_cond,
is_second_deo_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l588_c7_5f19_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l588_c7_5f19
deo_param1_MUX_uxn_opcodes_h_l588_c7_5f19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l588_c7_5f19_cond,
deo_param1_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue,
deo_param1_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse,
deo_param1_MUX_uxn_opcodes_h_l588_c7_5f19_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_5f19
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_5f19 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_5f19_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_5f19_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l588_c7_5f19
result_u8_value_MUX_uxn_opcodes_h_l588_c7_5f19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l588_c7_5f19_cond,
result_u8_value_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l588_c7_5f19_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_5f19
result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_5f19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_5f19_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_5f19_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_5f19
result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_5f19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_5f19_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_5f19_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l588_c7_5f19
result_vram_address_MUX_uxn_opcodes_h_l588_c7_5f19 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l588_c7_5f19_cond,
result_vram_address_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l588_c7_5f19_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_5f19
result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_5f19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_5f19_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_5f19_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_5f19
result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_5f19 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_5f19_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_5f19_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_5f19
result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_5f19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_5f19_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_5f19_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_5f19
result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_5f19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_5f19_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_5f19_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_5f19
result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_5f19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_5f19_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_5f19_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l588_c7_5f19
device_out_result_MUX_uxn_opcodes_h_l588_c7_5f19 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l588_c7_5f19_cond,
device_out_result_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue,
device_out_result_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse,
device_out_result_MUX_uxn_opcodes_h_l588_c7_5f19_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l588_c7_5f19
current_deo_phase_MUX_uxn_opcodes_h_l588_c7_5f19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l588_c7_5f19_cond,
current_deo_phase_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l588_c7_5f19_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l588_c7_5f19
deo_param0_MUX_uxn_opcodes_h_l588_c7_5f19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l588_c7_5f19_cond,
deo_param0_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue,
deo_param0_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse,
deo_param0_MUX_uxn_opcodes_h_l588_c7_5f19_return_output);

-- l8_MUX_uxn_opcodes_h_l588_c7_5f19
l8_MUX_uxn_opcodes_h_l588_c7_5f19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l588_c7_5f19_cond,
l8_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue,
l8_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse,
l8_MUX_uxn_opcodes_h_l588_c7_5f19_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l591_c11_3748
BIN_OP_EQ_uxn_opcodes_h_l591_c11_3748 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l591_c11_3748_left,
BIN_OP_EQ_uxn_opcodes_h_l591_c11_3748_right,
BIN_OP_EQ_uxn_opcodes_h_l591_c11_3748_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_881d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_881d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_881d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_881d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_881d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_881d_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l591_c7_efaa
is_second_deo_MUX_uxn_opcodes_h_l591_c7_efaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l591_c7_efaa_cond,
is_second_deo_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l591_c7_efaa_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l591_c7_efaa
deo_param1_MUX_uxn_opcodes_h_l591_c7_efaa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l591_c7_efaa_cond,
deo_param1_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue,
deo_param1_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse,
deo_param1_MUX_uxn_opcodes_h_l591_c7_efaa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_efaa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_efaa : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_efaa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_efaa_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l591_c7_efaa
result_u8_value_MUX_uxn_opcodes_h_l591_c7_efaa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l591_c7_efaa_cond,
result_u8_value_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l591_c7_efaa_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_efaa
result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_efaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_efaa_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_efaa_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_efaa
result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_efaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_efaa_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_efaa_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l591_c7_efaa
result_vram_address_MUX_uxn_opcodes_h_l591_c7_efaa : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l591_c7_efaa_cond,
result_vram_address_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l591_c7_efaa_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_efaa
result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_efaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_efaa_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_efaa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_efaa
result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_efaa : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_efaa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_efaa_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_efaa
result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_efaa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_efaa_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_efaa_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_efaa
result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_efaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_efaa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_efaa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_efaa
result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_efaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_efaa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_efaa_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l591_c7_efaa
device_out_result_MUX_uxn_opcodes_h_l591_c7_efaa : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l591_c7_efaa_cond,
device_out_result_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue,
device_out_result_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse,
device_out_result_MUX_uxn_opcodes_h_l591_c7_efaa_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l591_c7_efaa
current_deo_phase_MUX_uxn_opcodes_h_l591_c7_efaa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l591_c7_efaa_cond,
current_deo_phase_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l591_c7_efaa_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l591_c7_efaa
deo_param0_MUX_uxn_opcodes_h_l591_c7_efaa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l591_c7_efaa_cond,
deo_param0_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue,
deo_param0_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse,
deo_param0_MUX_uxn_opcodes_h_l591_c7_efaa_return_output);

-- l8_MUX_uxn_opcodes_h_l591_c7_efaa
l8_MUX_uxn_opcodes_h_l591_c7_efaa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l591_c7_efaa_cond,
l8_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue,
l8_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse,
l8_MUX_uxn_opcodes_h_l591_c7_efaa_return_output);

-- sp_relative_shift_uxn_opcodes_h_l595_c30_4192
sp_relative_shift_uxn_opcodes_h_l595_c30_4192 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l595_c30_4192_ins,
sp_relative_shift_uxn_opcodes_h_l595_c30_4192_x,
sp_relative_shift_uxn_opcodes_h_l595_c30_4192_y,
sp_relative_shift_uxn_opcodes_h_l595_c30_4192_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l599_c32_badd
BIN_OP_PLUS_uxn_opcodes_h_l599_c32_badd : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l599_c32_badd_left,
BIN_OP_PLUS_uxn_opcodes_h_l599_c32_badd_right,
BIN_OP_PLUS_uxn_opcodes_h_l599_c32_badd_return_output);

-- MUX_uxn_opcodes_h_l599_c16_89a3
MUX_uxn_opcodes_h_l599_c16_89a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l599_c16_89a3_cond,
MUX_uxn_opcodes_h_l599_c16_89a3_iftrue,
MUX_uxn_opcodes_h_l599_c16_89a3_iffalse,
MUX_uxn_opcodes_h_l599_c16_89a3_return_output);

-- MUX_uxn_opcodes_h_l600_c16_9fe0
MUX_uxn_opcodes_h_l600_c16_9fe0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l600_c16_9fe0_cond,
MUX_uxn_opcodes_h_l600_c16_9fe0_iftrue,
MUX_uxn_opcodes_h_l600_c16_9fe0_iffalse,
MUX_uxn_opcodes_h_l600_c16_9fe0_return_output);

-- device_out_uxn_opcodes_h_l601_c23_cf7c
device_out_uxn_opcodes_h_l601_c23_cf7c : entity work.device_out_0CLK_b285e9e3 port map (
clk,
device_out_uxn_opcodes_h_l601_c23_cf7c_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l601_c23_cf7c_device_address,
device_out_uxn_opcodes_h_l601_c23_cf7c_value,
device_out_uxn_opcodes_h_l601_c23_cf7c_phase,
device_out_uxn_opcodes_h_l601_c23_cf7c_previous_device_ram_read,
device_out_uxn_opcodes_h_l601_c23_cf7c_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l608_c24_2bd0
BIN_OP_AND_uxn_opcodes_h_l608_c24_2bd0 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l608_c24_2bd0_left,
BIN_OP_AND_uxn_opcodes_h_l608_c24_2bd0_right,
BIN_OP_AND_uxn_opcodes_h_l608_c24_2bd0_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l609_c3_6ce4
is_second_deo_MUX_uxn_opcodes_h_l609_c3_6ce4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l609_c3_6ce4_cond,
is_second_deo_MUX_uxn_opcodes_h_l609_c3_6ce4_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l609_c3_6ce4_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l609_c3_6ce4_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l609_c3_6ce4
current_deo_phase_MUX_uxn_opcodes_h_l609_c3_6ce4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l609_c3_6ce4_cond,
current_deo_phase_MUX_uxn_opcodes_h_l609_c3_6ce4_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l609_c3_6ce4_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l609_c3_6ce4_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l613_c4_3da1
BIN_OP_PLUS_uxn_opcodes_h_l613_c4_3da1 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l613_c4_3da1_left,
BIN_OP_PLUS_uxn_opcodes_h_l613_c4_3da1_right,
BIN_OP_PLUS_uxn_opcodes_h_l613_c4_3da1_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_device_ram_read,
 -- Registers
 t8,
 n8,
 l8,
 current_deo_phase,
 deo_param0,
 deo_param1,
 is_second_deo,
 result,
 device_out_result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l567_c6_ef3a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_fb15_return_output,
 n8_MUX_uxn_opcodes_h_l567_c2_57fb_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l567_c2_57fb_return_output,
 deo_param1_MUX_uxn_opcodes_h_l567_c2_57fb_return_output,
 t8_MUX_uxn_opcodes_h_l567_c2_57fb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_57fb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l567_c2_57fb_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_57fb_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l567_c2_57fb_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l567_c2_57fb_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_57fb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_57fb_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_57fb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_57fb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_57fb_return_output,
 device_out_result_MUX_uxn_opcodes_h_l567_c2_57fb_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l567_c2_57fb_return_output,
 deo_param0_MUX_uxn_opcodes_h_l567_c2_57fb_return_output,
 l8_MUX_uxn_opcodes_h_l567_c2_57fb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l574_c11_7413_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_5538_return_output,
 n8_MUX_uxn_opcodes_h_l574_c7_fb15_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l574_c7_fb15_return_output,
 deo_param1_MUX_uxn_opcodes_h_l574_c7_fb15_return_output,
 t8_MUX_uxn_opcodes_h_l574_c7_fb15_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_fb15_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l574_c7_fb15_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_fb15_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_fb15_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l574_c7_fb15_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_fb15_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_fb15_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_fb15_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_fb15_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_fb15_return_output,
 device_out_result_MUX_uxn_opcodes_h_l574_c7_fb15_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l574_c7_fb15_return_output,
 deo_param0_MUX_uxn_opcodes_h_l574_c7_fb15_return_output,
 l8_MUX_uxn_opcodes_h_l574_c7_fb15_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l577_c11_6814_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output,
 n8_MUX_uxn_opcodes_h_l577_c7_5538_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l577_c7_5538_return_output,
 deo_param1_MUX_uxn_opcodes_h_l577_c7_5538_return_output,
 t8_MUX_uxn_opcodes_h_l577_c7_5538_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_5538_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l577_c7_5538_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_5538_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_5538_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l577_c7_5538_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_5538_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_5538_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_5538_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_5538_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_5538_return_output,
 device_out_result_MUX_uxn_opcodes_h_l577_c7_5538_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l577_c7_5538_return_output,
 deo_param0_MUX_uxn_opcodes_h_l577_c7_5538_return_output,
 l8_MUX_uxn_opcodes_h_l577_c7_5538_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l581_c11_858f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_a30f_return_output,
 n8_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output,
 deo_param1_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output,
 device_out_result_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output,
 deo_param0_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output,
 l8_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l584_c11_1090_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_5f19_return_output,
 n8_MUX_uxn_opcodes_h_l584_c7_a30f_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l584_c7_a30f_return_output,
 deo_param1_MUX_uxn_opcodes_h_l584_c7_a30f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_a30f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l584_c7_a30f_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_a30f_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_a30f_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l584_c7_a30f_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_a30f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_a30f_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_a30f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_a30f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_a30f_return_output,
 device_out_result_MUX_uxn_opcodes_h_l584_c7_a30f_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l584_c7_a30f_return_output,
 deo_param0_MUX_uxn_opcodes_h_l584_c7_a30f_return_output,
 l8_MUX_uxn_opcodes_h_l584_c7_a30f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l588_c11_2c75_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_efaa_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l588_c7_5f19_return_output,
 deo_param1_MUX_uxn_opcodes_h_l588_c7_5f19_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_5f19_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l588_c7_5f19_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_5f19_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_5f19_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l588_c7_5f19_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_5f19_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_5f19_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_5f19_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_5f19_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_5f19_return_output,
 device_out_result_MUX_uxn_opcodes_h_l588_c7_5f19_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l588_c7_5f19_return_output,
 deo_param0_MUX_uxn_opcodes_h_l588_c7_5f19_return_output,
 l8_MUX_uxn_opcodes_h_l588_c7_5f19_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l591_c11_3748_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_881d_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l591_c7_efaa_return_output,
 deo_param1_MUX_uxn_opcodes_h_l591_c7_efaa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_efaa_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l591_c7_efaa_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_efaa_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_efaa_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l591_c7_efaa_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_efaa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_efaa_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_efaa_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_efaa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_efaa_return_output,
 device_out_result_MUX_uxn_opcodes_h_l591_c7_efaa_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l591_c7_efaa_return_output,
 deo_param0_MUX_uxn_opcodes_h_l591_c7_efaa_return_output,
 l8_MUX_uxn_opcodes_h_l591_c7_efaa_return_output,
 sp_relative_shift_uxn_opcodes_h_l595_c30_4192_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l599_c32_badd_return_output,
 MUX_uxn_opcodes_h_l599_c16_89a3_return_output,
 MUX_uxn_opcodes_h_l600_c16_9fe0_return_output,
 device_out_uxn_opcodes_h_l601_c23_cf7c_return_output,
 BIN_OP_AND_uxn_opcodes_h_l608_c24_2bd0_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l609_c3_6ce4_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l609_c3_6ce4_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l613_c4_3da1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_ef3a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_ef3a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_ef3a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_fb15_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_fb15_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l574_c7_fb15_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l567_c2_57fb_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l567_c2_57fb_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_fb15_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l567_c2_57fb_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l567_c2_57fb_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_fb15_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l567_c2_57fb_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l567_c2_57fb_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l574_c7_fb15_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l567_c2_57fb_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l567_c2_57fb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l569_c3_1327 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_fb15_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_57fb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_57fb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_fb15_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l567_c2_57fb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l567_c2_57fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_fb15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_57fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_57fb_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_fb15_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l567_c2_57fb_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l567_c2_57fb_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_fb15_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l567_c2_57fb_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l567_c2_57fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_fb15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_57fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_57fb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_fb15_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_57fb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_57fb_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_fb15_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_57fb_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_57fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_fb15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_57fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_57fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_fb15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_57fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_57fb_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_fb15_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l567_c2_57fb_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l567_c2_57fb_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l572_c3_c4e0 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_fb15_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l567_c2_57fb_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l567_c2_57fb_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_fb15_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l567_c2_57fb_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l567_c2_57fb_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l574_c7_fb15_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l567_c2_57fb_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l567_c2_57fb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_7413_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_7413_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_7413_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_5538_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_5538_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_5538_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_5538_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l577_c7_5538_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l574_c7_fb15_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c7_5538_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_fb15_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l577_c7_5538_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_fb15_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l577_c7_5538_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l574_c7_fb15_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l575_c3_56cf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_5538_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_fb15_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l577_c7_5538_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_fb15_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_5538_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_fb15_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_5538_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_fb15_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l577_c7_5538_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_fb15_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_5538_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_fb15_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_5538_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_fb15_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_5538_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_fb15_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_5538_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_fb15_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_5538_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_fb15_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l577_c7_5538_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_fb15_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c7_5538_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_fb15_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l577_c7_5538_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_fb15_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l577_c7_5538_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l574_c7_fb15_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_6814_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_6814_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_6814_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_d4bf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l577_c7_5538_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l577_c7_5538_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l577_c7_5538_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c7_5538_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c7_5538_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c7_5538_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l577_c7_5538_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l577_c7_5538_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l577_c7_5538_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l577_c7_5538_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l577_c7_5538_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l577_c7_5538_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_5538_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l579_c3_8e05 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_5538_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_5538_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l577_c7_5538_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l577_c7_5538_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l577_c7_5538_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_5538_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_5538_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_5538_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_5538_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_5538_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_5538_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l577_c7_5538_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l577_c7_5538_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l577_c7_5538_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_5538_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_5538_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_5538_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_5538_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_5538_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_5538_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_5538_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_5538_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_5538_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_5538_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_5538_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_5538_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_5538_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_5538_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_5538_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l577_c7_5538_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l577_c7_5538_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l577_c7_5538_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c7_5538_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c7_5538_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c7_5538_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l577_c7_5538_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l577_c7_5538_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l577_c7_5538_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l577_c7_5538_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l577_c7_5538_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l577_c7_5538_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_858f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_858f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_858f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_a30f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_a30f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l584_c7_a30f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l581_c7_d4bf_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c7_a30f_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l581_c7_d4bf_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l584_c7_a30f_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l581_c7_d4bf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l582_c3_f3ff : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_a30f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_d4bf_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l584_c7_a30f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l581_c7_d4bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_a30f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_d4bf_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_a30f_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_d4bf_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c7_a30f_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_d4bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_a30f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_d4bf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_a30f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_d4bf_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_a30f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_d4bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_a30f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_d4bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_a30f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d4bf_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l584_c7_a30f_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_d4bf_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c7_a30f_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l581_c7_d4bf_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l584_c7_a30f_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l581_c7_d4bf_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l584_c7_a30f_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l581_c7_d4bf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_1090_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_1090_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_1090_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_5f19_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_5f19_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l584_c7_a30f_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l588_c7_5f19_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c7_a30f_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l588_c7_5f19_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l584_c7_a30f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l586_c3_2e48 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_5f19_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_a30f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l588_c7_5f19_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l584_c7_a30f_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_5f19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_a30f_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_5f19_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_a30f_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l588_c7_5f19_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c7_a30f_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_5f19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_a30f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_5f19_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_a30f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_5f19_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_a30f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_5f19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_a30f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_5f19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_a30f_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l588_c7_5f19_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l584_c7_a30f_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l588_c7_5f19_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c7_a30f_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l588_c7_5f19_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l584_c7_a30f_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l588_c7_5f19_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l584_c7_a30f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_2c75_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_2c75_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_2c75_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_efaa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_efaa_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l591_c7_efaa_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l588_c7_5f19_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l591_c7_efaa_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l588_c7_5f19_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l589_c3_994b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_efaa_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_5f19_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l591_c7_efaa_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l588_c7_5f19_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_efaa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_5f19_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_efaa_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_5f19_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l591_c7_efaa_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l588_c7_5f19_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_efaa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_5f19_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_efaa_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_5f19_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_efaa_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_5f19_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_efaa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_5f19_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_efaa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_5f19_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l591_c7_efaa_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l588_c7_5f19_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l591_c7_efaa_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l588_c7_5f19_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l591_c7_efaa_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l588_c7_5f19_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l591_c7_efaa_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l588_c7_5f19_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_3748_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_3748_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_3748_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_881d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_881d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_881d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_881d_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l609_c3_6ce4_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l591_c7_efaa_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l591_c7_efaa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l593_c3_f1d8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l591_c7_efaa_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_efaa_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l591_c7_efaa_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_efaa_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_efaa_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l591_c7_efaa_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_efaa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_efaa_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_efaa_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_efaa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_efaa_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l591_c7_efaa_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l609_c3_6ce4_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l591_c7_efaa_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l591_c7_efaa_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l591_c7_efaa_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l595_c30_4192_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l595_c30_4192_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l595_c30_4192_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l595_c30_4192_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l599_c16_89a3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l599_c16_89a3_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l599_c16_89a3_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l599_c32_badd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l599_c32_badd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l599_c32_badd_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l599_c16_89a3_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l600_c16_9fe0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l600_c16_9fe0_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l600_c16_9fe0_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l600_c16_9fe0_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l601_c23_cf7c_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l601_c23_cf7c_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l601_c23_cf7c_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l601_c23_cf7c_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l601_c23_cf7c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l601_c23_cf7c_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l602_c32_ec86_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l603_c31_82e3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l604_c26_1f2f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l605_c29_149e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l606_c25_5af7_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l607_c21_30dd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l608_c24_2bd0_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l608_c24_2bd0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l608_c24_2bd0_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l609_c3_6ce4_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l609_c3_6ce4_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l609_c3_6ce4_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l609_c3_6ce4_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l610_c4_0b55 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l609_c3_6ce4_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l613_c4_51cd : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l609_c3_6ce4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l613_c4_3da1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l613_c4_3da1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l613_c4_3da1_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_367b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_330f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_13e0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_d86f_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_cb2f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_1b7d_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_2a15_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_DUPLICATE_814c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l584_l574_l577_l588_l581_l591_DUPLICATE_15cb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l608_l609_DUPLICATE_abdf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6e05_uxn_opcodes_h_l617_l560_DUPLICATE_d961_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_l8 : unsigned(7 downto 0);
variable REG_VAR_current_deo_phase : unsigned(7 downto 0);
variable REG_VAR_deo_param0 : unsigned(7 downto 0);
variable REG_VAR_deo_param1 : unsigned(7 downto 0);
variable REG_VAR_is_second_deo : unsigned(0 downto 0);
variable REG_VAR_result : opcode_result_t;
variable REG_VAR_device_out_result : device_out_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_l8 := l8;
  REG_VAR_current_deo_phase := current_deo_phase;
  REG_VAR_deo_param0 := deo_param0;
  REG_VAR_deo_param1 := deo_param1;
  REG_VAR_is_second_deo := is_second_deo;
  REG_VAR_result := result;
  REG_VAR_device_out_result := device_out_result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_6814_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l579_c3_8e05 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_5538_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l579_c3_8e05;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_7413_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_3748_right := to_unsigned(6, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l582_c3_f3ff := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l582_c3_f3ff;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_ef3a_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l593_c3_f1d8 := resize(to_unsigned(0, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l593_c3_f1d8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l613_c4_3da1_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l586_c3_2e48 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l586_c3_2e48;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l569_c3_1327 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l569_c3_1327;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l575_c3_56cf := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l575_c3_56cf;
     VAR_sp_relative_shift_uxn_opcodes_h_l595_c30_4192_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_858f_right := to_unsigned(3, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_881d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_1090_right := to_unsigned(4, 3);
     VAR_current_deo_phase_uxn_opcodes_h_l610_c4_0b55 := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l609_c3_6ce4_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l610_c4_0b55;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l589_c3_994b := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l589_c3_994b;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l599_c32_badd_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue := to_unsigned(0, 1);
     VAR_current_deo_phase_uxn_opcodes_h_l572_c3_c4e0 := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l572_c3_c4e0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_2c75_right := to_unsigned(5, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue := to_unsigned(0, 1);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_5538_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l595_c30_4192_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_is_second_deo_MUX_uxn_opcodes_h_l609_c3_6ce4_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_device_ram_read := previous_device_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l613_c4_3da1_left := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c7_5538_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue := current_deo_phase;
     VAR_device_out_uxn_opcodes_h_l601_c23_cf7c_phase := current_deo_phase;
     VAR_deo_param0_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l577_c7_5538_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue := deo_param0;
     VAR_deo_param1_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l577_c7_5538_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue := deo_param1;
     VAR_device_out_result_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l577_c7_5538_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue := device_out_result;
     VAR_sp_relative_shift_uxn_opcodes_h_l595_c30_4192_ins := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l608_c24_2bd0_right := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l599_c16_89a3_cond := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l600_c16_9fe0_cond := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c7_5538_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l609_c3_6ce4_iffalse := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l600_c16_9fe0_iffalse := l8;
     VAR_l8_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l577_c7_5538_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse := l8;
     VAR_MUX_uxn_opcodes_h_l600_c16_9fe0_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l577_c7_5538_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_ef3a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_7413_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_6814_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_858f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_1090_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_2c75_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_3748_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l601_c23_cf7c_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_l8_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l577_c7_5538_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l599_c32_badd_left := t8;
     VAR_MUX_uxn_opcodes_h_l599_c16_89a3_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l577_c7_5538_iffalse := t8;
     -- BIN_OP_PLUS[uxn_opcodes_h_l613_c4_3da1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l613_c4_3da1_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l613_c4_3da1_left;
     BIN_OP_PLUS_uxn_opcodes_h_l613_c4_3da1_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l613_c4_3da1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l613_c4_3da1_return_output := BIN_OP_PLUS_uxn_opcodes_h_l613_c4_3da1_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_1b7d LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_1b7d_return_output := result.sp_relative_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l591_c7_efaa] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l591_c7_efaa_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l595_c30_4192] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l595_c30_4192_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l595_c30_4192_ins;
     sp_relative_shift_uxn_opcodes_h_l595_c30_4192_x <= VAR_sp_relative_shift_uxn_opcodes_h_l595_c30_4192_x;
     sp_relative_shift_uxn_opcodes_h_l595_c30_4192_y <= VAR_sp_relative_shift_uxn_opcodes_h_l595_c30_4192_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l595_c30_4192_return_output := sp_relative_shift_uxn_opcodes_h_l595_c30_4192_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_DUPLICATE_814c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_DUPLICATE_814c_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l584_c11_1090] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l584_c11_1090_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_1090_left;
     BIN_OP_EQ_uxn_opcodes_h_l584_c11_1090_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_1090_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_1090_return_output := BIN_OP_EQ_uxn_opcodes_h_l584_c11_1090_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_cb2f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_cb2f_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l591_c11_3748] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l591_c11_3748_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_3748_left;
     BIN_OP_EQ_uxn_opcodes_h_l591_c11_3748_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_3748_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_3748_return_output := BIN_OP_EQ_uxn_opcodes_h_l591_c11_3748_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l588_c11_2c75] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l588_c11_2c75_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_2c75_left;
     BIN_OP_EQ_uxn_opcodes_h_l588_c11_2c75_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_2c75_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_2c75_return_output := BIN_OP_EQ_uxn_opcodes_h_l588_c11_2c75_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l577_c11_6814] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l577_c11_6814_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_6814_left;
     BIN_OP_EQ_uxn_opcodes_h_l577_c11_6814_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_6814_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_6814_return_output := BIN_OP_EQ_uxn_opcodes_h_l577_c11_6814_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_13e0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_13e0_return_output := result.vram_write_layer;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_d86f LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_d86f_return_output := result.vram_address;

     -- BIN_OP_PLUS[uxn_opcodes_h_l599_c32_badd] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l599_c32_badd_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l599_c32_badd_left;
     BIN_OP_PLUS_uxn_opcodes_h_l599_c32_badd_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l599_c32_badd_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l599_c32_badd_return_output := BIN_OP_PLUS_uxn_opcodes_h_l599_c32_badd_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_330f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_330f_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_2a15 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_2a15_return_output := result.device_ram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l584_l574_l577_l588_l581_l591_DUPLICATE_15cb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l584_l574_l577_l588_l581_l591_DUPLICATE_15cb_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l567_c6_ef3a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l567_c6_ef3a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_ef3a_left;
     BIN_OP_EQ_uxn_opcodes_h_l567_c6_ef3a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_ef3a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_ef3a_return_output := BIN_OP_EQ_uxn_opcodes_h_l567_c6_ef3a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l581_c11_858f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l581_c11_858f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_858f_left;
     BIN_OP_EQ_uxn_opcodes_h_l581_c11_858f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_858f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_858f_return_output := BIN_OP_EQ_uxn_opcodes_h_l581_c11_858f_return_output;

     -- MUX[uxn_opcodes_h_l600_c16_9fe0] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l600_c16_9fe0_cond <= VAR_MUX_uxn_opcodes_h_l600_c16_9fe0_cond;
     MUX_uxn_opcodes_h_l600_c16_9fe0_iftrue <= VAR_MUX_uxn_opcodes_h_l600_c16_9fe0_iftrue;
     MUX_uxn_opcodes_h_l600_c16_9fe0_iffalse <= VAR_MUX_uxn_opcodes_h_l600_c16_9fe0_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l600_c16_9fe0_return_output := MUX_uxn_opcodes_h_l600_c16_9fe0_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_367b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_367b_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l574_c11_7413] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l574_c11_7413_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_7413_left;
     BIN_OP_EQ_uxn_opcodes_h_l574_c11_7413_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_7413_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_7413_return_output := BIN_OP_EQ_uxn_opcodes_h_l574_c11_7413_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_fb15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_ef3a_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l567_c2_57fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_ef3a_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l567_c2_57fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_ef3a_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l567_c2_57fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_ef3a_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l567_c2_57fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_ef3a_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l567_c2_57fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_ef3a_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l567_c2_57fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_ef3a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l567_c2_57fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_ef3a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_57fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_ef3a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_57fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_ef3a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_57fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_ef3a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_57fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_ef3a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_57fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_ef3a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_57fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_ef3a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_57fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_ef3a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l567_c2_57fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_ef3a_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l567_c2_57fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_ef3a_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l567_c2_57fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_ef3a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l567_c2_57fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c6_ef3a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_5538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_7413_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_fb15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_7413_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_fb15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_7413_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_fb15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_7413_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_fb15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_7413_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_fb15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_7413_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l574_c7_fb15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_7413_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l574_c7_fb15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_7413_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_fb15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_7413_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_fb15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_7413_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_fb15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_7413_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_fb15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_7413_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_fb15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_7413_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_fb15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_7413_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_fb15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_7413_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_fb15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_7413_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_fb15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_7413_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_fb15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_7413_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l574_c7_fb15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_7413_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_d4bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_6814_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c7_5538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_6814_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l577_c7_5538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_6814_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l577_c7_5538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_6814_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l577_c7_5538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_6814_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c7_5538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_6814_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l577_c7_5538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_6814_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l577_c7_5538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_6814_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_5538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_6814_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_5538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_6814_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_5538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_6814_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_5538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_6814_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_5538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_6814_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_5538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_6814_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_5538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_6814_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l577_c7_5538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_6814_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l577_c7_5538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_6814_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_5538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_6814_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l577_c7_5538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_6814_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_a30f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_858f_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l581_c7_d4bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_858f_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l581_c7_d4bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_858f_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l581_c7_d4bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_858f_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_d4bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_858f_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l581_c7_d4bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_858f_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l581_c7_d4bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_858f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l581_c7_d4bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_858f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_d4bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_858f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_d4bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_858f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d4bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_858f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_d4bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_858f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_d4bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_858f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_d4bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_858f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_d4bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_858f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l581_c7_d4bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_858f_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_d4bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_858f_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_d4bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_858f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_5f19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_1090_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c7_a30f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_1090_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l584_c7_a30f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_1090_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l584_c7_a30f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_1090_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l584_c7_a30f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_1090_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c7_a30f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_1090_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l584_c7_a30f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_1090_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l584_c7_a30f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_1090_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_a30f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_1090_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_a30f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_1090_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_a30f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_1090_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_a30f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_1090_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_a30f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_1090_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_a30f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_1090_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_a30f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_1090_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l584_c7_a30f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_1090_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c7_a30f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_1090_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_a30f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_1090_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_efaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_2c75_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l588_c7_5f19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_2c75_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l588_c7_5f19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_2c75_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l588_c7_5f19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_2c75_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l588_c7_5f19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_2c75_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l588_c7_5f19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_2c75_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l588_c7_5f19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_2c75_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_5f19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_2c75_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_5f19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_2c75_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_5f19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_2c75_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_5f19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_2c75_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_5f19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_2c75_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_5f19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_2c75_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_5f19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_2c75_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l588_c7_5f19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_2c75_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l588_c7_5f19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_2c75_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_5f19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_2c75_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_881d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_3748_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l591_c7_efaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_3748_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l591_c7_efaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_3748_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l591_c7_efaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_3748_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l591_c7_efaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_3748_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l591_c7_efaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_3748_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l591_c7_efaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_3748_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_efaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_3748_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_efaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_3748_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_efaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_3748_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_efaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_3748_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_efaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_3748_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_efaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_3748_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_efaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_3748_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l591_c7_efaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_3748_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l591_c7_efaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_3748_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_efaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_3748_return_output;
     VAR_MUX_uxn_opcodes_h_l599_c16_89a3_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l599_c32_badd_return_output, 8);
     VAR_current_deo_phase_uxn_opcodes_h_l613_c4_51cd := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l613_c4_3da1_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_1b7d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_1b7d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_5538_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_1b7d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_1b7d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_1b7d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_1b7d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_1b7d_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_330f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_330f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_5538_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_330f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_330f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_330f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_330f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_330f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l584_l574_l577_l588_l581_l591_DUPLICATE_15cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_5538_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l584_l574_l577_l588_l581_l591_DUPLICATE_15cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l584_l574_l577_l588_l581_l591_DUPLICATE_15cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l584_l574_l577_l588_l581_l591_DUPLICATE_15cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l584_l574_l577_l588_l581_l591_DUPLICATE_15cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l584_l574_l577_l588_l581_l591_DUPLICATE_15cb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_DUPLICATE_814c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_DUPLICATE_814c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_5538_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_DUPLICATE_814c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_DUPLICATE_814c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_DUPLICATE_814c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_DUPLICATE_814c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_cb2f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_cb2f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_5538_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_cb2f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_cb2f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_cb2f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_cb2f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_cb2f_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_13e0_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_13e0_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_5538_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_13e0_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_13e0_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_13e0_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_13e0_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_13e0_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_d86f_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_d86f_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l577_c7_5538_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_d86f_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_d86f_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_d86f_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_d86f_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_d86f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_2a15_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_2a15_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_5538_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_2a15_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_2a15_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_2a15_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_2a15_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_2a15_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_367b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_367b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l577_c7_5538_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_367b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_367b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_367b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_367b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l584_l574_l577_l588_l567_l581_l591_DUPLICATE_367b_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse := VAR_MUX_uxn_opcodes_h_l600_c16_9fe0_return_output;
     VAR_device_out_uxn_opcodes_h_l601_c23_cf7c_value := VAR_MUX_uxn_opcodes_h_l600_c16_9fe0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l591_c7_efaa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l595_c30_4192_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l609_c3_6ce4_iffalse := VAR_current_deo_phase_uxn_opcodes_h_l613_c4_51cd;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l591_c7_efaa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_efaa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_efaa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_efaa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_efaa_return_output;

     -- l8_MUX[uxn_opcodes_h_l591_c7_efaa] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l591_c7_efaa_cond <= VAR_l8_MUX_uxn_opcodes_h_l591_c7_efaa_cond;
     l8_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue;
     l8_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l591_c7_efaa_return_output := l8_MUX_uxn_opcodes_h_l591_c7_efaa_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l574_c7_fb15] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_fb15_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_fb15_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_fb15_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_fb15_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l591_c7_efaa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_efaa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_efaa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_efaa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_efaa_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l591_c7_efaa] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l591_c7_efaa_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l591_c7_efaa_cond;
     deo_param1_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l591_c7_efaa_return_output := deo_param1_MUX_uxn_opcodes_h_l591_c7_efaa_return_output;

     -- MUX[uxn_opcodes_h_l599_c16_89a3] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l599_c16_89a3_cond <= VAR_MUX_uxn_opcodes_h_l599_c16_89a3_cond;
     MUX_uxn_opcodes_h_l599_c16_89a3_iftrue <= VAR_MUX_uxn_opcodes_h_l599_c16_89a3_iftrue;
     MUX_uxn_opcodes_h_l599_c16_89a3_iffalse <= VAR_MUX_uxn_opcodes_h_l599_c16_89a3_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l599_c16_89a3_return_output := MUX_uxn_opcodes_h_l599_c16_89a3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l591_c7_efaa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_efaa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_efaa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_efaa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_efaa_return_output;

     -- t8_MUX[uxn_opcodes_h_l577_c7_5538] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l577_c7_5538_cond <= VAR_t8_MUX_uxn_opcodes_h_l577_c7_5538_cond;
     t8_MUX_uxn_opcodes_h_l577_c7_5538_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l577_c7_5538_iftrue;
     t8_MUX_uxn_opcodes_h_l577_c7_5538_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l577_c7_5538_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l577_c7_5538_return_output := t8_MUX_uxn_opcodes_h_l577_c7_5538_return_output;

     -- n8_MUX[uxn_opcodes_h_l584_c7_a30f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l584_c7_a30f_cond <= VAR_n8_MUX_uxn_opcodes_h_l584_c7_a30f_cond;
     n8_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue;
     n8_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l584_c7_a30f_return_output := n8_MUX_uxn_opcodes_h_l584_c7_a30f_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_5538_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_fb15_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse := VAR_MUX_uxn_opcodes_h_l599_c16_89a3_return_output;
     VAR_device_out_uxn_opcodes_h_l601_c23_cf7c_device_address := VAR_MUX_uxn_opcodes_h_l599_c16_89a3_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l591_c7_efaa_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse := VAR_l8_MUX_uxn_opcodes_h_l591_c7_efaa_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse := VAR_n8_MUX_uxn_opcodes_h_l584_c7_a30f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_efaa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_efaa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_efaa_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse := VAR_t8_MUX_uxn_opcodes_h_l577_c7_5538_return_output;
     -- t8_MUX[uxn_opcodes_h_l574_c7_fb15] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l574_c7_fb15_cond <= VAR_t8_MUX_uxn_opcodes_h_l574_c7_fb15_cond;
     t8_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue;
     t8_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l574_c7_fb15_return_output := t8_MUX_uxn_opcodes_h_l574_c7_fb15_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l588_c7_5f19] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l588_c7_5f19_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l588_c7_5f19_cond;
     deo_param1_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l588_c7_5f19_return_output := deo_param1_MUX_uxn_opcodes_h_l588_c7_5f19_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l588_c7_5f19] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_5f19_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_5f19_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_5f19_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_5f19_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l591_c7_efaa] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l591_c7_efaa_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l591_c7_efaa_cond;
     deo_param0_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l591_c7_efaa_return_output := deo_param0_MUX_uxn_opcodes_h_l591_c7_efaa_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l588_c7_5f19] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_5f19_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_5f19_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_5f19_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_5f19_return_output;

     -- l8_MUX[uxn_opcodes_h_l588_c7_5f19] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l588_c7_5f19_cond <= VAR_l8_MUX_uxn_opcodes_h_l588_c7_5f19_cond;
     l8_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue;
     l8_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l588_c7_5f19_return_output := l8_MUX_uxn_opcodes_h_l588_c7_5f19_return_output;

     -- n8_MUX[uxn_opcodes_h_l581_c7_d4bf] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l581_c7_d4bf_cond <= VAR_n8_MUX_uxn_opcodes_h_l581_c7_d4bf_cond;
     n8_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue;
     n8_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output := n8_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l577_c7_5538] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_5538_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_5538_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_5538_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_5538_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_5538_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_5538_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_5538_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_5538_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l588_c7_5f19] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_5f19_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_5f19_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_5f19_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_5f19_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_5538_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l591_c7_efaa_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l588_c7_5f19_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse := VAR_l8_MUX_uxn_opcodes_h_l588_c7_5f19_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l577_c7_5538_iffalse := VAR_n8_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_5f19_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_5f19_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_5f19_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse := VAR_t8_MUX_uxn_opcodes_h_l574_c7_fb15_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l584_c7_a30f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_a30f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_a30f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_a30f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_a30f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l584_c7_a30f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_a30f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_a30f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_a30f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_a30f_return_output;

     -- t8_MUX[uxn_opcodes_h_l567_c2_57fb] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l567_c2_57fb_cond <= VAR_t8_MUX_uxn_opcodes_h_l567_c2_57fb_cond;
     t8_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue;
     t8_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l567_c2_57fb_return_output := t8_MUX_uxn_opcodes_h_l567_c2_57fb_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l588_c7_5f19] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l588_c7_5f19_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l588_c7_5f19_cond;
     deo_param0_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l588_c7_5f19_return_output := deo_param0_MUX_uxn_opcodes_h_l588_c7_5f19_return_output;

     -- n8_MUX[uxn_opcodes_h_l577_c7_5538] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l577_c7_5538_cond <= VAR_n8_MUX_uxn_opcodes_h_l577_c7_5538_cond;
     n8_MUX_uxn_opcodes_h_l577_c7_5538_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l577_c7_5538_iftrue;
     n8_MUX_uxn_opcodes_h_l577_c7_5538_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l577_c7_5538_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l577_c7_5538_return_output := n8_MUX_uxn_opcodes_h_l577_c7_5538_return_output;

     -- l8_MUX[uxn_opcodes_h_l584_c7_a30f] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l584_c7_a30f_cond <= VAR_l8_MUX_uxn_opcodes_h_l584_c7_a30f_cond;
     l8_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue;
     l8_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l584_c7_a30f_return_output := l8_MUX_uxn_opcodes_h_l584_c7_a30f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l581_c7_d4bf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_d4bf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_d4bf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l584_c7_a30f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_a30f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_a30f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_a30f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_a30f_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l584_c7_a30f] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l584_c7_a30f_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l584_c7_a30f_cond;
     deo_param1_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l584_c7_a30f_return_output := deo_param1_MUX_uxn_opcodes_h_l584_c7_a30f_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l588_c7_5f19_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l584_c7_a30f_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse := VAR_l8_MUX_uxn_opcodes_h_l584_c7_a30f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse := VAR_n8_MUX_uxn_opcodes_h_l577_c7_5538_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_a30f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_a30f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_a30f_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l567_c2_57fb_return_output;
     -- deo_param1_MUX[uxn_opcodes_h_l581_c7_d4bf] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l581_c7_d4bf_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l581_c7_d4bf_cond;
     deo_param1_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output := deo_param1_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l584_c7_a30f] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l584_c7_a30f_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l584_c7_a30f_cond;
     deo_param0_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l584_c7_a30f_return_output := deo_param0_MUX_uxn_opcodes_h_l584_c7_a30f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l581_c7_d4bf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_d4bf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_d4bf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output;

     -- n8_MUX[uxn_opcodes_h_l574_c7_fb15] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l574_c7_fb15_cond <= VAR_n8_MUX_uxn_opcodes_h_l574_c7_fb15_cond;
     n8_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue;
     n8_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l574_c7_fb15_return_output := n8_MUX_uxn_opcodes_h_l574_c7_fb15_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l581_c7_d4bf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_d4bf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_d4bf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l584_c7_a30f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_a30f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_a30f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_a30f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_a30f_return_output;

     -- l8_MUX[uxn_opcodes_h_l581_c7_d4bf] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l581_c7_d4bf_cond <= VAR_l8_MUX_uxn_opcodes_h_l581_c7_d4bf_cond;
     l8_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue;
     l8_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output := l8_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l581_c7_d4bf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_d4bf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_d4bf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_a30f_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l584_c7_a30f_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l577_c7_5538_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l577_c7_5538_iffalse := VAR_l8_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse := VAR_n8_MUX_uxn_opcodes_h_l574_c7_fb15_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_5538_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_5538_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_5538_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l577_c7_5538] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_5538_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_5538_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_5538_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_5538_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_5538_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_5538_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_5538_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_5538_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l581_c7_d4bf] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l581_c7_d4bf_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l581_c7_d4bf_cond;
     deo_param0_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output := deo_param0_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output;

     -- n8_MUX[uxn_opcodes_h_l567_c2_57fb] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l567_c2_57fb_cond <= VAR_n8_MUX_uxn_opcodes_h_l567_c2_57fb_cond;
     n8_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue;
     n8_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l567_c2_57fb_return_output := n8_MUX_uxn_opcodes_h_l567_c2_57fb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l577_c7_5538] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_5538_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_5538_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_5538_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_5538_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_5538_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_5538_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_5538_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_5538_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l577_c7_5538] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_5538_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_5538_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_5538_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_5538_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_5538_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_5538_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_5538_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_5538_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l588_c7_5f19] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_5f19_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_5f19_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_5f19_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_5f19_return_output;

     -- l8_MUX[uxn_opcodes_h_l577_c7_5538] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l577_c7_5538_cond <= VAR_l8_MUX_uxn_opcodes_h_l577_c7_5538_cond;
     l8_MUX_uxn_opcodes_h_l577_c7_5538_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l577_c7_5538_iftrue;
     l8_MUX_uxn_opcodes_h_l577_c7_5538_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l577_c7_5538_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l577_c7_5538_return_output := l8_MUX_uxn_opcodes_h_l577_c7_5538_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l577_c7_5538] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l577_c7_5538_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l577_c7_5538_cond;
     deo_param1_MUX_uxn_opcodes_h_l577_c7_5538_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l577_c7_5538_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l577_c7_5538_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l577_c7_5538_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l577_c7_5538_return_output := deo_param1_MUX_uxn_opcodes_h_l577_c7_5538_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_5f19_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l577_c7_5538_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l577_c7_5538_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse := VAR_l8_MUX_uxn_opcodes_h_l577_c7_5538_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l567_c2_57fb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_5538_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_5538_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_5538_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l574_c7_fb15] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_fb15_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_fb15_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_fb15_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_fb15_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l574_c7_fb15] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_fb15_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_fb15_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_fb15_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_fb15_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l574_c7_fb15] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_fb15_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_fb15_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_fb15_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_fb15_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l577_c7_5538] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l577_c7_5538_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l577_c7_5538_cond;
     deo_param0_MUX_uxn_opcodes_h_l577_c7_5538_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l577_c7_5538_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l577_c7_5538_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l577_c7_5538_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l577_c7_5538_return_output := deo_param0_MUX_uxn_opcodes_h_l577_c7_5538_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l574_c7_fb15] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l574_c7_fb15_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_fb15_cond;
     deo_param1_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_fb15_return_output := deo_param1_MUX_uxn_opcodes_h_l574_c7_fb15_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l591_c7_efaa] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_efaa_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_efaa_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_efaa_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_efaa_return_output;

     -- l8_MUX[uxn_opcodes_h_l574_c7_fb15] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l574_c7_fb15_cond <= VAR_l8_MUX_uxn_opcodes_h_l574_c7_fb15_cond;
     l8_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue;
     l8_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l574_c7_fb15_return_output := l8_MUX_uxn_opcodes_h_l574_c7_fb15_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_881d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_efaa_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l577_c7_5538_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_fb15_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse := VAR_l8_MUX_uxn_opcodes_h_l574_c7_fb15_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_fb15_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_fb15_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_fb15_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l567_c2_57fb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_57fb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_57fb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_57fb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_57fb_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l574_c7_fb15] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l574_c7_fb15_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_fb15_cond;
     deo_param0_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_fb15_return_output := deo_param0_MUX_uxn_opcodes_h_l574_c7_fb15_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l567_c2_57fb] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l567_c2_57fb_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l567_c2_57fb_cond;
     deo_param1_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l567_c2_57fb_return_output := deo_param1_MUX_uxn_opcodes_h_l567_c2_57fb_return_output;

     -- l8_MUX[uxn_opcodes_h_l567_c2_57fb] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l567_c2_57fb_cond <= VAR_l8_MUX_uxn_opcodes_h_l567_c2_57fb_cond;
     l8_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue;
     l8_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l567_c2_57fb_return_output := l8_MUX_uxn_opcodes_h_l567_c2_57fb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l597_c1_881d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_881d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_881d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_881d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_881d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_881d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_881d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_881d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_881d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l567_c2_57fb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_57fb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_57fb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_57fb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_57fb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l567_c2_57fb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_57fb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_57fb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_57fb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_57fb_return_output;

     -- Submodule level 8
     VAR_device_out_uxn_opcodes_h_l601_c23_cf7c_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l597_c1_881d_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_fb15_return_output;
     REG_VAR_deo_param1 := VAR_deo_param1_MUX_uxn_opcodes_h_l567_c2_57fb_return_output;
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l567_c2_57fb_return_output;
     -- device_out[uxn_opcodes_h_l601_c23_cf7c] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l601_c23_cf7c_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l601_c23_cf7c_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l601_c23_cf7c_device_address <= VAR_device_out_uxn_opcodes_h_l601_c23_cf7c_device_address;
     device_out_uxn_opcodes_h_l601_c23_cf7c_value <= VAR_device_out_uxn_opcodes_h_l601_c23_cf7c_value;
     device_out_uxn_opcodes_h_l601_c23_cf7c_phase <= VAR_device_out_uxn_opcodes_h_l601_c23_cf7c_phase;
     device_out_uxn_opcodes_h_l601_c23_cf7c_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l601_c23_cf7c_previous_device_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l601_c23_cf7c_return_output := device_out_uxn_opcodes_h_l601_c23_cf7c_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l567_c2_57fb] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l567_c2_57fb_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l567_c2_57fb_cond;
     deo_param0_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l567_c2_57fb_return_output := deo_param0_MUX_uxn_opcodes_h_l567_c2_57fb_return_output;

     -- Submodule level 9
     REG_VAR_deo_param0 := VAR_deo_param0_MUX_uxn_opcodes_h_l567_c2_57fb_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse := VAR_device_out_uxn_opcodes_h_l601_c23_cf7c_return_output;
     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l608_l609_DUPLICATE_abdf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l608_l609_DUPLICATE_abdf_return_output := VAR_device_out_uxn_opcodes_h_l601_c23_cf7c_return_output.is_deo_done;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l604_c26_1f2f] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l604_c26_1f2f_return_output := VAR_device_out_uxn_opcodes_h_l601_c23_cf7c_return_output.is_vram_write;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l603_c31_82e3] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l603_c31_82e3_return_output := VAR_device_out_uxn_opcodes_h_l601_c23_cf7c_return_output.device_ram_address;

     -- device_out_result_MUX[uxn_opcodes_h_l591_c7_efaa] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l591_c7_efaa_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l591_c7_efaa_cond;
     device_out_result_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l591_c7_efaa_return_output := device_out_result_MUX_uxn_opcodes_h_l591_c7_efaa_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l602_c32_ec86] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l602_c32_ec86_return_output := VAR_device_out_uxn_opcodes_h_l601_c23_cf7c_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_opcodes_h_l605_c29_149e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l605_c29_149e_return_output := VAR_device_out_uxn_opcodes_h_l601_c23_cf7c_return_output.vram_write_layer;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d[uxn_opcodes_h_l606_c25_5af7] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l606_c25_5af7_return_output := VAR_device_out_uxn_opcodes_h_l601_c23_cf7c_return_output.vram_address;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_opcodes_h_l607_c21_30dd] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l607_c21_30dd_return_output := VAR_device_out_uxn_opcodes_h_l601_c23_cf7c_return_output.u8_value;

     -- Submodule level 10
     VAR_BIN_OP_AND_uxn_opcodes_h_l608_c24_2bd0_left := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l608_l609_DUPLICATE_abdf_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l609_c3_6ce4_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l608_l609_DUPLICATE_abdf_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l609_c3_6ce4_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l608_l609_DUPLICATE_abdf_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l602_c32_ec86_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l604_c26_1f2f_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l605_c29_149e_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l606_c25_5af7_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l603_c31_82e3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l607_c21_30dd_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l591_c7_efaa_return_output;
     -- current_deo_phase_MUX[uxn_opcodes_h_l609_c3_6ce4] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l609_c3_6ce4_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l609_c3_6ce4_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l609_c3_6ce4_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l609_c3_6ce4_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l609_c3_6ce4_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l609_c3_6ce4_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l609_c3_6ce4_return_output := current_deo_phase_MUX_uxn_opcodes_h_l609_c3_6ce4_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l591_c7_efaa] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_efaa_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_efaa_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_efaa_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_efaa_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l591_c7_efaa] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l591_c7_efaa_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l591_c7_efaa_cond;
     result_u8_value_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l591_c7_efaa_return_output := result_u8_value_MUX_uxn_opcodes_h_l591_c7_efaa_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l588_c7_5f19] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l588_c7_5f19_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l588_c7_5f19_cond;
     device_out_result_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l588_c7_5f19_return_output := device_out_result_MUX_uxn_opcodes_h_l588_c7_5f19_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l609_c3_6ce4] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l609_c3_6ce4_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l609_c3_6ce4_cond;
     is_second_deo_MUX_uxn_opcodes_h_l609_c3_6ce4_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l609_c3_6ce4_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l609_c3_6ce4_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l609_c3_6ce4_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l609_c3_6ce4_return_output := is_second_deo_MUX_uxn_opcodes_h_l609_c3_6ce4_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l591_c7_efaa] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_efaa_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_efaa_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_efaa_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_efaa_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l591_c7_efaa] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_efaa_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_efaa_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_efaa_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_efaa_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l591_c7_efaa] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l591_c7_efaa_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l591_c7_efaa_cond;
     result_vram_address_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l591_c7_efaa_return_output := result_vram_address_MUX_uxn_opcodes_h_l591_c7_efaa_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l591_c7_efaa] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_efaa_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_efaa_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_efaa_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_efaa_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l608_c24_2bd0] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l608_c24_2bd0_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l608_c24_2bd0_left;
     BIN_OP_AND_uxn_opcodes_h_l608_c24_2bd0_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l608_c24_2bd0_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l608_c24_2bd0_return_output := BIN_OP_AND_uxn_opcodes_h_l608_c24_2bd0_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l608_c24_2bd0_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l609_c3_6ce4_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l588_c7_5f19_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l609_c3_6ce4_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_efaa_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_efaa_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_efaa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l591_c7_efaa_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l591_c7_efaa_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_efaa_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l591_c7_efaa] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l591_c7_efaa_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l591_c7_efaa_cond;
     is_second_deo_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l591_c7_efaa_return_output := is_second_deo_MUX_uxn_opcodes_h_l591_c7_efaa_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l584_c7_a30f] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l584_c7_a30f_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l584_c7_a30f_cond;
     device_out_result_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l584_c7_a30f_return_output := device_out_result_MUX_uxn_opcodes_h_l584_c7_a30f_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l588_c7_5f19] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l588_c7_5f19_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l588_c7_5f19_cond;
     result_vram_address_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l588_c7_5f19_return_output := result_vram_address_MUX_uxn_opcodes_h_l588_c7_5f19_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l588_c7_5f19] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_5f19_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_5f19_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_5f19_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_5f19_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l588_c7_5f19] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_5f19_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_5f19_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_5f19_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_5f19_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l588_c7_5f19] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l588_c7_5f19_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l588_c7_5f19_cond;
     result_u8_value_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l588_c7_5f19_return_output := result_u8_value_MUX_uxn_opcodes_h_l588_c7_5f19_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l588_c7_5f19] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_5f19_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_5f19_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_5f19_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_5f19_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l588_c7_5f19] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_5f19_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_5f19_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_5f19_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_5f19_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l591_c7_efaa] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l591_c7_efaa_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l591_c7_efaa_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l591_c7_efaa_return_output := current_deo_phase_MUX_uxn_opcodes_h_l591_c7_efaa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l591_c7_efaa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_efaa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_efaa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_efaa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_efaa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_efaa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_efaa_return_output;

     -- Submodule level 12
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l591_c7_efaa_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l584_c7_a30f_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l591_c7_efaa_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_5f19_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_5f19_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_efaa_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_5f19_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l588_c7_5f19_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l588_c7_5f19_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_5f19_return_output;
     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l584_c7_a30f] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_a30f_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_a30f_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_a30f_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_a30f_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l588_c7_5f19] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l588_c7_5f19_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l588_c7_5f19_cond;
     is_second_deo_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l588_c7_5f19_return_output := is_second_deo_MUX_uxn_opcodes_h_l588_c7_5f19_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l588_c7_5f19] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l588_c7_5f19_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l588_c7_5f19_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l588_c7_5f19_return_output := current_deo_phase_MUX_uxn_opcodes_h_l588_c7_5f19_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l584_c7_a30f] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l584_c7_a30f_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c7_a30f_cond;
     result_vram_address_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c7_a30f_return_output := result_vram_address_MUX_uxn_opcodes_h_l584_c7_a30f_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l581_c7_d4bf] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l581_c7_d4bf_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_d4bf_cond;
     device_out_result_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output := device_out_result_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l584_c7_a30f] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_a30f_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_a30f_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_a30f_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_a30f_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l584_c7_a30f] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_a30f_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_a30f_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_a30f_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_a30f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l584_c7_a30f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l584_c7_a30f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l584_c7_a30f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l584_c7_a30f_return_output := result_u8_value_MUX_uxn_opcodes_h_l584_c7_a30f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l588_c7_5f19] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_5f19_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_5f19_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_5f19_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_5f19_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_5f19_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_5f19_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l584_c7_a30f] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_a30f_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_a30f_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_a30f_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_a30f_return_output;

     -- Submodule level 13
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l588_c7_5f19_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l577_c7_5538_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l588_c7_5f19_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_a30f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_a30f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_5f19_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_a30f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l584_c7_a30f_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c7_a30f_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_a30f_return_output;
     -- result_vram_write_layer_MUX[uxn_opcodes_h_l581_c7_d4bf] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_d4bf_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_d4bf_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l581_c7_d4bf] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_d4bf_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_d4bf_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l581_c7_d4bf] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l581_c7_d4bf_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_d4bf_cond;
     result_vram_address_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output := result_vram_address_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l577_c7_5538] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l577_c7_5538_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l577_c7_5538_cond;
     device_out_result_MUX_uxn_opcodes_h_l577_c7_5538_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l577_c7_5538_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l577_c7_5538_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l577_c7_5538_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l577_c7_5538_return_output := device_out_result_MUX_uxn_opcodes_h_l577_c7_5538_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l581_c7_d4bf] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_d4bf_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_d4bf_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l581_c7_d4bf] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_d4bf_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_d4bf_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l581_c7_d4bf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l581_c7_d4bf_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l581_c7_d4bf_cond;
     result_u8_value_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output := result_u8_value_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l584_c7_a30f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_a30f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_a30f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_a30f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_a30f_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l584_c7_a30f] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l584_c7_a30f_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c7_a30f_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c7_a30f_return_output := current_deo_phase_MUX_uxn_opcodes_h_l584_c7_a30f_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l584_c7_a30f] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l584_c7_a30f_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c7_a30f_cond;
     is_second_deo_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c7_a30f_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c7_a30f_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c7_a30f_return_output := is_second_deo_MUX_uxn_opcodes_h_l584_c7_a30f_return_output;

     -- Submodule level 14
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c7_a30f_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l577_c7_5538_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c7_a30f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_5538_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_5538_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_a30f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_5538_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l577_c7_5538_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l577_c7_5538_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_5538_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output;
     -- current_deo_phase_MUX[uxn_opcodes_h_l581_c7_d4bf] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l581_c7_d4bf_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l581_c7_d4bf_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output := current_deo_phase_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l581_c7_d4bf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d4bf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d4bf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l577_c7_5538] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_5538_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_5538_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_5538_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_5538_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_5538_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_5538_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_5538_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_5538_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l577_c7_5538] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l577_c7_5538_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l577_c7_5538_cond;
     result_u8_value_MUX_uxn_opcodes_h_l577_c7_5538_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l577_c7_5538_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l577_c7_5538_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l577_c7_5538_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l577_c7_5538_return_output := result_u8_value_MUX_uxn_opcodes_h_l577_c7_5538_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l581_c7_d4bf] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l581_c7_d4bf_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l581_c7_d4bf_cond;
     is_second_deo_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l581_c7_d4bf_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l581_c7_d4bf_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output := is_second_deo_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l577_c7_5538] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l577_c7_5538_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l577_c7_5538_cond;
     result_vram_address_MUX_uxn_opcodes_h_l577_c7_5538_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l577_c7_5538_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l577_c7_5538_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l577_c7_5538_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l577_c7_5538_return_output := result_vram_address_MUX_uxn_opcodes_h_l577_c7_5538_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l574_c7_fb15] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l574_c7_fb15_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_fb15_cond;
     device_out_result_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_fb15_return_output := device_out_result_MUX_uxn_opcodes_h_l574_c7_fb15_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l577_c7_5538] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_5538_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_5538_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_5538_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_5538_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_5538_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_5538_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_5538_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_5538_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l577_c7_5538] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_5538_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_5538_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_5538_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_5538_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_5538_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_5538_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_5538_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_5538_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l577_c7_5538] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_5538_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_5538_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_5538_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_5538_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_5538_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_5538_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_5538_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_5538_return_output;

     -- Submodule level 15
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c7_5538_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_fb15_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c7_5538_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_5538_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_5538_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_5538_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_d4bf_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_5538_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l577_c7_5538_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l577_c7_5538_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_5538_return_output;
     -- current_deo_phase_MUX[uxn_opcodes_h_l577_c7_5538] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l577_c7_5538_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c7_5538_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l577_c7_5538_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c7_5538_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l577_c7_5538_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c7_5538_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c7_5538_return_output := current_deo_phase_MUX_uxn_opcodes_h_l577_c7_5538_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l577_c7_5538] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l577_c7_5538_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c7_5538_cond;
     is_second_deo_MUX_uxn_opcodes_h_l577_c7_5538_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c7_5538_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l577_c7_5538_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c7_5538_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c7_5538_return_output := is_second_deo_MUX_uxn_opcodes_h_l577_c7_5538_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l574_c7_fb15] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_fb15_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_fb15_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_fb15_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_fb15_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l574_c7_fb15] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l574_c7_fb15_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_fb15_cond;
     result_vram_address_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_fb15_return_output := result_vram_address_MUX_uxn_opcodes_h_l574_c7_fb15_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l574_c7_fb15] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_fb15_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_fb15_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_fb15_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_fb15_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l574_c7_fb15] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_fb15_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_fb15_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_fb15_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_fb15_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l574_c7_fb15] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l574_c7_fb15_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_fb15_cond;
     result_u8_value_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_fb15_return_output := result_u8_value_MUX_uxn_opcodes_h_l574_c7_fb15_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l567_c2_57fb] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l567_c2_57fb_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l567_c2_57fb_cond;
     device_out_result_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l567_c2_57fb_return_output := device_out_result_MUX_uxn_opcodes_h_l567_c2_57fb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l577_c7_5538] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_5538_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_5538_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_5538_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_5538_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_5538_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_5538_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_5538_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_5538_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l574_c7_fb15] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_fb15_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_fb15_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_fb15_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_fb15_return_output;

     -- Submodule level 16
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c7_5538_return_output;
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l567_c2_57fb_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c7_5538_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_fb15_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_fb15_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_5538_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_fb15_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_fb15_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_fb15_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_fb15_return_output;
     -- result_vram_address_MUX[uxn_opcodes_h_l567_c2_57fb] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l567_c2_57fb_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l567_c2_57fb_cond;
     result_vram_address_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l567_c2_57fb_return_output := result_vram_address_MUX_uxn_opcodes_h_l567_c2_57fb_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l574_c7_fb15] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l574_c7_fb15_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_fb15_cond;
     is_second_deo_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_fb15_return_output := is_second_deo_MUX_uxn_opcodes_h_l574_c7_fb15_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l567_c2_57fb] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_57fb_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_57fb_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_57fb_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_57fb_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l574_c7_fb15] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l574_c7_fb15_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_fb15_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_fb15_return_output := current_deo_phase_MUX_uxn_opcodes_h_l574_c7_fb15_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l567_c2_57fb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l567_c2_57fb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l567_c2_57fb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l567_c2_57fb_return_output := result_u8_value_MUX_uxn_opcodes_h_l567_c2_57fb_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l567_c2_57fb] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_57fb_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_57fb_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_57fb_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_57fb_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l567_c2_57fb] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_57fb_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_57fb_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_57fb_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_57fb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l574_c7_fb15] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_fb15_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_fb15_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_fb15_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_fb15_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_fb15_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_fb15_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l567_c2_57fb] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l567_c2_57fb_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l567_c2_57fb_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l567_c2_57fb_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l567_c2_57fb_return_output;

     -- Submodule level 17
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_fb15_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_fb15_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_fb15_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l567_c2_57fb] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l567_c2_57fb_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l567_c2_57fb_cond;
     is_second_deo_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l567_c2_57fb_return_output := is_second_deo_MUX_uxn_opcodes_h_l567_c2_57fb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l567_c2_57fb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_57fb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_57fb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_57fb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_57fb_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l567_c2_57fb] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l567_c2_57fb_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l567_c2_57fb_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l567_c2_57fb_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l567_c2_57fb_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l567_c2_57fb_return_output := current_deo_phase_MUX_uxn_opcodes_h_l567_c2_57fb_return_output;

     -- Submodule level 18
     REG_VAR_current_deo_phase := VAR_current_deo_phase_MUX_uxn_opcodes_h_l567_c2_57fb_return_output;
     REG_VAR_is_second_deo := VAR_is_second_deo_MUX_uxn_opcodes_h_l567_c2_57fb_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6e05_uxn_opcodes_h_l617_l560_DUPLICATE_d961 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6e05_uxn_opcodes_h_l617_l560_DUPLICATE_d961_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6e05(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l567_c2_57fb_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l567_c2_57fb_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c2_57fb_return_output,
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l567_c2_57fb_return_output,
     VAR_result_vram_address_MUX_uxn_opcodes_h_l567_c2_57fb_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l567_c2_57fb_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c2_57fb_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l567_c2_57fb_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c2_57fb_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c2_57fb_return_output);

     -- Submodule level 19
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6e05_uxn_opcodes_h_l617_l560_DUPLICATE_d961_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6e05_uxn_opcodes_h_l617_l560_DUPLICATE_d961_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_l8 <= REG_VAR_l8;
REG_COMB_current_deo_phase <= REG_VAR_current_deo_phase;
REG_COMB_deo_param0 <= REG_VAR_deo_param0;
REG_COMB_deo_param1 <= REG_VAR_deo_param1;
REG_COMB_is_second_deo <= REG_VAR_is_second_deo;
REG_COMB_result <= REG_VAR_result;
REG_COMB_device_out_result <= REG_VAR_device_out_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     l8 <= REG_COMB_l8;
     current_deo_phase <= REG_COMB_current_deo_phase;
     deo_param0 <= REG_COMB_deo_param0;
     deo_param1 <= REG_COMB_deo_param1;
     is_second_deo <= REG_COMB_is_second_deo;
     result <= REG_COMB_result;
     device_out_result <= REG_COMB_device_out_result;
 end if;
 end if;
end process;

end arch;
