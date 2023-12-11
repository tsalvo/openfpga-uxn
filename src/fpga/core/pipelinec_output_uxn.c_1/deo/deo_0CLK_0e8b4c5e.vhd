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
entity deo_0CLK_0e8b4c5e is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo_0CLK_0e8b4c5e;
architecture arch of deo_0CLK_0e8b4c5e is
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
-- BIN_OP_EQ[uxn_opcodes_h_l519_c6_13cb]
signal BIN_OP_EQ_uxn_opcodes_h_l519_c6_13cb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l519_c6_13cb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l519_c6_13cb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l532_c7_6380]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_6380_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_6380_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_6380_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_6380_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l519_c2_c6f4]
signal device_out_result_MUX_uxn_opcodes_h_l519_c2_c6f4_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l519_c2_c6f4_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l519_c2_c6f4_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l519_c2_c6f4_return_output : device_out_result_t;

-- t8_MUX[uxn_opcodes_h_l519_c2_c6f4]
signal t8_MUX_uxn_opcodes_h_l519_c2_c6f4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l519_c2_c6f4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l519_c2_c6f4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l519_c2_c6f4_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l519_c2_c6f4]
signal n8_MUX_uxn_opcodes_h_l519_c2_c6f4_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l519_c2_c6f4_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l519_c2_c6f4_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l519_c2_c6f4_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_h_l519_c2_c6f4]
signal result_MUX_uxn_opcodes_h_l519_c2_c6f4_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l519_c2_c6f4_iftrue : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l519_c2_c6f4_iffalse : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l519_c2_c6f4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l532_c11_9f03]
signal BIN_OP_EQ_uxn_opcodes_h_l532_c11_9f03_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l532_c11_9f03_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l532_c11_9f03_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l535_c7_1023]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1023_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1023_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1023_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1023_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l532_c7_6380]
signal device_out_result_MUX_uxn_opcodes_h_l532_c7_6380_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l532_c7_6380_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l532_c7_6380_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l532_c7_6380_return_output : device_out_result_t;

-- t8_MUX[uxn_opcodes_h_l532_c7_6380]
signal t8_MUX_uxn_opcodes_h_l532_c7_6380_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l532_c7_6380_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l532_c7_6380_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l532_c7_6380_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l532_c7_6380]
signal n8_MUX_uxn_opcodes_h_l532_c7_6380_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l532_c7_6380_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l532_c7_6380_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l532_c7_6380_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l532_c7_6380]
signal result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_6380_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_6380_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_6380_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_6380_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l532_c7_6380]
signal result_u16_value_MUX_uxn_opcodes_h_l532_c7_6380_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l532_c7_6380_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l532_c7_6380_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l532_c7_6380_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l532_c7_6380]
signal result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_6380_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_6380_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_6380_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_6380_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l532_c7_6380]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_6380_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_6380_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_6380_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_6380_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l532_c7_6380]
signal result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_6380_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_6380_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_6380_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_6380_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l532_c7_6380]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_6380_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_6380_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_6380_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_6380_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l532_c7_6380]
signal result_u8_value_MUX_uxn_opcodes_h_l532_c7_6380_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l532_c7_6380_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l532_c7_6380_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l532_c7_6380_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l532_c7_6380]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_6380_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_6380_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_6380_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_6380_return_output : unsigned(3 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l532_c7_6380]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_6380_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_6380_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_6380_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_6380_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l535_c11_a106]
signal BIN_OP_EQ_uxn_opcodes_h_l535_c11_a106_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l535_c11_a106_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l535_c11_a106_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l539_c1_fc60]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_fc60_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_fc60_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_fc60_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_fc60_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l535_c7_1023]
signal device_out_result_MUX_uxn_opcodes_h_l535_c7_1023_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l535_c7_1023_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l535_c7_1023_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l535_c7_1023_return_output : device_out_result_t;

-- t8_MUX[uxn_opcodes_h_l535_c7_1023]
signal t8_MUX_uxn_opcodes_h_l535_c7_1023_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l535_c7_1023_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l535_c7_1023_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l535_c7_1023_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l535_c7_1023]
signal n8_MUX_uxn_opcodes_h_l535_c7_1023_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l535_c7_1023_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l535_c7_1023_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l535_c7_1023_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l535_c7_1023]
signal result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1023_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1023_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1023_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1023_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l535_c7_1023]
signal result_u16_value_MUX_uxn_opcodes_h_l535_c7_1023_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l535_c7_1023_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l535_c7_1023_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l535_c7_1023_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l535_c7_1023]
signal result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1023_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1023_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1023_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1023_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l535_c7_1023]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1023_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1023_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1023_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1023_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l535_c7_1023]
signal result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1023_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1023_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1023_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1023_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l535_c7_1023]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1023_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1023_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1023_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1023_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l535_c7_1023]
signal result_u8_value_MUX_uxn_opcodes_h_l535_c7_1023_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l535_c7_1023_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l535_c7_1023_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l535_c7_1023_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l535_c7_1023]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1023_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1023_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1023_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1023_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l537_c30_616c]
signal sp_relative_shift_uxn_opcodes_h_l537_c30_616c_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l537_c30_616c_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l537_c30_616c_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l537_c30_616c_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l541_c9_a698]
signal BIN_OP_EQ_uxn_opcodes_h_l541_c9_a698_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l541_c9_a698_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l541_c9_a698_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l541_c9_d22b]
signal MUX_uxn_opcodes_h_l541_c9_d22b_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l541_c9_d22b_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l541_c9_d22b_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l541_c9_d22b_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l542_c42_d0fd]
signal BIN_OP_MINUS_uxn_opcodes_h_l542_c42_d0fd_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l542_c42_d0fd_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l542_c42_d0fd_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l542_c23_5b90]
signal device_out_uxn_opcodes_h_l542_c23_5b90_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l542_c23_5b90_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l542_c23_5b90_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l542_c23_5b90_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l542_c23_5b90_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l542_c23_5b90_previous_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l542_c23_5b90_return_output : device_out_result_t;

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_0bfb( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.u16_value := ref_toks_2;
      base.device_ram_address := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.is_vram_write := ref_toks_5;
      base.vram_write_layer := ref_toks_6;
      base.u8_value := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_device_ram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l519_c6_13cb
BIN_OP_EQ_uxn_opcodes_h_l519_c6_13cb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l519_c6_13cb_left,
BIN_OP_EQ_uxn_opcodes_h_l519_c6_13cb_right,
BIN_OP_EQ_uxn_opcodes_h_l519_c6_13cb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_6380
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_6380 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_6380_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_6380_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_6380_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_6380_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l519_c2_c6f4
device_out_result_MUX_uxn_opcodes_h_l519_c2_c6f4 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l519_c2_c6f4_cond,
device_out_result_MUX_uxn_opcodes_h_l519_c2_c6f4_iftrue,
device_out_result_MUX_uxn_opcodes_h_l519_c2_c6f4_iffalse,
device_out_result_MUX_uxn_opcodes_h_l519_c2_c6f4_return_output);

-- t8_MUX_uxn_opcodes_h_l519_c2_c6f4
t8_MUX_uxn_opcodes_h_l519_c2_c6f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l519_c2_c6f4_cond,
t8_MUX_uxn_opcodes_h_l519_c2_c6f4_iftrue,
t8_MUX_uxn_opcodes_h_l519_c2_c6f4_iffalse,
t8_MUX_uxn_opcodes_h_l519_c2_c6f4_return_output);

-- n8_MUX_uxn_opcodes_h_l519_c2_c6f4
n8_MUX_uxn_opcodes_h_l519_c2_c6f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l519_c2_c6f4_cond,
n8_MUX_uxn_opcodes_h_l519_c2_c6f4_iftrue,
n8_MUX_uxn_opcodes_h_l519_c2_c6f4_iffalse,
n8_MUX_uxn_opcodes_h_l519_c2_c6f4_return_output);

-- result_MUX_uxn_opcodes_h_l519_c2_c6f4
result_MUX_uxn_opcodes_h_l519_c2_c6f4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l519_c2_c6f4_cond,
result_MUX_uxn_opcodes_h_l519_c2_c6f4_iftrue,
result_MUX_uxn_opcodes_h_l519_c2_c6f4_iffalse,
result_MUX_uxn_opcodes_h_l519_c2_c6f4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l532_c11_9f03
BIN_OP_EQ_uxn_opcodes_h_l532_c11_9f03 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l532_c11_9f03_left,
BIN_OP_EQ_uxn_opcodes_h_l532_c11_9f03_right,
BIN_OP_EQ_uxn_opcodes_h_l532_c11_9f03_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1023
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1023 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1023_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1023_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1023_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1023_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l532_c7_6380
device_out_result_MUX_uxn_opcodes_h_l532_c7_6380 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l532_c7_6380_cond,
device_out_result_MUX_uxn_opcodes_h_l532_c7_6380_iftrue,
device_out_result_MUX_uxn_opcodes_h_l532_c7_6380_iffalse,
device_out_result_MUX_uxn_opcodes_h_l532_c7_6380_return_output);

-- t8_MUX_uxn_opcodes_h_l532_c7_6380
t8_MUX_uxn_opcodes_h_l532_c7_6380 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l532_c7_6380_cond,
t8_MUX_uxn_opcodes_h_l532_c7_6380_iftrue,
t8_MUX_uxn_opcodes_h_l532_c7_6380_iffalse,
t8_MUX_uxn_opcodes_h_l532_c7_6380_return_output);

-- n8_MUX_uxn_opcodes_h_l532_c7_6380
n8_MUX_uxn_opcodes_h_l532_c7_6380 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l532_c7_6380_cond,
n8_MUX_uxn_opcodes_h_l532_c7_6380_iftrue,
n8_MUX_uxn_opcodes_h_l532_c7_6380_iffalse,
n8_MUX_uxn_opcodes_h_l532_c7_6380_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_6380
result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_6380 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_6380_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_6380_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_6380_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_6380_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l532_c7_6380
result_u16_value_MUX_uxn_opcodes_h_l532_c7_6380 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l532_c7_6380_cond,
result_u16_value_MUX_uxn_opcodes_h_l532_c7_6380_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l532_c7_6380_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l532_c7_6380_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_6380
result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_6380 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_6380_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_6380_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_6380_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_6380_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_6380
result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_6380 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_6380_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_6380_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_6380_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_6380_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_6380
result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_6380 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_6380_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_6380_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_6380_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_6380_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_6380
result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_6380 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_6380_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_6380_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_6380_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_6380_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l532_c7_6380
result_u8_value_MUX_uxn_opcodes_h_l532_c7_6380 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l532_c7_6380_cond,
result_u8_value_MUX_uxn_opcodes_h_l532_c7_6380_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l532_c7_6380_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l532_c7_6380_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_6380
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_6380 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_6380_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_6380_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_6380_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_6380_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_6380
result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_6380 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_6380_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_6380_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_6380_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_6380_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l535_c11_a106
BIN_OP_EQ_uxn_opcodes_h_l535_c11_a106 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l535_c11_a106_left,
BIN_OP_EQ_uxn_opcodes_h_l535_c11_a106_right,
BIN_OP_EQ_uxn_opcodes_h_l535_c11_a106_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_fc60
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_fc60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_fc60_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_fc60_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_fc60_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_fc60_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l535_c7_1023
device_out_result_MUX_uxn_opcodes_h_l535_c7_1023 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l535_c7_1023_cond,
device_out_result_MUX_uxn_opcodes_h_l535_c7_1023_iftrue,
device_out_result_MUX_uxn_opcodes_h_l535_c7_1023_iffalse,
device_out_result_MUX_uxn_opcodes_h_l535_c7_1023_return_output);

-- t8_MUX_uxn_opcodes_h_l535_c7_1023
t8_MUX_uxn_opcodes_h_l535_c7_1023 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l535_c7_1023_cond,
t8_MUX_uxn_opcodes_h_l535_c7_1023_iftrue,
t8_MUX_uxn_opcodes_h_l535_c7_1023_iffalse,
t8_MUX_uxn_opcodes_h_l535_c7_1023_return_output);

-- n8_MUX_uxn_opcodes_h_l535_c7_1023
n8_MUX_uxn_opcodes_h_l535_c7_1023 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l535_c7_1023_cond,
n8_MUX_uxn_opcodes_h_l535_c7_1023_iftrue,
n8_MUX_uxn_opcodes_h_l535_c7_1023_iffalse,
n8_MUX_uxn_opcodes_h_l535_c7_1023_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1023
result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1023 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1023_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1023_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1023_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1023_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l535_c7_1023
result_u16_value_MUX_uxn_opcodes_h_l535_c7_1023 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l535_c7_1023_cond,
result_u16_value_MUX_uxn_opcodes_h_l535_c7_1023_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l535_c7_1023_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l535_c7_1023_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1023
result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1023 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1023_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1023_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1023_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1023_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1023
result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1023 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1023_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1023_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1023_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1023_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1023
result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1023 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1023_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1023_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1023_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1023_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1023
result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1023 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1023_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1023_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1023_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1023_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l535_c7_1023
result_u8_value_MUX_uxn_opcodes_h_l535_c7_1023 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l535_c7_1023_cond,
result_u8_value_MUX_uxn_opcodes_h_l535_c7_1023_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l535_c7_1023_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l535_c7_1023_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1023
result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1023 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1023_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1023_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1023_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1023_return_output);

-- sp_relative_shift_uxn_opcodes_h_l537_c30_616c
sp_relative_shift_uxn_opcodes_h_l537_c30_616c : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l537_c30_616c_ins,
sp_relative_shift_uxn_opcodes_h_l537_c30_616c_x,
sp_relative_shift_uxn_opcodes_h_l537_c30_616c_y,
sp_relative_shift_uxn_opcodes_h_l537_c30_616c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l541_c9_a698
BIN_OP_EQ_uxn_opcodes_h_l541_c9_a698 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l541_c9_a698_left,
BIN_OP_EQ_uxn_opcodes_h_l541_c9_a698_right,
BIN_OP_EQ_uxn_opcodes_h_l541_c9_a698_return_output);

-- MUX_uxn_opcodes_h_l541_c9_d22b
MUX_uxn_opcodes_h_l541_c9_d22b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l541_c9_d22b_cond,
MUX_uxn_opcodes_h_l541_c9_d22b_iftrue,
MUX_uxn_opcodes_h_l541_c9_d22b_iffalse,
MUX_uxn_opcodes_h_l541_c9_d22b_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l542_c42_d0fd
BIN_OP_MINUS_uxn_opcodes_h_l542_c42_d0fd : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l542_c42_d0fd_left,
BIN_OP_MINUS_uxn_opcodes_h_l542_c42_d0fd_right,
BIN_OP_MINUS_uxn_opcodes_h_l542_c42_d0fd_return_output);

-- device_out_uxn_opcodes_h_l542_c23_5b90
device_out_uxn_opcodes_h_l542_c23_5b90 : entity work.device_out_0CLK_95124a2a port map (
clk,
device_out_uxn_opcodes_h_l542_c23_5b90_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l542_c23_5b90_device_address,
device_out_uxn_opcodes_h_l542_c23_5b90_value,
device_out_uxn_opcodes_h_l542_c23_5b90_phase,
device_out_uxn_opcodes_h_l542_c23_5b90_previous_device_ram_read,
device_out_uxn_opcodes_h_l542_c23_5b90_previous_ram_read,
device_out_uxn_opcodes_h_l542_c23_5b90_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l519_c6_13cb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_6380_return_output,
 device_out_result_MUX_uxn_opcodes_h_l519_c2_c6f4_return_output,
 t8_MUX_uxn_opcodes_h_l519_c2_c6f4_return_output,
 n8_MUX_uxn_opcodes_h_l519_c2_c6f4_return_output,
 result_MUX_uxn_opcodes_h_l519_c2_c6f4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l532_c11_9f03_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1023_return_output,
 device_out_result_MUX_uxn_opcodes_h_l532_c7_6380_return_output,
 t8_MUX_uxn_opcodes_h_l532_c7_6380_return_output,
 n8_MUX_uxn_opcodes_h_l532_c7_6380_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_6380_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l532_c7_6380_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_6380_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_6380_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_6380_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_6380_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l532_c7_6380_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_6380_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_6380_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l535_c11_a106_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_fc60_return_output,
 device_out_result_MUX_uxn_opcodes_h_l535_c7_1023_return_output,
 t8_MUX_uxn_opcodes_h_l535_c7_1023_return_output,
 n8_MUX_uxn_opcodes_h_l535_c7_1023_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1023_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l535_c7_1023_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1023_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1023_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1023_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1023_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l535_c7_1023_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1023_return_output,
 sp_relative_shift_uxn_opcodes_h_l537_c30_616c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l541_c9_a698_return_output,
 MUX_uxn_opcodes_h_l541_c9_d22b_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l542_c42_d0fd_return_output,
 device_out_uxn_opcodes_h_l542_c23_5b90_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c6_13cb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c6_13cb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c6_13cb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_6380_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_6380_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_6380_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_6380_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l519_c2_c6f4_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l519_c2_c6f4_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l532_c7_6380_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l519_c2_c6f4_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l519_c2_c6f4_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l519_c2_c6f4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l519_c2_c6f4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l532_c7_6380_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l519_c2_c6f4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l519_c2_c6f4_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l519_c2_c6f4_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l519_c2_c6f4_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l532_c7_6380_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l519_c2_c6f4_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l519_c2_c6f4_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l519_c2_c6f4_iftrue : opcode_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l519_c2_c6f4_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l519_c2_c6f4_iffalse : opcode_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_0bfb_uxn_opcodes_h_l519_c2_c6f4_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l519_c2_c6f4_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l519_c2_c6f4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l524_c3_576d : signed(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l529_c3_e914 : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_9f03_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_9f03_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_9f03_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1023_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1023_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1023_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1023_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l532_c7_6380_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l532_c7_6380_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_1023_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l532_c7_6380_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l532_c7_6380_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l532_c7_6380_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l535_c7_1023_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l532_c7_6380_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l532_c7_6380_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l532_c7_6380_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l535_c7_1023_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l532_c7_6380_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_6380_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_6380_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1023_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_6380_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_6380_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l532_c7_6380_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l532_c7_6380_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l535_c7_1023_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l532_c7_6380_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l532_c7_6380_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_6380_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_6380_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1023_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_6380_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_6380_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_6380_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_TRUE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l532_c7_6380_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_6380_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1023_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_6380_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_6380_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_6380_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_6380_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1023_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_6380_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_6380_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_6380_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_6380_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1023_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_6380_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_6380_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l532_c7_6380_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l532_c7_6380_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l535_c7_1023_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l532_c7_6380_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l532_c7_6380_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_6380_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l533_c3_1dd1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_6380_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l532_c7_6380_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_6380_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_6380_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_6380_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_6380_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1023_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_6380_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_6380_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_a106_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_a106_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_a106_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_fc60_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_fc60_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_fc60_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_fc60_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_1023_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_1023_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_1023_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l535_c7_1023_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l535_c7_1023_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l535_c7_1023_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l535_c7_1023_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l535_c7_1023_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l535_c7_1023_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1023_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1023_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1023_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l535_c7_1023_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l535_c7_1023_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l535_c7_1023_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1023_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1023_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1023_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1023_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1023_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l540_c3_ff55 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1023_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1023_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1023_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1023_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1023_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1023_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1023_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l535_c7_1023_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l535_c7_1023_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l535_c7_1023_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1023_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1023_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1023_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l537_c30_616c_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l537_c30_616c_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l537_c30_616c_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l537_c30_616c_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l541_c9_d22b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l541_c9_a698_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l541_c9_a698_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l541_c9_a698_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l541_c9_d22b_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l541_c9_d22b_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l541_c9_d22b_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l542_c23_5b90_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l542_c23_5b90_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l542_c23_5b90_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l542_c23_5b90_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l542_c23_5b90_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l542_c42_d0fd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l542_c42_d0fd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l542_c42_d0fd_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l542_c23_5b90_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l542_c23_5b90_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l543_c32_eebc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l544_c31_bcd4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l545_c21_982c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l546_c22_67e5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l547_c26_7933_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l548_c29_5216_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l549_c24_a910_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l535_l532_DUPLICATE_a80e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l535_l532_DUPLICATE_55e5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l535_l532_DUPLICATE_8be8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l535_l532_DUPLICATE_fb2e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l535_l532_DUPLICATE_854c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l535_l532_DUPLICATE_0e80_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l535_l532_DUPLICATE_62d2_return_output : unsigned(0 downto 0);
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l533_c3_1dd1 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_6380_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l533_c3_1dd1;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_6380_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_9f03_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c6_13cb_right := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l542_c42_d0fd_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l524_c3_576d := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l540_c3_ff55 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1023_iffalse := VAR_result_sp_relative_shift_uxn_opcodes_h_l540_c3_ff55;
     VAR_sp_relative_shift_uxn_opcodes_h_l537_c30_616c_y := resize(to_signed(-2, 3), 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l537_c30_616c_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l541_c9_a698_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l529_c3_e914 := resize(to_unsigned(1, 1), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_a106_right := to_unsigned(2, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_fc60_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1023_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_6380_iffalse := VAR_CLOCK_ENABLE;
     VAR_device_out_result_MUX_uxn_opcodes_h_l519_c2_c6f4_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l532_c7_6380_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_1023_iftrue := device_out_result;
     VAR_sp_relative_shift_uxn_opcodes_h_l537_c30_616c_ins := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l541_c9_d22b_iffalse := n8;
     VAR_n8_MUX_uxn_opcodes_h_l519_c2_c6f4_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l532_c7_6380_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l535_c7_1023_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c6_13cb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_9f03_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_a106_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l541_c9_a698_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l542_c42_d0fd_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l542_c23_5b90_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_device_out_uxn_opcodes_h_l542_c23_5b90_previous_ram_read := VAR_previous_ram_read;
     VAR_MUX_uxn_opcodes_h_l541_c9_d22b_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l535_c7_1023_iftrue := VAR_previous_stack_read;
     VAR_device_out_uxn_opcodes_h_l542_c23_5b90_device_address := t8;
     VAR_t8_MUX_uxn_opcodes_h_l519_c2_c6f4_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l532_c7_6380_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l535_c7_1023_iffalse := t8;
     -- BIN_OP_MINUS[uxn_opcodes_h_l542_c42_d0fd] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l542_c42_d0fd_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l542_c42_d0fd_left;
     BIN_OP_MINUS_uxn_opcodes_h_l542_c42_d0fd_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l542_c42_d0fd_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l542_c42_d0fd_return_output := BIN_OP_MINUS_uxn_opcodes_h_l542_c42_d0fd_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770[uxn_opcodes_h_l519_c2_c6f4] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l519_c2_c6f4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4770(
     result,
     to_unsigned(0, 1),
     VAR_result_sp_relative_shift_uxn_opcodes_h_l524_c3_576d,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l529_c3_e914,
     to_unsigned(0, 1));

     -- BIN_OP_EQ[uxn_opcodes_h_l519_c6_13cb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l519_c6_13cb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c6_13cb_left;
     BIN_OP_EQ_uxn_opcodes_h_l519_c6_13cb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c6_13cb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c6_13cb_return_output := BIN_OP_EQ_uxn_opcodes_h_l519_c6_13cb_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l535_l532_DUPLICATE_a80e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l535_l532_DUPLICATE_a80e_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l535_l532_DUPLICATE_854c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l535_l532_DUPLICATE_854c_return_output := result.vram_write_layer;

     -- BIN_OP_EQ[uxn_opcodes_h_l541_c9_a698] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l541_c9_a698_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l541_c9_a698_left;
     BIN_OP_EQ_uxn_opcodes_h_l541_c9_a698_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l541_c9_a698_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l541_c9_a698_return_output := BIN_OP_EQ_uxn_opcodes_h_l541_c9_a698_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l537_c30_616c] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l537_c30_616c_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l537_c30_616c_ins;
     sp_relative_shift_uxn_opcodes_h_l537_c30_616c_x <= VAR_sp_relative_shift_uxn_opcodes_h_l537_c30_616c_x;
     sp_relative_shift_uxn_opcodes_h_l537_c30_616c_y <= VAR_sp_relative_shift_uxn_opcodes_h_l537_c30_616c_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l537_c30_616c_return_output := sp_relative_shift_uxn_opcodes_h_l537_c30_616c_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l535_l532_DUPLICATE_55e5 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l535_l532_DUPLICATE_55e5_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l535_c11_a106] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l535_c11_a106_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_a106_left;
     BIN_OP_EQ_uxn_opcodes_h_l535_c11_a106_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_a106_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_a106_return_output := BIN_OP_EQ_uxn_opcodes_h_l535_c11_a106_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l535_l532_DUPLICATE_8be8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l535_l532_DUPLICATE_8be8_return_output := result.device_ram_address;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l532_c7_6380] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l532_c7_6380_return_output := result.stack_address_sp_offset;

     -- result_sp_relative_shift_TRUE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l532_c7_6380] LATENCY=0
     VAR_result_sp_relative_shift_TRUE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l532_c7_6380_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l535_l532_DUPLICATE_62d2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l535_l532_DUPLICATE_62d2_return_output := result.is_device_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l532_c11_9f03] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l532_c11_9f03_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_9f03_left;
     BIN_OP_EQ_uxn_opcodes_h_l532_c11_9f03_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_9f03_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_9f03_return_output := BIN_OP_EQ_uxn_opcodes_h_l532_c11_9f03_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l535_l532_DUPLICATE_0e80 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l535_l532_DUPLICATE_0e80_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l535_l532_DUPLICATE_fb2e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l535_l532_DUPLICATE_fb2e_return_output := result.is_vram_write;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_6380_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c6_13cb_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l519_c2_c6f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c6_13cb_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l519_c2_c6f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c6_13cb_return_output;
     VAR_result_MUX_uxn_opcodes_h_l519_c2_c6f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c6_13cb_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l519_c2_c6f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c6_13cb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_9f03_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l532_c7_6380_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_9f03_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l532_c7_6380_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_9f03_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_6380_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_9f03_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_6380_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_9f03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_6380_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_9f03_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_6380_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_9f03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_6380_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_9f03_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_6380_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_9f03_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l532_c7_6380_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_9f03_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l532_c7_6380_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_9f03_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_6380_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_9f03_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l532_c7_6380_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_9f03_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_fc60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_a106_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_1023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_a106_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l535_c7_1023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_a106_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_a106_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_a106_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_a106_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_a106_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_a106_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l535_c7_1023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_a106_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l535_c7_1023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_a106_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_a106_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l535_c7_1023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_a106_return_output;
     VAR_MUX_uxn_opcodes_h_l541_c9_d22b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l541_c9_a698_return_output;
     VAR_device_out_uxn_opcodes_h_l542_c23_5b90_phase := VAR_BIN_OP_MINUS_uxn_opcodes_h_l542_c42_d0fd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l532_c7_6380_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l535_l532_DUPLICATE_55e5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l535_c7_1023_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l535_l532_DUPLICATE_55e5_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_6380_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l535_l532_DUPLICATE_62d2_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1023_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l535_l532_DUPLICATE_62d2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_6380_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l535_l532_DUPLICATE_a80e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1023_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l535_l532_DUPLICATE_a80e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_6380_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l535_l532_DUPLICATE_fb2e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1023_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l535_l532_DUPLICATE_fb2e_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_6380_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l535_l532_DUPLICATE_854c_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1023_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l535_l532_DUPLICATE_854c_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_6380_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l535_l532_DUPLICATE_8be8_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1023_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l535_l532_DUPLICATE_8be8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l532_c7_6380_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l535_l532_DUPLICATE_0e80_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l535_c7_1023_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l535_l532_DUPLICATE_0e80_return_output;
     VAR_result_MUX_uxn_opcodes_h_l519_c2_c6f4_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l519_c2_c6f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_6380_iftrue := VAR_result_sp_relative_shift_TRUE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l532_c7_6380_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_6380_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l532_c7_6380_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1023_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l537_c30_616c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l532_c7_6380] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_6380_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_6380_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_6380_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_6380_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_6380_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_6380_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_6380_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_6380_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l535_c7_1023] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1023_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1023_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1023_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1023_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1023_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1023_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1023_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1023_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l532_c7_6380] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_6380_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_6380_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_6380_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_6380_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_6380_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_6380_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_6380_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_6380_return_output;

     -- MUX[uxn_opcodes_h_l541_c9_d22b] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l541_c9_d22b_cond <= VAR_MUX_uxn_opcodes_h_l541_c9_d22b_cond;
     MUX_uxn_opcodes_h_l541_c9_d22b_iftrue <= VAR_MUX_uxn_opcodes_h_l541_c9_d22b_iftrue;
     MUX_uxn_opcodes_h_l541_c9_d22b_iffalse <= VAR_MUX_uxn_opcodes_h_l541_c9_d22b_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l541_c9_d22b_return_output := MUX_uxn_opcodes_h_l541_c9_d22b_return_output;

     -- t8_MUX[uxn_opcodes_h_l535_c7_1023] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l535_c7_1023_cond <= VAR_t8_MUX_uxn_opcodes_h_l535_c7_1023_cond;
     t8_MUX_uxn_opcodes_h_l535_c7_1023_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l535_c7_1023_iftrue;
     t8_MUX_uxn_opcodes_h_l535_c7_1023_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l535_c7_1023_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l535_c7_1023_return_output := t8_MUX_uxn_opcodes_h_l535_c7_1023_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1023_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_6380_return_output;
     VAR_device_out_uxn_opcodes_h_l542_c23_5b90_value := VAR_MUX_uxn_opcodes_h_l541_c9_d22b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l535_c7_1023_iffalse := VAR_MUX_uxn_opcodes_h_l541_c9_d22b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_6380_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_1023_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l532_c7_6380_iffalse := VAR_t8_MUX_uxn_opcodes_h_l535_c7_1023_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l532_c7_6380] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_6380_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_6380_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_6380_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_6380_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_6380_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_6380_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_6380_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_6380_return_output;

     -- t8_MUX[uxn_opcodes_h_l532_c7_6380] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l532_c7_6380_cond <= VAR_t8_MUX_uxn_opcodes_h_l532_c7_6380_cond;
     t8_MUX_uxn_opcodes_h_l532_c7_6380_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l532_c7_6380_iftrue;
     t8_MUX_uxn_opcodes_h_l532_c7_6380_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l532_c7_6380_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l532_c7_6380_return_output := t8_MUX_uxn_opcodes_h_l532_c7_6380_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l535_c7_1023] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1023_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1023_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1023_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1023_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1023_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1023_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1023_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1023_return_output;

     -- n8_MUX[uxn_opcodes_h_l535_c7_1023] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l535_c7_1023_cond <= VAR_n8_MUX_uxn_opcodes_h_l535_c7_1023_cond;
     n8_MUX_uxn_opcodes_h_l535_c7_1023_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l535_c7_1023_iftrue;
     n8_MUX_uxn_opcodes_h_l535_c7_1023_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l535_c7_1023_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l535_c7_1023_return_output := n8_MUX_uxn_opcodes_h_l535_c7_1023_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_fc60_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_1023_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l532_c7_6380_iffalse := VAR_n8_MUX_uxn_opcodes_h_l535_c7_1023_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l519_c2_c6f4_iffalse := VAR_t8_MUX_uxn_opcodes_h_l532_c7_6380_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l539_c1_fc60] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_fc60_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_fc60_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_fc60_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_fc60_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_fc60_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_fc60_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_fc60_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_fc60_return_output;

     -- t8_MUX[uxn_opcodes_h_l519_c2_c6f4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l519_c2_c6f4_cond <= VAR_t8_MUX_uxn_opcodes_h_l519_c2_c6f4_cond;
     t8_MUX_uxn_opcodes_h_l519_c2_c6f4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l519_c2_c6f4_iftrue;
     t8_MUX_uxn_opcodes_h_l519_c2_c6f4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l519_c2_c6f4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l519_c2_c6f4_return_output := t8_MUX_uxn_opcodes_h_l519_c2_c6f4_return_output;

     -- n8_MUX[uxn_opcodes_h_l532_c7_6380] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l532_c7_6380_cond <= VAR_n8_MUX_uxn_opcodes_h_l532_c7_6380_cond;
     n8_MUX_uxn_opcodes_h_l532_c7_6380_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l532_c7_6380_iftrue;
     n8_MUX_uxn_opcodes_h_l532_c7_6380_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l532_c7_6380_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l532_c7_6380_return_output := n8_MUX_uxn_opcodes_h_l532_c7_6380_return_output;

     -- Submodule level 4
     VAR_device_out_uxn_opcodes_h_l542_c23_5b90_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c1_fc60_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l519_c2_c6f4_iffalse := VAR_n8_MUX_uxn_opcodes_h_l532_c7_6380_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l519_c2_c6f4_return_output;
     -- n8_MUX[uxn_opcodes_h_l519_c2_c6f4] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l519_c2_c6f4_cond <= VAR_n8_MUX_uxn_opcodes_h_l519_c2_c6f4_cond;
     n8_MUX_uxn_opcodes_h_l519_c2_c6f4_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l519_c2_c6f4_iftrue;
     n8_MUX_uxn_opcodes_h_l519_c2_c6f4_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l519_c2_c6f4_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l519_c2_c6f4_return_output := n8_MUX_uxn_opcodes_h_l519_c2_c6f4_return_output;

     -- device_out[uxn_opcodes_h_l542_c23_5b90] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l542_c23_5b90_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l542_c23_5b90_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l542_c23_5b90_device_address <= VAR_device_out_uxn_opcodes_h_l542_c23_5b90_device_address;
     device_out_uxn_opcodes_h_l542_c23_5b90_value <= VAR_device_out_uxn_opcodes_h_l542_c23_5b90_value;
     device_out_uxn_opcodes_h_l542_c23_5b90_phase <= VAR_device_out_uxn_opcodes_h_l542_c23_5b90_phase;
     device_out_uxn_opcodes_h_l542_c23_5b90_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l542_c23_5b90_previous_device_ram_read;
     device_out_uxn_opcodes_h_l542_c23_5b90_previous_ram_read <= VAR_device_out_uxn_opcodes_h_l542_c23_5b90_previous_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l542_c23_5b90_return_output := device_out_uxn_opcodes_h_l542_c23_5b90_return_output;

     -- Submodule level 5
     VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_1023_iffalse := VAR_device_out_uxn_opcodes_h_l542_c23_5b90_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l519_c2_c6f4_return_output;
     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l544_c31_bcd4] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l544_c31_bcd4_return_output := VAR_device_out_uxn_opcodes_h_l542_c23_5b90_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l543_c32_eebc] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l543_c32_eebc_return_output := VAR_device_out_uxn_opcodes_h_l542_c23_5b90_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d[uxn_opcodes_h_l546_c22_67e5] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l546_c22_67e5_return_output := VAR_device_out_uxn_opcodes_h_l542_c23_5b90_return_output.u16_addr;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l547_c26_7933] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l547_c26_7933_return_output := VAR_device_out_uxn_opcodes_h_l542_c23_5b90_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_opcodes_h_l548_c29_5216] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l548_c29_5216_return_output := VAR_device_out_uxn_opcodes_h_l542_c23_5b90_return_output.vram_write_layer;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_opcodes_h_l545_c21_982c] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l545_c21_982c_return_output := VAR_device_out_uxn_opcodes_h_l542_c23_5b90_return_output.u8_value;

     -- device_out_result_MUX[uxn_opcodes_h_l535_c7_1023] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l535_c7_1023_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_1023_cond;
     device_out_result_MUX_uxn_opcodes_h_l535_c7_1023_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_1023_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l535_c7_1023_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_1023_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_1023_return_output := device_out_result_MUX_uxn_opcodes_h_l535_c7_1023_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d[uxn_opcodes_h_l549_c24_a910] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l549_c24_a910_return_output := VAR_device_out_uxn_opcodes_h_l542_c23_5b90_return_output.is_deo_done;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l535_c7_1023_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l546_c22_67e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1023_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l549_c24_a910_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1023_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l543_c32_eebc_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1023_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l547_c26_7933_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1023_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l548_c29_5216_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1023_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l544_c31_bcd4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l535_c7_1023_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l545_c21_982c_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l532_c7_6380_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_1023_return_output;
     -- result_vram_write_layer_MUX[uxn_opcodes_h_l535_c7_1023] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1023_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1023_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1023_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1023_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1023_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1023_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1023_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1023_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l535_c7_1023] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1023_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1023_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1023_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1023_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1023_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1023_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1023_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1023_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l535_c7_1023] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l535_c7_1023_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l535_c7_1023_cond;
     result_u16_value_MUX_uxn_opcodes_h_l535_c7_1023_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l535_c7_1023_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l535_c7_1023_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l535_c7_1023_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l535_c7_1023_return_output := result_u16_value_MUX_uxn_opcodes_h_l535_c7_1023_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l535_c7_1023] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l535_c7_1023_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l535_c7_1023_cond;
     result_u8_value_MUX_uxn_opcodes_h_l535_c7_1023_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l535_c7_1023_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l535_c7_1023_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l535_c7_1023_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l535_c7_1023_return_output := result_u8_value_MUX_uxn_opcodes_h_l535_c7_1023_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l532_c7_6380] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l532_c7_6380_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l532_c7_6380_cond;
     device_out_result_MUX_uxn_opcodes_h_l532_c7_6380_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l532_c7_6380_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l532_c7_6380_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l532_c7_6380_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l532_c7_6380_return_output := device_out_result_MUX_uxn_opcodes_h_l532_c7_6380_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l535_c7_1023] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1023_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1023_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1023_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1023_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1023_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1023_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1023_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1023_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l535_c7_1023] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1023_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1023_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1023_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1023_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1023_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1023_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1023_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1023_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l535_c7_1023] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1023_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1023_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1023_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1023_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1023_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1023_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1023_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1023_return_output;

     -- Submodule level 7
     VAR_device_out_result_MUX_uxn_opcodes_h_l519_c2_c6f4_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l532_c7_6380_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_6380_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_1023_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_6380_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_1023_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_6380_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_1023_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_6380_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_1023_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l532_c7_6380_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l535_c7_1023_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l532_c7_6380_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l535_c7_1023_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_6380_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_1023_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l532_c7_6380] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_6380_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_6380_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_6380_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_6380_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_6380_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_6380_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_6380_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_6380_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l519_c2_c6f4] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l519_c2_c6f4_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l519_c2_c6f4_cond;
     device_out_result_MUX_uxn_opcodes_h_l519_c2_c6f4_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l519_c2_c6f4_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l519_c2_c6f4_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l519_c2_c6f4_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l519_c2_c6f4_return_output := device_out_result_MUX_uxn_opcodes_h_l519_c2_c6f4_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l532_c7_6380] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_6380_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_6380_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_6380_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_6380_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_6380_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_6380_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_6380_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_6380_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l532_c7_6380] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l532_c7_6380_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l532_c7_6380_cond;
     result_u16_value_MUX_uxn_opcodes_h_l532_c7_6380_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l532_c7_6380_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l532_c7_6380_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l532_c7_6380_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l532_c7_6380_return_output := result_u16_value_MUX_uxn_opcodes_h_l532_c7_6380_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l532_c7_6380] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l532_c7_6380_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l532_c7_6380_cond;
     result_u8_value_MUX_uxn_opcodes_h_l532_c7_6380_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l532_c7_6380_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l532_c7_6380_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l532_c7_6380_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l532_c7_6380_return_output := result_u8_value_MUX_uxn_opcodes_h_l532_c7_6380_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l532_c7_6380] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_6380_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_6380_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_6380_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_6380_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_6380_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_6380_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_6380_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_6380_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l532_c7_6380] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_6380_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_6380_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_6380_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_6380_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_6380_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_6380_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_6380_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_6380_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l532_c7_6380] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_6380_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_6380_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_6380_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_6380_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_6380_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_6380_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_6380_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_6380_return_output;

     -- Submodule level 8
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l519_c2_c6f4_return_output;
     -- result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_0bfb[uxn_opcodes_h_l519_c2_c6f4] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_0bfb_uxn_opcodes_h_l519_c2_c6f4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_0bfb(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_6380_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l532_c7_6380_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_6380_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_6380_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_6380_return_output,
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_6380_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l532_c7_6380_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_6380_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_6380_return_output);

     -- Submodule level 9
     VAR_result_MUX_uxn_opcodes_h_l519_c2_c6f4_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_0bfb_uxn_opcodes_h_l519_c2_c6f4_return_output;
     -- result_MUX[uxn_opcodes_h_l519_c2_c6f4] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l519_c2_c6f4_cond <= VAR_result_MUX_uxn_opcodes_h_l519_c2_c6f4_cond;
     result_MUX_uxn_opcodes_h_l519_c2_c6f4_iftrue <= VAR_result_MUX_uxn_opcodes_h_l519_c2_c6f4_iftrue;
     result_MUX_uxn_opcodes_h_l519_c2_c6f4_iffalse <= VAR_result_MUX_uxn_opcodes_h_l519_c2_c6f4_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l519_c2_c6f4_return_output := result_MUX_uxn_opcodes_h_l519_c2_c6f4_return_output;

     -- Submodule level 10
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l519_c2_c6f4_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l519_c2_c6f4_return_output;
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
