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
-- Submodules: 40
entity deo_0CLK_ebde644c is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo_0CLK_ebde644c;
architecture arch of deo_0CLK_ebde644c is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal device_out_result : device_out_result_t := device_out_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;
signal REG_COMB_device_out_result : device_out_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l514_c6_52de]
signal BIN_OP_EQ_uxn_opcodes_h_l514_c6_52de_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l514_c6_52de_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l514_c6_52de_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l527_c7_68f4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_68f4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_68f4_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l514_c2_c89d]
signal t8_MUX_uxn_opcodes_h_l514_c2_c89d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l514_c2_c89d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l514_c2_c89d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l514_c2_c89d_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l514_c2_c89d]
signal n8_MUX_uxn_opcodes_h_l514_c2_c89d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l514_c2_c89d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l514_c2_c89d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l514_c2_c89d_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l514_c2_c89d]
signal device_out_result_MUX_uxn_opcodes_h_l514_c2_c89d_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l514_c2_c89d_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l514_c2_c89d_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l514_c2_c89d_return_output : device_out_result_t;

-- result_MUX[uxn_opcodes_h_l514_c2_c89d]
signal result_MUX_uxn_opcodes_h_l514_c2_c89d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l514_c2_c89d_iftrue : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l514_c2_c89d_iffalse : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l514_c2_c89d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l527_c11_fe5b]
signal BIN_OP_EQ_uxn_opcodes_h_l527_c11_fe5b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l527_c11_fe5b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l527_c11_fe5b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l530_c7_c48e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_c48e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_c48e_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l527_c7_68f4]
signal t8_MUX_uxn_opcodes_h_l527_c7_68f4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l527_c7_68f4_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l527_c7_68f4]
signal n8_MUX_uxn_opcodes_h_l527_c7_68f4_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l527_c7_68f4_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l527_c7_68f4]
signal device_out_result_MUX_uxn_opcodes_h_l527_c7_68f4_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l527_c7_68f4_return_output : device_out_result_t;

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l527_c7_68f4]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_68f4_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_68f4_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l527_c7_68f4]
signal result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_68f4_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_68f4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l527_c7_68f4]
signal result_u8_value_MUX_uxn_opcodes_h_l527_c7_68f4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l527_c7_68f4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l527_c7_68f4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_68f4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_68f4_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l527_c7_68f4]
signal result_u16_value_MUX_uxn_opcodes_h_l527_c7_68f4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l527_c7_68f4_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l527_c7_68f4]
signal result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_68f4_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_68f4_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l527_c7_68f4]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_68f4_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_68f4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l527_c7_68f4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_68f4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_68f4_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l527_c7_68f4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_68f4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_68f4_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l530_c11_551f]
signal BIN_OP_EQ_uxn_opcodes_h_l530_c11_551f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l530_c11_551f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l530_c11_551f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l534_c1_402b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_402b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_402b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_402b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_402b_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l530_c7_c48e]
signal t8_MUX_uxn_opcodes_h_l530_c7_c48e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l530_c7_c48e_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l530_c7_c48e]
signal n8_MUX_uxn_opcodes_h_l530_c7_c48e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l530_c7_c48e_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l530_c7_c48e]
signal device_out_result_MUX_uxn_opcodes_h_l530_c7_c48e_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l530_c7_c48e_return_output : device_out_result_t;

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l530_c7_c48e]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_c48e_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_c48e_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l530_c7_c48e]
signal result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_c48e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_c48e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l530_c7_c48e]
signal result_u8_value_MUX_uxn_opcodes_h_l530_c7_c48e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l530_c7_c48e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l530_c7_c48e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_c48e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_c48e_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l530_c7_c48e]
signal result_u16_value_MUX_uxn_opcodes_h_l530_c7_c48e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l530_c7_c48e_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l530_c7_c48e]
signal result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_c48e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_c48e_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l530_c7_c48e]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_c48e_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_c48e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l530_c7_c48e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_c48e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_c48e_return_output : signed(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l532_c30_bdd9]
signal sp_relative_shift_uxn_opcodes_h_l532_c30_bdd9_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l532_c30_bdd9_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l532_c30_bdd9_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l532_c30_bdd9_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l536_c9_bbae]
signal BIN_OP_EQ_uxn_opcodes_h_l536_c9_bbae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l536_c9_bbae_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l536_c9_bbae_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l536_c9_01dd]
signal MUX_uxn_opcodes_h_l536_c9_01dd_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l536_c9_01dd_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l536_c9_01dd_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l536_c9_01dd_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l537_c42_da0c]
signal BIN_OP_MINUS_uxn_opcodes_h_l537_c42_da0c_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l537_c42_da0c_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l537_c42_da0c_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l537_c23_ade1]
signal device_out_uxn_opcodes_h_l537_c23_ade1_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l537_c23_ade1_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l537_c23_ade1_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l537_c23_ade1_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l537_c23_ade1_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l537_c23_ade1_previous_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l537_c23_ade1_return_output : device_out_result_t;

function CONST_REF_RD_opcode_result_t_opcode_result_t_4770( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.is_ram_write := ref_toks_5;
      base.is_vram_write := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_opc_done := ref_toks_8;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_a989( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_device_ram_write := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.u16_value := ref_toks_5;
      base.device_ram_address := ref_toks_6;
      base.vram_write_layer := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l514_c6_52de
BIN_OP_EQ_uxn_opcodes_h_l514_c6_52de : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l514_c6_52de_left,
BIN_OP_EQ_uxn_opcodes_h_l514_c6_52de_right,
BIN_OP_EQ_uxn_opcodes_h_l514_c6_52de_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_68f4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_68f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_68f4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_68f4_return_output);

-- t8_MUX_uxn_opcodes_h_l514_c2_c89d
t8_MUX_uxn_opcodes_h_l514_c2_c89d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l514_c2_c89d_cond,
t8_MUX_uxn_opcodes_h_l514_c2_c89d_iftrue,
t8_MUX_uxn_opcodes_h_l514_c2_c89d_iffalse,
t8_MUX_uxn_opcodes_h_l514_c2_c89d_return_output);

-- n8_MUX_uxn_opcodes_h_l514_c2_c89d
n8_MUX_uxn_opcodes_h_l514_c2_c89d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l514_c2_c89d_cond,
n8_MUX_uxn_opcodes_h_l514_c2_c89d_iftrue,
n8_MUX_uxn_opcodes_h_l514_c2_c89d_iffalse,
n8_MUX_uxn_opcodes_h_l514_c2_c89d_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l514_c2_c89d
device_out_result_MUX_uxn_opcodes_h_l514_c2_c89d : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l514_c2_c89d_cond,
device_out_result_MUX_uxn_opcodes_h_l514_c2_c89d_iftrue,
device_out_result_MUX_uxn_opcodes_h_l514_c2_c89d_iffalse,
device_out_result_MUX_uxn_opcodes_h_l514_c2_c89d_return_output);

-- result_MUX_uxn_opcodes_h_l514_c2_c89d
result_MUX_uxn_opcodes_h_l514_c2_c89d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l514_c2_c89d_cond,
result_MUX_uxn_opcodes_h_l514_c2_c89d_iftrue,
result_MUX_uxn_opcodes_h_l514_c2_c89d_iffalse,
result_MUX_uxn_opcodes_h_l514_c2_c89d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l527_c11_fe5b
BIN_OP_EQ_uxn_opcodes_h_l527_c11_fe5b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l527_c11_fe5b_left,
BIN_OP_EQ_uxn_opcodes_h_l527_c11_fe5b_right,
BIN_OP_EQ_uxn_opcodes_h_l527_c11_fe5b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_c48e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_c48e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_c48e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_c48e_return_output);

-- t8_MUX_uxn_opcodes_h_l527_c7_68f4
t8_MUX_uxn_opcodes_h_l527_c7_68f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l527_c7_68f4_cond,
t8_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue,
t8_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse,
t8_MUX_uxn_opcodes_h_l527_c7_68f4_return_output);

-- n8_MUX_uxn_opcodes_h_l527_c7_68f4
n8_MUX_uxn_opcodes_h_l527_c7_68f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l527_c7_68f4_cond,
n8_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue,
n8_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse,
n8_MUX_uxn_opcodes_h_l527_c7_68f4_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l527_c7_68f4
device_out_result_MUX_uxn_opcodes_h_l527_c7_68f4 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l527_c7_68f4_cond,
device_out_result_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue,
device_out_result_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse,
device_out_result_MUX_uxn_opcodes_h_l527_c7_68f4_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_68f4
result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_68f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_68f4_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_68f4_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_68f4
result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_68f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_68f4_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_68f4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l527_c7_68f4
result_u8_value_MUX_uxn_opcodes_h_l527_c7_68f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l527_c7_68f4_cond,
result_u8_value_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l527_c7_68f4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_68f4
result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_68f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_68f4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_68f4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l527_c7_68f4
result_u16_value_MUX_uxn_opcodes_h_l527_c7_68f4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l527_c7_68f4_cond,
result_u16_value_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l527_c7_68f4_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_68f4
result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_68f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_68f4_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_68f4_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_68f4
result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_68f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_68f4_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_68f4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_68f4
result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_68f4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_68f4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_68f4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_68f4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_68f4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_68f4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_68f4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l530_c11_551f
BIN_OP_EQ_uxn_opcodes_h_l530_c11_551f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l530_c11_551f_left,
BIN_OP_EQ_uxn_opcodes_h_l530_c11_551f_right,
BIN_OP_EQ_uxn_opcodes_h_l530_c11_551f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_402b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_402b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_402b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_402b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_402b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_402b_return_output);

-- t8_MUX_uxn_opcodes_h_l530_c7_c48e
t8_MUX_uxn_opcodes_h_l530_c7_c48e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l530_c7_c48e_cond,
t8_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue,
t8_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse,
t8_MUX_uxn_opcodes_h_l530_c7_c48e_return_output);

-- n8_MUX_uxn_opcodes_h_l530_c7_c48e
n8_MUX_uxn_opcodes_h_l530_c7_c48e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l530_c7_c48e_cond,
n8_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue,
n8_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse,
n8_MUX_uxn_opcodes_h_l530_c7_c48e_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l530_c7_c48e
device_out_result_MUX_uxn_opcodes_h_l530_c7_c48e : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l530_c7_c48e_cond,
device_out_result_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue,
device_out_result_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse,
device_out_result_MUX_uxn_opcodes_h_l530_c7_c48e_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_c48e
result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_c48e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_c48e_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_c48e_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_c48e
result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_c48e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_c48e_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_c48e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l530_c7_c48e
result_u8_value_MUX_uxn_opcodes_h_l530_c7_c48e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l530_c7_c48e_cond,
result_u8_value_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l530_c7_c48e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_c48e
result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_c48e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_c48e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_c48e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l530_c7_c48e
result_u16_value_MUX_uxn_opcodes_h_l530_c7_c48e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l530_c7_c48e_cond,
result_u16_value_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l530_c7_c48e_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_c48e
result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_c48e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_c48e_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_c48e_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_c48e
result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_c48e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_c48e_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_c48e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_c48e
result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_c48e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_c48e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_c48e_return_output);

-- sp_relative_shift_uxn_opcodes_h_l532_c30_bdd9
sp_relative_shift_uxn_opcodes_h_l532_c30_bdd9 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l532_c30_bdd9_ins,
sp_relative_shift_uxn_opcodes_h_l532_c30_bdd9_x,
sp_relative_shift_uxn_opcodes_h_l532_c30_bdd9_y,
sp_relative_shift_uxn_opcodes_h_l532_c30_bdd9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l536_c9_bbae
BIN_OP_EQ_uxn_opcodes_h_l536_c9_bbae : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l536_c9_bbae_left,
BIN_OP_EQ_uxn_opcodes_h_l536_c9_bbae_right,
BIN_OP_EQ_uxn_opcodes_h_l536_c9_bbae_return_output);

-- MUX_uxn_opcodes_h_l536_c9_01dd
MUX_uxn_opcodes_h_l536_c9_01dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l536_c9_01dd_cond,
MUX_uxn_opcodes_h_l536_c9_01dd_iftrue,
MUX_uxn_opcodes_h_l536_c9_01dd_iffalse,
MUX_uxn_opcodes_h_l536_c9_01dd_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l537_c42_da0c
BIN_OP_MINUS_uxn_opcodes_h_l537_c42_da0c : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l537_c42_da0c_left,
BIN_OP_MINUS_uxn_opcodes_h_l537_c42_da0c_right,
BIN_OP_MINUS_uxn_opcodes_h_l537_c42_da0c_return_output);

-- device_out_uxn_opcodes_h_l537_c23_ade1
device_out_uxn_opcodes_h_l537_c23_ade1 : entity work.device_out_0CLK_1666823b port map (
clk,
device_out_uxn_opcodes_h_l537_c23_ade1_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l537_c23_ade1_device_address,
device_out_uxn_opcodes_h_l537_c23_ade1_value,
device_out_uxn_opcodes_h_l537_c23_ade1_phase,
device_out_uxn_opcodes_h_l537_c23_ade1_previous_device_ram_read,
device_out_uxn_opcodes_h_l537_c23_ade1_previous_ram_read,
device_out_uxn_opcodes_h_l537_c23_ade1_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_device_ram_read,
 previous_ram_read,
 -- Registers
 t8,
 n8,
 result,
 device_out_result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l514_c6_52de_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_68f4_return_output,
 t8_MUX_uxn_opcodes_h_l514_c2_c89d_return_output,
 n8_MUX_uxn_opcodes_h_l514_c2_c89d_return_output,
 device_out_result_MUX_uxn_opcodes_h_l514_c2_c89d_return_output,
 result_MUX_uxn_opcodes_h_l514_c2_c89d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l527_c11_fe5b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_c48e_return_output,
 t8_MUX_uxn_opcodes_h_l527_c7_68f4_return_output,
 n8_MUX_uxn_opcodes_h_l527_c7_68f4_return_output,
 device_out_result_MUX_uxn_opcodes_h_l527_c7_68f4_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_68f4_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_68f4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l527_c7_68f4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_68f4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l527_c7_68f4_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_68f4_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_68f4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_68f4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_68f4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l530_c11_551f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_402b_return_output,
 t8_MUX_uxn_opcodes_h_l530_c7_c48e_return_output,
 n8_MUX_uxn_opcodes_h_l530_c7_c48e_return_output,
 device_out_result_MUX_uxn_opcodes_h_l530_c7_c48e_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_c48e_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_c48e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l530_c7_c48e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_c48e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l530_c7_c48e_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_c48e_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_c48e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_c48e_return_output,
 sp_relative_shift_uxn_opcodes_h_l532_c30_bdd9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l536_c9_bbae_return_output,
 MUX_uxn_opcodes_h_l536_c9_01dd_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l537_c42_da0c_return_output,
 device_out_uxn_opcodes_h_l537_c23_ade1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c6_52de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c6_52de_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c6_52de_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_68f4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_68f4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l514_c2_c89d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l514_c2_c89d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l527_c7_68f4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l514_c2_c89d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l514_c2_c89d_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l514_c2_c89d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l514_c2_c89d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l527_c7_68f4_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l514_c2_c89d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l514_c2_c89d_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l514_c2_c89d_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l514_c2_c89d_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_68f4_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l514_c2_c89d_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l514_c2_c89d_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l514_c2_c89d_iftrue : opcode_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l514_c2_c89d_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l514_c2_c89d_iffalse : opcode_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_a989_uxn_opcodes_h_l514_c2_c89d_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l514_c2_c89d_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l514_c2_c89d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l519_c3_9a6b : signed(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l524_c3_0158 : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_fe5b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_fe5b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_fe5b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_c48e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_c48e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l530_c7_c48e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l527_c7_68f4_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l530_c7_c48e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l527_c7_68f4_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_c48e_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_68f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_c48e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_68f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_68f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_c48e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_68f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_68f4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_c48e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_68f4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_68f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_c48e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_68f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_68f4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l530_c7_c48e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l527_c7_68f4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l527_c7_68f4_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_c48e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_68f4_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_68f4_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_c48e_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_68f4_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_68f4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_TRUE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l527_c7_68f4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_c48e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_68f4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_68f4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l528_c3_ceca : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l527_c7_68f4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_68f4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_68f4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_551f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_551f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_551f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_402b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_402b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_402b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_402b_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l530_c7_c48e_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l530_c7_c48e_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_c48e_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_c48e_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_c48e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_c48e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_c48e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l530_c7_c48e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_c48e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_c48e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l535_c3_f1ff : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_c48e_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l532_c30_bdd9_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l532_c30_bdd9_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l532_c30_bdd9_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l532_c30_bdd9_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l536_c9_01dd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l536_c9_bbae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l536_c9_bbae_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l536_c9_bbae_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l536_c9_01dd_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l536_c9_01dd_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l536_c9_01dd_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l537_c23_ade1_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l537_c23_ade1_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l537_c23_ade1_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l537_c23_ade1_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l537_c23_ade1_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l537_c42_da0c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l537_c42_da0c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l537_c42_da0c_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l537_c23_ade1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l537_c23_ade1_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l538_c32_a977_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l539_c31_77d0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l540_c21_5f6f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l541_c22_9506_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l542_c26_dc81_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l543_c29_cc7e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l544_c24_2df4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_c1be_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_9ab0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_833a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_8fbc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_2540_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_e3bb_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_a958_return_output : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
variable REG_VAR_device_out_result : device_out_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
  REG_VAR_device_out_result := device_out_result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l524_c3_0158 := resize(to_unsigned(1, 1), 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l532_c30_bdd9_y := resize(to_signed(-2, 3), 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l536_c9_bbae_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_551f_right := to_unsigned(2, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l528_c3_ceca := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l528_c3_ceca;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l535_c3_f1ff := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse := VAR_result_sp_relative_shift_uxn_opcodes_h_l535_c3_f1ff;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c6_52de_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l519_c3_9a6b := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_402b_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l532_c30_bdd9_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_fe5b_right := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l537_c42_da0c_right := to_unsigned(3, 2);

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
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse := VAR_CLOCK_ENABLE;
     VAR_device_out_result_MUX_uxn_opcodes_h_l514_c2_c89d_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue := device_out_result;
     VAR_sp_relative_shift_uxn_opcodes_h_l532_c30_bdd9_ins := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l536_c9_01dd_iffalse := n8;
     VAR_n8_MUX_uxn_opcodes_h_l514_c2_c89d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c6_52de_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_fe5b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_551f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l536_c9_bbae_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l537_c42_da0c_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l537_c23_ade1_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_device_out_uxn_opcodes_h_l537_c23_ade1_previous_ram_read := VAR_previous_ram_read;
     VAR_MUX_uxn_opcodes_h_l536_c9_01dd_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue := VAR_previous_stack_read;
     VAR_device_out_uxn_opcodes_h_l537_c23_ade1_device_address := t8;
     VAR_t8_MUX_uxn_opcodes_h_l514_c2_c89d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse := t8;
     -- BIN_OP_MINUS[uxn_opcodes_h_l537_c42_da0c] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l537_c42_da0c_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l537_c42_da0c_left;
     BIN_OP_MINUS_uxn_opcodes_h_l537_c42_da0c_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l537_c42_da0c_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l537_c42_da0c_return_output := BIN_OP_MINUS_uxn_opcodes_h_l537_c42_da0c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_8fbc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_8fbc_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_9ab0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_9ab0_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l530_c11_551f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l530_c11_551f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_551f_left;
     BIN_OP_EQ_uxn_opcodes_h_l530_c11_551f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_551f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_551f_return_output := BIN_OP_EQ_uxn_opcodes_h_l530_c11_551f_return_output;

     -- result_sp_relative_shift_TRUE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l527_c7_68f4] LATENCY=0
     VAR_result_sp_relative_shift_TRUE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l527_c7_68f4_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l514_c6_52de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l514_c6_52de_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c6_52de_left;
     BIN_OP_EQ_uxn_opcodes_h_l514_c6_52de_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c6_52de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c6_52de_return_output := BIN_OP_EQ_uxn_opcodes_h_l514_c6_52de_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l527_c7_68f4] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l527_c7_68f4_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_2540 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_2540_return_output := result.u16_value;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770[uxn_opcodes_h_l514_c2_c89d] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l514_c2_c89d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4770(
     result,
     to_unsigned(0, 1),
     VAR_result_sp_relative_shift_uxn_opcodes_h_l519_c3_9a6b,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l524_c3_0158,
     to_unsigned(0, 1));

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_e3bb LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_e3bb_return_output := result.device_ram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_c1be LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_c1be_return_output := result.is_device_ram_write;

     -- sp_relative_shift[uxn_opcodes_h_l532_c30_bdd9] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l532_c30_bdd9_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l532_c30_bdd9_ins;
     sp_relative_shift_uxn_opcodes_h_l532_c30_bdd9_x <= VAR_sp_relative_shift_uxn_opcodes_h_l532_c30_bdd9_x;
     sp_relative_shift_uxn_opcodes_h_l532_c30_bdd9_y <= VAR_sp_relative_shift_uxn_opcodes_h_l532_c30_bdd9_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l532_c30_bdd9_return_output := sp_relative_shift_uxn_opcodes_h_l532_c30_bdd9_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_833a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_833a_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l527_c11_fe5b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l527_c11_fe5b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_fe5b_left;
     BIN_OP_EQ_uxn_opcodes_h_l527_c11_fe5b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_fe5b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_fe5b_return_output := BIN_OP_EQ_uxn_opcodes_h_l527_c11_fe5b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l536_c9_bbae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l536_c9_bbae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l536_c9_bbae_left;
     BIN_OP_EQ_uxn_opcodes_h_l536_c9_bbae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l536_c9_bbae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l536_c9_bbae_return_output := BIN_OP_EQ_uxn_opcodes_h_l536_c9_bbae_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_a958 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_a958_return_output := result.vram_write_layer;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_68f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c6_52de_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l514_c2_c89d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c6_52de_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l514_c2_c89d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c6_52de_return_output;
     VAR_result_MUX_uxn_opcodes_h_l514_c2_c89d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c6_52de_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l514_c2_c89d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c6_52de_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_c48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_fe5b_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_68f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_fe5b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l527_c7_68f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_fe5b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_68f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_fe5b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_68f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_fe5b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_68f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_fe5b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_68f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_fe5b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_68f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_fe5b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_68f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_fe5b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l527_c7_68f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_fe5b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_68f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_fe5b_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_68f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_fe5b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l527_c7_68f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_fe5b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_402b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_551f_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_c48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_551f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l530_c7_c48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_551f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_c48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_551f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_c48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_551f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_c48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_551f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_c48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_551f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_c48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_551f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l530_c7_c48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_551f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_c48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_551f_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_c48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_551f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l530_c7_c48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_551f_return_output;
     VAR_MUX_uxn_opcodes_h_l536_c9_01dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l536_c9_bbae_return_output;
     VAR_device_out_uxn_opcodes_h_l537_c23_ade1_phase := VAR_BIN_OP_MINUS_uxn_opcodes_h_l537_c42_da0c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_2540_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_2540_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_c1be_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_c1be_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_8fbc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_8fbc_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_9ab0_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_9ab0_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_a958_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_a958_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_e3bb_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_e3bb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_833a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_833a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l514_c2_c89d_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l514_c2_c89d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue := VAR_result_sp_relative_shift_TRUE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l527_c7_68f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l527_c7_68f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l532_c30_bdd9_return_output;
     -- MUX[uxn_opcodes_h_l536_c9_01dd] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l536_c9_01dd_cond <= VAR_MUX_uxn_opcodes_h_l536_c9_01dd_cond;
     MUX_uxn_opcodes_h_l536_c9_01dd_iftrue <= VAR_MUX_uxn_opcodes_h_l536_c9_01dd_iftrue;
     MUX_uxn_opcodes_h_l536_c9_01dd_iffalse <= VAR_MUX_uxn_opcodes_h_l536_c9_01dd_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l536_c9_01dd_return_output := MUX_uxn_opcodes_h_l536_c9_01dd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l530_c7_c48e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_c48e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_c48e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_c48e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_c48e_return_output;

     -- t8_MUX[uxn_opcodes_h_l530_c7_c48e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l530_c7_c48e_cond <= VAR_t8_MUX_uxn_opcodes_h_l530_c7_c48e_cond;
     t8_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue;
     t8_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l530_c7_c48e_return_output := t8_MUX_uxn_opcodes_h_l530_c7_c48e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l527_c7_68f4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_68f4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_68f4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_68f4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_68f4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l527_c7_68f4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_68f4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_68f4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_68f4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_68f4_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_68f4_return_output;
     VAR_device_out_uxn_opcodes_h_l537_c23_ade1_value := VAR_MUX_uxn_opcodes_h_l536_c9_01dd_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse := VAR_MUX_uxn_opcodes_h_l536_c9_01dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_c48e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse := VAR_t8_MUX_uxn_opcodes_h_l530_c7_c48e_return_output;
     -- n8_MUX[uxn_opcodes_h_l530_c7_c48e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l530_c7_c48e_cond <= VAR_n8_MUX_uxn_opcodes_h_l530_c7_c48e_cond;
     n8_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue;
     n8_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l530_c7_c48e_return_output := n8_MUX_uxn_opcodes_h_l530_c7_c48e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l530_c7_c48e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_c48e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_c48e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_c48e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_c48e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l527_c7_68f4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_68f4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_68f4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_68f4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_68f4_return_output;

     -- t8_MUX[uxn_opcodes_h_l527_c7_68f4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l527_c7_68f4_cond <= VAR_t8_MUX_uxn_opcodes_h_l527_c7_68f4_cond;
     t8_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue;
     t8_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l527_c7_68f4_return_output := t8_MUX_uxn_opcodes_h_l527_c7_68f4_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_402b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_c48e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse := VAR_n8_MUX_uxn_opcodes_h_l530_c7_c48e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l514_c2_c89d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l527_c7_68f4_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l534_c1_402b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_402b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_402b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_402b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_402b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_402b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_402b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_402b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_402b_return_output;

     -- n8_MUX[uxn_opcodes_h_l527_c7_68f4] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l527_c7_68f4_cond <= VAR_n8_MUX_uxn_opcodes_h_l527_c7_68f4_cond;
     n8_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue;
     n8_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l527_c7_68f4_return_output := n8_MUX_uxn_opcodes_h_l527_c7_68f4_return_output;

     -- t8_MUX[uxn_opcodes_h_l514_c2_c89d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l514_c2_c89d_cond <= VAR_t8_MUX_uxn_opcodes_h_l514_c2_c89d_cond;
     t8_MUX_uxn_opcodes_h_l514_c2_c89d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l514_c2_c89d_iftrue;
     t8_MUX_uxn_opcodes_h_l514_c2_c89d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l514_c2_c89d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l514_c2_c89d_return_output := t8_MUX_uxn_opcodes_h_l514_c2_c89d_return_output;

     -- Submodule level 4
     VAR_device_out_uxn_opcodes_h_l537_c23_ade1_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_402b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l514_c2_c89d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l527_c7_68f4_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l514_c2_c89d_return_output;
     -- device_out[uxn_opcodes_h_l537_c23_ade1] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l537_c23_ade1_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l537_c23_ade1_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l537_c23_ade1_device_address <= VAR_device_out_uxn_opcodes_h_l537_c23_ade1_device_address;
     device_out_uxn_opcodes_h_l537_c23_ade1_value <= VAR_device_out_uxn_opcodes_h_l537_c23_ade1_value;
     device_out_uxn_opcodes_h_l537_c23_ade1_phase <= VAR_device_out_uxn_opcodes_h_l537_c23_ade1_phase;
     device_out_uxn_opcodes_h_l537_c23_ade1_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l537_c23_ade1_previous_device_ram_read;
     device_out_uxn_opcodes_h_l537_c23_ade1_previous_ram_read <= VAR_device_out_uxn_opcodes_h_l537_c23_ade1_previous_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l537_c23_ade1_return_output := device_out_uxn_opcodes_h_l537_c23_ade1_return_output;

     -- n8_MUX[uxn_opcodes_h_l514_c2_c89d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l514_c2_c89d_cond <= VAR_n8_MUX_uxn_opcodes_h_l514_c2_c89d_cond;
     n8_MUX_uxn_opcodes_h_l514_c2_c89d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l514_c2_c89d_iftrue;
     n8_MUX_uxn_opcodes_h_l514_c2_c89d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l514_c2_c89d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l514_c2_c89d_return_output := n8_MUX_uxn_opcodes_h_l514_c2_c89d_return_output;

     -- Submodule level 5
     VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse := VAR_device_out_uxn_opcodes_h_l537_c23_ade1_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l514_c2_c89d_return_output;
     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d[uxn_opcodes_h_l544_c24_2df4] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l544_c24_2df4_return_output := VAR_device_out_uxn_opcodes_h_l537_c23_ade1_return_output.is_deo_done;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l542_c26_dc81] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l542_c26_dc81_return_output := VAR_device_out_uxn_opcodes_h_l537_c23_ade1_return_output.is_vram_write;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l539_c31_77d0] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l539_c31_77d0_return_output := VAR_device_out_uxn_opcodes_h_l537_c23_ade1_return_output.device_ram_address;

     -- device_out_result_MUX[uxn_opcodes_h_l530_c7_c48e] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l530_c7_c48e_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_c48e_cond;
     device_out_result_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_c48e_return_output := device_out_result_MUX_uxn_opcodes_h_l530_c7_c48e_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l538_c32_a977] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l538_c32_a977_return_output := VAR_device_out_uxn_opcodes_h_l537_c23_ade1_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d[uxn_opcodes_h_l541_c22_9506] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l541_c22_9506_return_output := VAR_device_out_uxn_opcodes_h_l537_c23_ade1_return_output.u16_addr;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_opcodes_h_l543_c29_cc7e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l543_c29_cc7e_return_output := VAR_device_out_uxn_opcodes_h_l537_c23_ade1_return_output.vram_write_layer;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_opcodes_h_l540_c21_5f6f] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l540_c21_5f6f_return_output := VAR_device_out_uxn_opcodes_h_l537_c23_ade1_return_output.u8_value;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l541_c22_9506_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l544_c24_2df4_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l538_c32_a977_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l542_c26_dc81_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l543_c29_cc7e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l539_c31_77d0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l540_c21_5f6f_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_c48e_return_output;
     -- device_out_result_MUX[uxn_opcodes_h_l527_c7_68f4] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l527_c7_68f4_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_68f4_cond;
     device_out_result_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_68f4_return_output := device_out_result_MUX_uxn_opcodes_h_l527_c7_68f4_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l530_c7_c48e] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_c48e_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_c48e_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_c48e_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_c48e_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l530_c7_c48e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_c48e_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_c48e_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_c48e_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_c48e_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l530_c7_c48e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_c48e_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_c48e_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_c48e_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_c48e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l530_c7_c48e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_c48e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_c48e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_c48e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_c48e_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l530_c7_c48e] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_c48e_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_c48e_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_c48e_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_c48e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l530_c7_c48e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l530_c7_c48e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_c48e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_c48e_return_output := result_u8_value_MUX_uxn_opcodes_h_l530_c7_c48e_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l530_c7_c48e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l530_c7_c48e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l530_c7_c48e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l530_c7_c48e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l530_c7_c48e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l530_c7_c48e_return_output := result_u16_value_MUX_uxn_opcodes_h_l530_c7_c48e_return_output;

     -- Submodule level 7
     VAR_device_out_result_MUX_uxn_opcodes_h_l514_c2_c89d_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_68f4_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_c48e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_c48e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_c48e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_c48e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l530_c7_c48e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_c48e_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_c48e_return_output;
     -- device_out_result_MUX[uxn_opcodes_h_l514_c2_c89d] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l514_c2_c89d_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l514_c2_c89d_cond;
     device_out_result_MUX_uxn_opcodes_h_l514_c2_c89d_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l514_c2_c89d_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l514_c2_c89d_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l514_c2_c89d_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l514_c2_c89d_return_output := device_out_result_MUX_uxn_opcodes_h_l514_c2_c89d_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l527_c7_68f4] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_68f4_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_68f4_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_68f4_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_68f4_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l527_c7_68f4] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_68f4_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_68f4_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_68f4_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_68f4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l527_c7_68f4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l527_c7_68f4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l527_c7_68f4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l527_c7_68f4_return_output := result_u16_value_MUX_uxn_opcodes_h_l527_c7_68f4_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l527_c7_68f4] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_68f4_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_68f4_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_68f4_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_68f4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l527_c7_68f4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_68f4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_68f4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_68f4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_68f4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l527_c7_68f4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l527_c7_68f4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_68f4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_68f4_return_output := result_u8_value_MUX_uxn_opcodes_h_l527_c7_68f4_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l527_c7_68f4] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_68f4_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_68f4_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_68f4_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_68f4_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_68f4_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_68f4_return_output;

     -- Submodule level 8
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l514_c2_c89d_return_output;
     -- result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_a989[uxn_opcodes_h_l514_c2_c89d] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_a989_uxn_opcodes_h_l514_c2_c89d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a989(
     result,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_68f4_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_68f4_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_68f4_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_68f4_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l527_c7_68f4_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_68f4_return_output,
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_68f4_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_68f4_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_68f4_return_output);

     -- Submodule level 9
     VAR_result_MUX_uxn_opcodes_h_l514_c2_c89d_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_a989_uxn_opcodes_h_l514_c2_c89d_return_output;
     -- result_MUX[uxn_opcodes_h_l514_c2_c89d] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l514_c2_c89d_cond <= VAR_result_MUX_uxn_opcodes_h_l514_c2_c89d_cond;
     result_MUX_uxn_opcodes_h_l514_c2_c89d_iftrue <= VAR_result_MUX_uxn_opcodes_h_l514_c2_c89d_iftrue;
     result_MUX_uxn_opcodes_h_l514_c2_c89d_iffalse <= VAR_result_MUX_uxn_opcodes_h_l514_c2_c89d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l514_c2_c89d_return_output := result_MUX_uxn_opcodes_h_l514_c2_c89d_return_output;

     -- Submodule level 10
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l514_c2_c89d_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l514_c2_c89d_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
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
     result <= REG_COMB_result;
     device_out_result <= REG_COMB_device_out_result;
 end if;
 end if;
end process;

end arch;
