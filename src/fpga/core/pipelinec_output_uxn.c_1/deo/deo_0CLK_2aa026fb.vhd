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
entity deo_0CLK_2aa026fb is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo_0CLK_2aa026fb;
architecture arch of deo_0CLK_2aa026fb is
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
-- BIN_OP_EQ[uxn_opcodes_h_l519_c6_b583]
signal BIN_OP_EQ_uxn_opcodes_h_l519_c6_b583_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l519_c6_b583_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l519_c6_b583_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l532_c7_d9bb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_d9bb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l519_c2_206a]
signal n8_MUX_uxn_opcodes_h_l519_c2_206a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l519_c2_206a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l519_c2_206a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l519_c2_206a_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l519_c2_206a]
signal device_out_result_MUX_uxn_opcodes_h_l519_c2_206a_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l519_c2_206a_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l519_c2_206a_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l519_c2_206a_return_output : device_out_result_t;

-- t8_MUX[uxn_opcodes_h_l519_c2_206a]
signal t8_MUX_uxn_opcodes_h_l519_c2_206a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l519_c2_206a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l519_c2_206a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l519_c2_206a_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_h_l519_c2_206a]
signal result_MUX_uxn_opcodes_h_l519_c2_206a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l519_c2_206a_iftrue : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l519_c2_206a_iffalse : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l519_c2_206a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l532_c11_b8a5]
signal BIN_OP_EQ_uxn_opcodes_h_l532_c11_b8a5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l532_c11_b8a5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l532_c11_b8a5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l535_c7_1af4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1af4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1af4_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l532_c7_d9bb]
signal n8_MUX_uxn_opcodes_h_l532_c7_d9bb_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l532_c7_d9bb]
signal device_out_result_MUX_uxn_opcodes_h_l532_c7_d9bb_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output : device_out_result_t;

-- t8_MUX[uxn_opcodes_h_l532_c7_d9bb]
signal t8_MUX_uxn_opcodes_h_l532_c7_d9bb_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l532_c7_d9bb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_d9bb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l532_c7_d9bb]
signal result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_d9bb_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l532_c7_d9bb]
signal result_u8_value_MUX_uxn_opcodes_h_l532_c7_d9bb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l532_c7_d9bb]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_d9bb_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l532_c7_d9bb]
signal result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_d9bb_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l532_c7_d9bb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_d9bb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l532_c7_d9bb]
signal result_u16_value_MUX_uxn_opcodes_h_l532_c7_d9bb_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l532_c7_d9bb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_d9bb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l532_c7_d9bb]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_d9bb_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l535_c11_2775]
signal BIN_OP_EQ_uxn_opcodes_h_l535_c11_2775_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l535_c11_2775_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l535_c11_2775_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l539_c1_c630]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_c630_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_c630_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_c630_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_c630_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l535_c7_1af4]
signal n8_MUX_uxn_opcodes_h_l535_c7_1af4_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l535_c7_1af4_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l535_c7_1af4]
signal device_out_result_MUX_uxn_opcodes_h_l535_c7_1af4_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l535_c7_1af4_return_output : device_out_result_t;

-- t8_MUX[uxn_opcodes_h_l535_c7_1af4]
signal t8_MUX_uxn_opcodes_h_l535_c7_1af4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l535_c7_1af4_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l535_c7_1af4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1af4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1af4_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l535_c7_1af4]
signal result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1af4_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1af4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l535_c7_1af4]
signal result_u8_value_MUX_uxn_opcodes_h_l535_c7_1af4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l535_c7_1af4_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l535_c7_1af4]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1af4_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1af4_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l535_c7_1af4]
signal result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1af4_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1af4_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l535_c7_1af4]
signal result_u16_value_MUX_uxn_opcodes_h_l535_c7_1af4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l535_c7_1af4_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l535_c7_1af4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1af4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1af4_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l535_c7_1af4]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1af4_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1af4_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l537_c30_d34a]
signal sp_relative_shift_uxn_opcodes_h_l537_c30_d34a_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l537_c30_d34a_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l537_c30_d34a_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l537_c30_d34a_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l541_c9_c3d5]
signal BIN_OP_EQ_uxn_opcodes_h_l541_c9_c3d5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l541_c9_c3d5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l541_c9_c3d5_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l541_c9_b483]
signal MUX_uxn_opcodes_h_l541_c9_b483_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l541_c9_b483_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l541_c9_b483_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l541_c9_b483_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l542_c42_a33a]
signal BIN_OP_MINUS_uxn_opcodes_h_l542_c42_a33a_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l542_c42_a33a_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l542_c42_a33a_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l542_c23_3c13]
signal device_out_uxn_opcodes_h_l542_c23_3c13_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l542_c23_3c13_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l542_c23_3c13_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l542_c23_3c13_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l542_c23_3c13_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l542_c23_3c13_previous_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l542_c23_3c13_return_output : device_out_result_t;

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_6fac( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.vram_write_layer := ref_toks_4;
      base.device_ram_address := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.u16_value := ref_toks_7;
      base.is_opc_done := ref_toks_8;
      base.is_device_ram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l519_c6_b583
BIN_OP_EQ_uxn_opcodes_h_l519_c6_b583 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l519_c6_b583_left,
BIN_OP_EQ_uxn_opcodes_h_l519_c6_b583_right,
BIN_OP_EQ_uxn_opcodes_h_l519_c6_b583_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_d9bb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_d9bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_d9bb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output);

-- n8_MUX_uxn_opcodes_h_l519_c2_206a
n8_MUX_uxn_opcodes_h_l519_c2_206a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l519_c2_206a_cond,
n8_MUX_uxn_opcodes_h_l519_c2_206a_iftrue,
n8_MUX_uxn_opcodes_h_l519_c2_206a_iffalse,
n8_MUX_uxn_opcodes_h_l519_c2_206a_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l519_c2_206a
device_out_result_MUX_uxn_opcodes_h_l519_c2_206a : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l519_c2_206a_cond,
device_out_result_MUX_uxn_opcodes_h_l519_c2_206a_iftrue,
device_out_result_MUX_uxn_opcodes_h_l519_c2_206a_iffalse,
device_out_result_MUX_uxn_opcodes_h_l519_c2_206a_return_output);

-- t8_MUX_uxn_opcodes_h_l519_c2_206a
t8_MUX_uxn_opcodes_h_l519_c2_206a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l519_c2_206a_cond,
t8_MUX_uxn_opcodes_h_l519_c2_206a_iftrue,
t8_MUX_uxn_opcodes_h_l519_c2_206a_iffalse,
t8_MUX_uxn_opcodes_h_l519_c2_206a_return_output);

-- result_MUX_uxn_opcodes_h_l519_c2_206a
result_MUX_uxn_opcodes_h_l519_c2_206a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l519_c2_206a_cond,
result_MUX_uxn_opcodes_h_l519_c2_206a_iftrue,
result_MUX_uxn_opcodes_h_l519_c2_206a_iffalse,
result_MUX_uxn_opcodes_h_l519_c2_206a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l532_c11_b8a5
BIN_OP_EQ_uxn_opcodes_h_l532_c11_b8a5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l532_c11_b8a5_left,
BIN_OP_EQ_uxn_opcodes_h_l532_c11_b8a5_right,
BIN_OP_EQ_uxn_opcodes_h_l532_c11_b8a5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1af4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1af4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1af4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1af4_return_output);

-- n8_MUX_uxn_opcodes_h_l532_c7_d9bb
n8_MUX_uxn_opcodes_h_l532_c7_d9bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l532_c7_d9bb_cond,
n8_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue,
n8_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse,
n8_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l532_c7_d9bb
device_out_result_MUX_uxn_opcodes_h_l532_c7_d9bb : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l532_c7_d9bb_cond,
device_out_result_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue,
device_out_result_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse,
device_out_result_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output);

-- t8_MUX_uxn_opcodes_h_l532_c7_d9bb
t8_MUX_uxn_opcodes_h_l532_c7_d9bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l532_c7_d9bb_cond,
t8_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue,
t8_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse,
t8_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_d9bb
result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_d9bb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_d9bb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_d9bb
result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_d9bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_d9bb_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l532_c7_d9bb
result_u8_value_MUX_uxn_opcodes_h_l532_c7_d9bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l532_c7_d9bb_cond,
result_u8_value_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_d9bb
result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_d9bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_d9bb_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_d9bb
result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_d9bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_d9bb_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_d9bb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_d9bb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_d9bb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l532_c7_d9bb
result_u16_value_MUX_uxn_opcodes_h_l532_c7_d9bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l532_c7_d9bb_cond,
result_u16_value_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_d9bb
result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_d9bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_d9bb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_d9bb
result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_d9bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_d9bb_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l535_c11_2775
BIN_OP_EQ_uxn_opcodes_h_l535_c11_2775 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l535_c11_2775_left,
BIN_OP_EQ_uxn_opcodes_h_l535_c11_2775_right,
BIN_OP_EQ_uxn_opcodes_h_l535_c11_2775_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_c630
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_c630 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_c630_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_c630_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_c630_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_c630_return_output);

-- n8_MUX_uxn_opcodes_h_l535_c7_1af4
n8_MUX_uxn_opcodes_h_l535_c7_1af4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l535_c7_1af4_cond,
n8_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue,
n8_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse,
n8_MUX_uxn_opcodes_h_l535_c7_1af4_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l535_c7_1af4
device_out_result_MUX_uxn_opcodes_h_l535_c7_1af4 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l535_c7_1af4_cond,
device_out_result_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue,
device_out_result_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse,
device_out_result_MUX_uxn_opcodes_h_l535_c7_1af4_return_output);

-- t8_MUX_uxn_opcodes_h_l535_c7_1af4
t8_MUX_uxn_opcodes_h_l535_c7_1af4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l535_c7_1af4_cond,
t8_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue,
t8_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse,
t8_MUX_uxn_opcodes_h_l535_c7_1af4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1af4
result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1af4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1af4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1af4_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1af4
result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1af4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1af4_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1af4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l535_c7_1af4
result_u8_value_MUX_uxn_opcodes_h_l535_c7_1af4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l535_c7_1af4_cond,
result_u8_value_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l535_c7_1af4_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1af4
result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1af4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1af4_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1af4_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1af4
result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1af4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1af4_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1af4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l535_c7_1af4
result_u16_value_MUX_uxn_opcodes_h_l535_c7_1af4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l535_c7_1af4_cond,
result_u16_value_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l535_c7_1af4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1af4
result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1af4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1af4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1af4_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1af4
result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1af4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1af4_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1af4_return_output);

-- sp_relative_shift_uxn_opcodes_h_l537_c30_d34a
sp_relative_shift_uxn_opcodes_h_l537_c30_d34a : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l537_c30_d34a_ins,
sp_relative_shift_uxn_opcodes_h_l537_c30_d34a_x,
sp_relative_shift_uxn_opcodes_h_l537_c30_d34a_y,
sp_relative_shift_uxn_opcodes_h_l537_c30_d34a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l541_c9_c3d5
BIN_OP_EQ_uxn_opcodes_h_l541_c9_c3d5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l541_c9_c3d5_left,
BIN_OP_EQ_uxn_opcodes_h_l541_c9_c3d5_right,
BIN_OP_EQ_uxn_opcodes_h_l541_c9_c3d5_return_output);

-- MUX_uxn_opcodes_h_l541_c9_b483
MUX_uxn_opcodes_h_l541_c9_b483 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l541_c9_b483_cond,
MUX_uxn_opcodes_h_l541_c9_b483_iftrue,
MUX_uxn_opcodes_h_l541_c9_b483_iffalse,
MUX_uxn_opcodes_h_l541_c9_b483_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l542_c42_a33a
BIN_OP_MINUS_uxn_opcodes_h_l542_c42_a33a : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l542_c42_a33a_left,
BIN_OP_MINUS_uxn_opcodes_h_l542_c42_a33a_right,
BIN_OP_MINUS_uxn_opcodes_h_l542_c42_a33a_return_output);

-- device_out_uxn_opcodes_h_l542_c23_3c13
device_out_uxn_opcodes_h_l542_c23_3c13 : entity work.device_out_0CLK_ae30f4b0 port map (
clk,
device_out_uxn_opcodes_h_l542_c23_3c13_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l542_c23_3c13_device_address,
device_out_uxn_opcodes_h_l542_c23_3c13_value,
device_out_uxn_opcodes_h_l542_c23_3c13_phase,
device_out_uxn_opcodes_h_l542_c23_3c13_previous_device_ram_read,
device_out_uxn_opcodes_h_l542_c23_3c13_previous_ram_read,
device_out_uxn_opcodes_h_l542_c23_3c13_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l519_c6_b583_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output,
 n8_MUX_uxn_opcodes_h_l519_c2_206a_return_output,
 device_out_result_MUX_uxn_opcodes_h_l519_c2_206a_return_output,
 t8_MUX_uxn_opcodes_h_l519_c2_206a_return_output,
 result_MUX_uxn_opcodes_h_l519_c2_206a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l532_c11_b8a5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1af4_return_output,
 n8_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output,
 device_out_result_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output,
 t8_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l535_c11_2775_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_c630_return_output,
 n8_MUX_uxn_opcodes_h_l535_c7_1af4_return_output,
 device_out_result_MUX_uxn_opcodes_h_l535_c7_1af4_return_output,
 t8_MUX_uxn_opcodes_h_l535_c7_1af4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1af4_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1af4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l535_c7_1af4_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1af4_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1af4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l535_c7_1af4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1af4_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1af4_return_output,
 sp_relative_shift_uxn_opcodes_h_l537_c30_d34a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l541_c9_c3d5_return_output,
 MUX_uxn_opcodes_h_l541_c9_b483_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l542_c42_a33a_return_output,
 device_out_uxn_opcodes_h_l542_c23_3c13_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c6_b583_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c6_b583_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c6_b583_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_d9bb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l519_c2_206a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l519_c2_206a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l519_c2_206a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l519_c2_206a_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l519_c2_206a_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l519_c2_206a_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l519_c2_206a_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l519_c2_206a_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l519_c2_206a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l519_c2_206a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l519_c2_206a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l519_c2_206a_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l519_c2_206a_iftrue : opcode_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l519_c2_206a_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l519_c2_206a_iffalse : opcode_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_6fac_uxn_opcodes_h_l519_c2_206a_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l519_c2_206a_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l519_c2_206a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l524_c3_c309 : signed(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l529_c3_3cb7 : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_b8a5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_b8a5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_b8a5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1af4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1af4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l535_c7_1af4_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l532_c7_d9bb_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_1af4_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l532_c7_d9bb_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l535_c7_1af4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l532_c7_d9bb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_TRUE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l532_c7_d9bb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1af4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_d9bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1af4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_d9bb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l535_c7_1af4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l532_c7_d9bb_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1af4_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_d9bb_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1af4_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_d9bb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l533_c3_7b50 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l532_c7_d9bb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_d9bb_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l535_c7_1af4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l532_c7_d9bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1af4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_d9bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1af4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_d9bb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_2775_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_2775_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_2775_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_c630_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_c630_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_c630_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_c630_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l535_c7_1af4_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_1af4_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l535_c7_1af4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l540_c3_b713 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1af4_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1af4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l535_c7_1af4_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1af4_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1af4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l535_c7_1af4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1af4_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1af4_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l537_c30_d34a_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l537_c30_d34a_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l537_c30_d34a_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l537_c30_d34a_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l541_c9_b483_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l541_c9_c3d5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l541_c9_c3d5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l541_c9_c3d5_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l541_c9_b483_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l541_c9_b483_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l541_c9_b483_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l542_c23_3c13_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l542_c23_3c13_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l542_c23_3c13_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l542_c23_3c13_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l542_c23_3c13_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l542_c42_a33a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l542_c42_a33a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l542_c42_a33a_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l542_c23_3c13_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l542_c23_3c13_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l543_c32_ba60_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l544_c31_d862_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l545_c21_967e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l546_c22_77fd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l547_c26_3226_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l548_c29_733e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l549_c24_158c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l532_l535_DUPLICATE_8637_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l532_l535_DUPLICATE_7a99_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l532_l535_DUPLICATE_a77d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l532_l535_DUPLICATE_4031_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l532_l535_DUPLICATE_2857_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l532_l535_DUPLICATE_0bbe_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l532_l535_DUPLICATE_697c_return_output : unsigned(0 downto 0);
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
     VAR_result_sp_relative_shift_uxn_opcodes_h_l524_c3_c309 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_2775_right := to_unsigned(2, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l537_c30_d34a_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l533_c3_7b50 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l533_c3_7b50;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l529_c3_3cb7 := resize(to_unsigned(1, 1), 4);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l542_c42_a33a_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c6_b583_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_c630_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_b8a5_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l541_c9_c3d5_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l540_c3_b713 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse := VAR_result_sp_relative_shift_uxn_opcodes_h_l540_c3_b713;
     VAR_sp_relative_shift_uxn_opcodes_h_l537_c30_d34a_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse := VAR_CLOCK_ENABLE;
     VAR_device_out_result_MUX_uxn_opcodes_h_l519_c2_206a_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue := device_out_result;
     VAR_sp_relative_shift_uxn_opcodes_h_l537_c30_d34a_ins := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l541_c9_b483_iffalse := n8;
     VAR_n8_MUX_uxn_opcodes_h_l519_c2_206a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c6_b583_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_b8a5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_2775_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l541_c9_c3d5_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l542_c42_a33a_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l542_c23_3c13_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_device_out_uxn_opcodes_h_l542_c23_3c13_previous_ram_read := VAR_previous_ram_read;
     VAR_MUX_uxn_opcodes_h_l541_c9_b483_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue := VAR_previous_stack_read;
     VAR_device_out_uxn_opcodes_h_l542_c23_3c13_device_address := t8;
     VAR_t8_MUX_uxn_opcodes_h_l519_c2_206a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse := t8;
     -- result_sp_relative_shift_TRUE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l532_c7_d9bb] LATENCY=0
     VAR_result_sp_relative_shift_TRUE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l532_c7_d9bb_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l532_c11_b8a5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l532_c11_b8a5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_b8a5_left;
     BIN_OP_EQ_uxn_opcodes_h_l532_c11_b8a5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_b8a5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_b8a5_return_output := BIN_OP_EQ_uxn_opcodes_h_l532_c11_b8a5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l519_c6_b583] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l519_c6_b583_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c6_b583_left;
     BIN_OP_EQ_uxn_opcodes_h_l519_c6_b583_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c6_b583_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c6_b583_return_output := BIN_OP_EQ_uxn_opcodes_h_l519_c6_b583_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l532_l535_DUPLICATE_4031 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l532_l535_DUPLICATE_4031_return_output := result.device_ram_address;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l532_c7_d9bb] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l532_c7_d9bb_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l532_l535_DUPLICATE_0bbe LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l532_l535_DUPLICATE_0bbe_return_output := result.is_opc_done;

     -- sp_relative_shift[uxn_opcodes_h_l537_c30_d34a] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l537_c30_d34a_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l537_c30_d34a_ins;
     sp_relative_shift_uxn_opcodes_h_l537_c30_d34a_x <= VAR_sp_relative_shift_uxn_opcodes_h_l537_c30_d34a_x;
     sp_relative_shift_uxn_opcodes_h_l537_c30_d34a_y <= VAR_sp_relative_shift_uxn_opcodes_h_l537_c30_d34a_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l537_c30_d34a_return_output := sp_relative_shift_uxn_opcodes_h_l537_c30_d34a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l532_l535_DUPLICATE_8637 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l532_l535_DUPLICATE_8637_return_output := result.is_vram_write;

     -- BIN_OP_MINUS[uxn_opcodes_h_l542_c42_a33a] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l542_c42_a33a_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l542_c42_a33a_left;
     BIN_OP_MINUS_uxn_opcodes_h_l542_c42_a33a_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l542_c42_a33a_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l542_c42_a33a_return_output := BIN_OP_MINUS_uxn_opcodes_h_l542_c42_a33a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l541_c9_c3d5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l541_c9_c3d5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l541_c9_c3d5_left;
     BIN_OP_EQ_uxn_opcodes_h_l541_c9_c3d5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l541_c9_c3d5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l541_c9_c3d5_return_output := BIN_OP_EQ_uxn_opcodes_h_l541_c9_c3d5_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l532_l535_DUPLICATE_2857 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l532_l535_DUPLICATE_2857_return_output := result.u16_value;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770[uxn_opcodes_h_l519_c2_206a] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l519_c2_206a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4770(
     result,
     to_unsigned(0, 1),
     VAR_result_sp_relative_shift_uxn_opcodes_h_l524_c3_c309,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l529_c3_3cb7,
     to_unsigned(0, 1));

     -- BIN_OP_EQ[uxn_opcodes_h_l535_c11_2775] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l535_c11_2775_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_2775_left;
     BIN_OP_EQ_uxn_opcodes_h_l535_c11_2775_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_2775_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_2775_return_output := BIN_OP_EQ_uxn_opcodes_h_l535_c11_2775_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l532_l535_DUPLICATE_697c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l532_l535_DUPLICATE_697c_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l532_l535_DUPLICATE_a77d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l532_l535_DUPLICATE_a77d_return_output := result.vram_write_layer;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l532_l535_DUPLICATE_7a99 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l532_l535_DUPLICATE_7a99_return_output := result.u8_value;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_d9bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c6_b583_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l519_c2_206a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c6_b583_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l519_c2_206a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c6_b583_return_output;
     VAR_result_MUX_uxn_opcodes_h_l519_c2_206a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c6_b583_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l519_c2_206a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c6_b583_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1af4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_b8a5_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l532_c7_d9bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_b8a5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l532_c7_d9bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_b8a5_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_d9bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_b8a5_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_d9bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_b8a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_d9bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_b8a5_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_d9bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_b8a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_d9bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_b8a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_d9bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_b8a5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l532_c7_d9bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_b8a5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l532_c7_d9bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_b8a5_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_d9bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_b8a5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l532_c7_d9bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_b8a5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_c630_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_2775_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_1af4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_2775_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l535_c7_1af4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_2775_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1af4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_2775_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1af4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_2775_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1af4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_2775_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1af4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_2775_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1af4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_2775_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l535_c7_1af4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_2775_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l535_c7_1af4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_2775_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1af4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_2775_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l535_c7_1af4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_2775_return_output;
     VAR_MUX_uxn_opcodes_h_l541_c9_b483_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l541_c9_c3d5_return_output;
     VAR_device_out_uxn_opcodes_h_l542_c23_3c13_phase := VAR_BIN_OP_MINUS_uxn_opcodes_h_l542_c42_a33a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l532_l535_DUPLICATE_2857_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l532_l535_DUPLICATE_2857_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l532_l535_DUPLICATE_697c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l532_l535_DUPLICATE_697c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l532_l535_DUPLICATE_0bbe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l532_l535_DUPLICATE_0bbe_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l532_l535_DUPLICATE_8637_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l532_l535_DUPLICATE_8637_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l532_l535_DUPLICATE_a77d_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l532_l535_DUPLICATE_a77d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l532_l535_DUPLICATE_4031_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l532_l535_DUPLICATE_4031_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l532_l535_DUPLICATE_7a99_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l532_l535_DUPLICATE_7a99_return_output;
     VAR_result_MUX_uxn_opcodes_h_l519_c2_206a_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l519_c2_206a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue := VAR_result_sp_relative_shift_TRUE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l532_c7_d9bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l532_c7_d9bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l537_c30_d34a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l532_c7_d9bb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_d9bb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_d9bb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l535_c7_1af4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1af4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1af4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1af4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1af4_return_output;

     -- t8_MUX[uxn_opcodes_h_l535_c7_1af4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l535_c7_1af4_cond <= VAR_t8_MUX_uxn_opcodes_h_l535_c7_1af4_cond;
     t8_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue;
     t8_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l535_c7_1af4_return_output := t8_MUX_uxn_opcodes_h_l535_c7_1af4_return_output;

     -- MUX[uxn_opcodes_h_l541_c9_b483] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l541_c9_b483_cond <= VAR_MUX_uxn_opcodes_h_l541_c9_b483_cond;
     MUX_uxn_opcodes_h_l541_c9_b483_iftrue <= VAR_MUX_uxn_opcodes_h_l541_c9_b483_iftrue;
     MUX_uxn_opcodes_h_l541_c9_b483_iffalse <= VAR_MUX_uxn_opcodes_h_l541_c9_b483_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l541_c9_b483_return_output := MUX_uxn_opcodes_h_l541_c9_b483_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l532_c7_d9bb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_d9bb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_d9bb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output;
     VAR_device_out_uxn_opcodes_h_l542_c23_3c13_value := VAR_MUX_uxn_opcodes_h_l541_c9_b483_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse := VAR_MUX_uxn_opcodes_h_l541_c9_b483_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1af4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse := VAR_t8_MUX_uxn_opcodes_h_l535_c7_1af4_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l532_c7_d9bb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_d9bb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_d9bb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l535_c7_1af4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1af4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1af4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1af4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1af4_return_output;

     -- n8_MUX[uxn_opcodes_h_l535_c7_1af4] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l535_c7_1af4_cond <= VAR_n8_MUX_uxn_opcodes_h_l535_c7_1af4_cond;
     n8_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue;
     n8_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l535_c7_1af4_return_output := n8_MUX_uxn_opcodes_h_l535_c7_1af4_return_output;

     -- t8_MUX[uxn_opcodes_h_l532_c7_d9bb] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l532_c7_d9bb_cond <= VAR_t8_MUX_uxn_opcodes_h_l532_c7_d9bb_cond;
     t8_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue;
     t8_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output := t8_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_c630_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1af4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse := VAR_n8_MUX_uxn_opcodes_h_l535_c7_1af4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l519_c2_206a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output;
     -- t8_MUX[uxn_opcodes_h_l519_c2_206a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l519_c2_206a_cond <= VAR_t8_MUX_uxn_opcodes_h_l519_c2_206a_cond;
     t8_MUX_uxn_opcodes_h_l519_c2_206a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l519_c2_206a_iftrue;
     t8_MUX_uxn_opcodes_h_l519_c2_206a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l519_c2_206a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l519_c2_206a_return_output := t8_MUX_uxn_opcodes_h_l519_c2_206a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l539_c1_c630] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_c630_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_c630_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_c630_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_c630_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_c630_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_c630_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_c630_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_c630_return_output;

     -- n8_MUX[uxn_opcodes_h_l532_c7_d9bb] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l532_c7_d9bb_cond <= VAR_n8_MUX_uxn_opcodes_h_l532_c7_d9bb_cond;
     n8_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue;
     n8_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output := n8_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output;

     -- Submodule level 4
     VAR_device_out_uxn_opcodes_h_l542_c23_3c13_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_c630_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l519_c2_206a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l519_c2_206a_return_output;
     -- device_out[uxn_opcodes_h_l542_c23_3c13] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l542_c23_3c13_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l542_c23_3c13_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l542_c23_3c13_device_address <= VAR_device_out_uxn_opcodes_h_l542_c23_3c13_device_address;
     device_out_uxn_opcodes_h_l542_c23_3c13_value <= VAR_device_out_uxn_opcodes_h_l542_c23_3c13_value;
     device_out_uxn_opcodes_h_l542_c23_3c13_phase <= VAR_device_out_uxn_opcodes_h_l542_c23_3c13_phase;
     device_out_uxn_opcodes_h_l542_c23_3c13_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l542_c23_3c13_previous_device_ram_read;
     device_out_uxn_opcodes_h_l542_c23_3c13_previous_ram_read <= VAR_device_out_uxn_opcodes_h_l542_c23_3c13_previous_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l542_c23_3c13_return_output := device_out_uxn_opcodes_h_l542_c23_3c13_return_output;

     -- n8_MUX[uxn_opcodes_h_l519_c2_206a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l519_c2_206a_cond <= VAR_n8_MUX_uxn_opcodes_h_l519_c2_206a_cond;
     n8_MUX_uxn_opcodes_h_l519_c2_206a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l519_c2_206a_iftrue;
     n8_MUX_uxn_opcodes_h_l519_c2_206a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l519_c2_206a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l519_c2_206a_return_output := n8_MUX_uxn_opcodes_h_l519_c2_206a_return_output;

     -- Submodule level 5
     VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse := VAR_device_out_uxn_opcodes_h_l542_c23_3c13_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l519_c2_206a_return_output;
     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_opcodes_h_l545_c21_967e] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l545_c21_967e_return_output := VAR_device_out_uxn_opcodes_h_l542_c23_3c13_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l547_c26_3226] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l547_c26_3226_return_output := VAR_device_out_uxn_opcodes_h_l542_c23_3c13_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d[uxn_opcodes_h_l549_c24_158c] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l549_c24_158c_return_output := VAR_device_out_uxn_opcodes_h_l542_c23_3c13_return_output.is_deo_done;

     -- CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d[uxn_opcodes_h_l546_c22_77fd] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l546_c22_77fd_return_output := VAR_device_out_uxn_opcodes_h_l542_c23_3c13_return_output.u16_addr;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l544_c31_d862] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l544_c31_d862_return_output := VAR_device_out_uxn_opcodes_h_l542_c23_3c13_return_output.device_ram_address;

     -- device_out_result_MUX[uxn_opcodes_h_l535_c7_1af4] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l535_c7_1af4_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_1af4_cond;
     device_out_result_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_1af4_return_output := device_out_result_MUX_uxn_opcodes_h_l535_c7_1af4_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l543_c32_ba60] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l543_c32_ba60_return_output := VAR_device_out_uxn_opcodes_h_l542_c23_3c13_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_opcodes_h_l548_c29_733e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l548_c29_733e_return_output := VAR_device_out_uxn_opcodes_h_l542_c23_3c13_return_output.vram_write_layer;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l546_c22_77fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l549_c24_158c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l543_c32_ba60_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l547_c26_3226_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l548_c29_733e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l544_c31_d862_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l545_c21_967e_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_1af4_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l535_c7_1af4] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1af4_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1af4_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1af4_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1af4_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l532_c7_d9bb] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l532_c7_d9bb_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l532_c7_d9bb_cond;
     device_out_result_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output := device_out_result_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l535_c7_1af4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l535_c7_1af4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l535_c7_1af4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l535_c7_1af4_return_output := result_u8_value_MUX_uxn_opcodes_h_l535_c7_1af4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l535_c7_1af4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1af4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1af4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1af4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1af4_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l535_c7_1af4] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1af4_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1af4_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1af4_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1af4_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l535_c7_1af4] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1af4_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1af4_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1af4_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1af4_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l535_c7_1af4] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1af4_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1af4_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1af4_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1af4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l535_c7_1af4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l535_c7_1af4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l535_c7_1af4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l535_c7_1af4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l535_c7_1af4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l535_c7_1af4_return_output := result_u16_value_MUX_uxn_opcodes_h_l535_c7_1af4_return_output;

     -- Submodule level 7
     VAR_device_out_result_MUX_uxn_opcodes_h_l519_c2_206a_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1af4_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1af4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1af4_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1af4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l535_c7_1af4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l535_c7_1af4_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1af4_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l532_c7_d9bb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l532_c7_d9bb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l532_c7_d9bb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output := result_u8_value_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l532_c7_d9bb] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_d9bb_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_d9bb_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l519_c2_206a] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l519_c2_206a_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l519_c2_206a_cond;
     device_out_result_MUX_uxn_opcodes_h_l519_c2_206a_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l519_c2_206a_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l519_c2_206a_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l519_c2_206a_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l519_c2_206a_return_output := device_out_result_MUX_uxn_opcodes_h_l519_c2_206a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l532_c7_d9bb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_d9bb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_d9bb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l532_c7_d9bb] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_d9bb_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_d9bb_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l532_c7_d9bb] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_d9bb_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_d9bb_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l532_c7_d9bb] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_d9bb_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_d9bb_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l532_c7_d9bb] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l532_c7_d9bb_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l532_c7_d9bb_cond;
     result_u16_value_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l532_c7_d9bb_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l532_c7_d9bb_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output := result_u16_value_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output;

     -- Submodule level 8
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l519_c2_206a_return_output;
     -- result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_6fac[uxn_opcodes_h_l519_c2_206a] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_6fac_uxn_opcodes_h_l519_c2_206a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6fac(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output,
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_d9bb_return_output);

     -- Submodule level 9
     VAR_result_MUX_uxn_opcodes_h_l519_c2_206a_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_6fac_uxn_opcodes_h_l519_c2_206a_return_output;
     -- result_MUX[uxn_opcodes_h_l519_c2_206a] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l519_c2_206a_cond <= VAR_result_MUX_uxn_opcodes_h_l519_c2_206a_cond;
     result_MUX_uxn_opcodes_h_l519_c2_206a_iftrue <= VAR_result_MUX_uxn_opcodes_h_l519_c2_206a_iftrue;
     result_MUX_uxn_opcodes_h_l519_c2_206a_iffalse <= VAR_result_MUX_uxn_opcodes_h_l519_c2_206a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l519_c2_206a_return_output := result_MUX_uxn_opcodes_h_l519_c2_206a_return_output;

     -- Submodule level 10
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l519_c2_206a_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l519_c2_206a_return_output;
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
