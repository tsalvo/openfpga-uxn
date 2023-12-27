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
-- BIN_OP_EQ[uxn_opcodes_h_l497_c6_5a6d]
signal BIN_OP_EQ_uxn_opcodes_h_l497_c6_5a6d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l497_c6_5a6d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l497_c6_5a6d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l510_c7_984d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_984d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_984d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_984d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_984d_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l497_c2_8e48]
signal n8_MUX_uxn_opcodes_h_l497_c2_8e48_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l497_c2_8e48_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l497_c2_8e48_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l497_c2_8e48_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l497_c2_8e48]
signal device_out_result_MUX_uxn_opcodes_h_l497_c2_8e48_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l497_c2_8e48_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l497_c2_8e48_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l497_c2_8e48_return_output : device_out_result_t;

-- result_MUX[uxn_opcodes_h_l497_c2_8e48]
signal result_MUX_uxn_opcodes_h_l497_c2_8e48_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l497_c2_8e48_iftrue : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l497_c2_8e48_iffalse : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l497_c2_8e48_return_output : opcode_result_t;

-- t8_MUX[uxn_opcodes_h_l497_c2_8e48]
signal t8_MUX_uxn_opcodes_h_l497_c2_8e48_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l497_c2_8e48_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l497_c2_8e48_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l497_c2_8e48_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l510_c11_7afd]
signal BIN_OP_EQ_uxn_opcodes_h_l510_c11_7afd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l510_c11_7afd_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l510_c11_7afd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l513_c7_2424]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_2424_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_2424_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_2424_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_2424_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l510_c7_984d]
signal n8_MUX_uxn_opcodes_h_l510_c7_984d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l510_c7_984d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l510_c7_984d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l510_c7_984d_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l510_c7_984d]
signal device_out_result_MUX_uxn_opcodes_h_l510_c7_984d_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l510_c7_984d_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l510_c7_984d_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l510_c7_984d_return_output : device_out_result_t;

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l510_c7_984d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_984d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_984d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_984d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_984d_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l510_c7_984d]
signal result_u8_value_MUX_uxn_opcodes_h_l510_c7_984d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l510_c7_984d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l510_c7_984d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l510_c7_984d_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l510_c7_984d]
signal result_u16_value_MUX_uxn_opcodes_h_l510_c7_984d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l510_c7_984d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l510_c7_984d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l510_c7_984d_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l510_c7_984d]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_984d_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_984d_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_984d_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_984d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l510_c7_984d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_984d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_984d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_984d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_984d_return_output : signed(3 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l510_c7_984d]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_984d_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_984d_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_984d_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_984d_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l510_c7_984d]
signal result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_984d_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_984d_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_984d_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_984d_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l510_c7_984d]
signal result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_984d_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_984d_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_984d_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_984d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l510_c7_984d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_984d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_984d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_984d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_984d_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l510_c7_984d]
signal t8_MUX_uxn_opcodes_h_l510_c7_984d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l510_c7_984d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l510_c7_984d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l510_c7_984d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l513_c11_a970]
signal BIN_OP_EQ_uxn_opcodes_h_l513_c11_a970_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l513_c11_a970_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l513_c11_a970_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l517_c1_21d8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_21d8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_21d8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_21d8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_21d8_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l513_c7_2424]
signal n8_MUX_uxn_opcodes_h_l513_c7_2424_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l513_c7_2424_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l513_c7_2424_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l513_c7_2424_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l513_c7_2424]
signal device_out_result_MUX_uxn_opcodes_h_l513_c7_2424_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l513_c7_2424_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l513_c7_2424_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l513_c7_2424_return_output : device_out_result_t;

-- result_u8_value_MUX[uxn_opcodes_h_l513_c7_2424]
signal result_u8_value_MUX_uxn_opcodes_h_l513_c7_2424_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l513_c7_2424_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l513_c7_2424_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l513_c7_2424_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l513_c7_2424]
signal result_u16_value_MUX_uxn_opcodes_h_l513_c7_2424_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l513_c7_2424_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l513_c7_2424_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l513_c7_2424_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l513_c7_2424]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_2424_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_2424_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_2424_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_2424_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l513_c7_2424]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_2424_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_2424_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_2424_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_2424_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l513_c7_2424]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_2424_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_2424_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_2424_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_2424_return_output : signed(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l513_c7_2424]
signal result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_2424_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_2424_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_2424_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_2424_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l513_c7_2424]
signal result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_2424_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_2424_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_2424_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_2424_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l513_c7_2424]
signal result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_2424_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_2424_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_2424_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_2424_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l513_c7_2424]
signal t8_MUX_uxn_opcodes_h_l513_c7_2424_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l513_c7_2424_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l513_c7_2424_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l513_c7_2424_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l515_c30_5a22]
signal sp_relative_shift_uxn_opcodes_h_l515_c30_5a22_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l515_c30_5a22_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l515_c30_5a22_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l515_c30_5a22_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l519_c9_0c07]
signal BIN_OP_EQ_uxn_opcodes_h_l519_c9_0c07_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l519_c9_0c07_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l519_c9_0c07_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l519_c9_1d4f]
signal MUX_uxn_opcodes_h_l519_c9_1d4f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l519_c9_1d4f_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l519_c9_1d4f_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l519_c9_1d4f_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l520_c42_e243]
signal BIN_OP_MINUS_uxn_opcodes_h_l520_c42_e243_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l520_c42_e243_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l520_c42_e243_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l520_c23_fd84]
signal device_out_uxn_opcodes_h_l520_c23_fd84_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l520_c23_fd84_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l520_c23_fd84_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l520_c23_fd84_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l520_c23_fd84_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l520_c23_fd84_previous_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l520_c23_fd84_return_output : device_out_result_t;

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_75a6( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_device_ram_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.vram_write_layer := ref_toks_6;
      base.device_ram_address := ref_toks_7;
      base.is_vram_write := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l497_c6_5a6d
BIN_OP_EQ_uxn_opcodes_h_l497_c6_5a6d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l497_c6_5a6d_left,
BIN_OP_EQ_uxn_opcodes_h_l497_c6_5a6d_right,
BIN_OP_EQ_uxn_opcodes_h_l497_c6_5a6d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_984d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_984d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_984d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_984d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_984d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_984d_return_output);

-- n8_MUX_uxn_opcodes_h_l497_c2_8e48
n8_MUX_uxn_opcodes_h_l497_c2_8e48 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l497_c2_8e48_cond,
n8_MUX_uxn_opcodes_h_l497_c2_8e48_iftrue,
n8_MUX_uxn_opcodes_h_l497_c2_8e48_iffalse,
n8_MUX_uxn_opcodes_h_l497_c2_8e48_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l497_c2_8e48
device_out_result_MUX_uxn_opcodes_h_l497_c2_8e48 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l497_c2_8e48_cond,
device_out_result_MUX_uxn_opcodes_h_l497_c2_8e48_iftrue,
device_out_result_MUX_uxn_opcodes_h_l497_c2_8e48_iffalse,
device_out_result_MUX_uxn_opcodes_h_l497_c2_8e48_return_output);

-- result_MUX_uxn_opcodes_h_l497_c2_8e48
result_MUX_uxn_opcodes_h_l497_c2_8e48 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l497_c2_8e48_cond,
result_MUX_uxn_opcodes_h_l497_c2_8e48_iftrue,
result_MUX_uxn_opcodes_h_l497_c2_8e48_iffalse,
result_MUX_uxn_opcodes_h_l497_c2_8e48_return_output);

-- t8_MUX_uxn_opcodes_h_l497_c2_8e48
t8_MUX_uxn_opcodes_h_l497_c2_8e48 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l497_c2_8e48_cond,
t8_MUX_uxn_opcodes_h_l497_c2_8e48_iftrue,
t8_MUX_uxn_opcodes_h_l497_c2_8e48_iffalse,
t8_MUX_uxn_opcodes_h_l497_c2_8e48_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l510_c11_7afd
BIN_OP_EQ_uxn_opcodes_h_l510_c11_7afd : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l510_c11_7afd_left,
BIN_OP_EQ_uxn_opcodes_h_l510_c11_7afd_right,
BIN_OP_EQ_uxn_opcodes_h_l510_c11_7afd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_2424
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_2424 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_2424_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_2424_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_2424_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_2424_return_output);

-- n8_MUX_uxn_opcodes_h_l510_c7_984d
n8_MUX_uxn_opcodes_h_l510_c7_984d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l510_c7_984d_cond,
n8_MUX_uxn_opcodes_h_l510_c7_984d_iftrue,
n8_MUX_uxn_opcodes_h_l510_c7_984d_iffalse,
n8_MUX_uxn_opcodes_h_l510_c7_984d_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l510_c7_984d
device_out_result_MUX_uxn_opcodes_h_l510_c7_984d : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l510_c7_984d_cond,
device_out_result_MUX_uxn_opcodes_h_l510_c7_984d_iftrue,
device_out_result_MUX_uxn_opcodes_h_l510_c7_984d_iffalse,
device_out_result_MUX_uxn_opcodes_h_l510_c7_984d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_984d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_984d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_984d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_984d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_984d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_984d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l510_c7_984d
result_u8_value_MUX_uxn_opcodes_h_l510_c7_984d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l510_c7_984d_cond,
result_u8_value_MUX_uxn_opcodes_h_l510_c7_984d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l510_c7_984d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l510_c7_984d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l510_c7_984d
result_u16_value_MUX_uxn_opcodes_h_l510_c7_984d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l510_c7_984d_cond,
result_u16_value_MUX_uxn_opcodes_h_l510_c7_984d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l510_c7_984d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l510_c7_984d_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_984d
result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_984d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_984d_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_984d_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_984d_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_984d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_984d
result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_984d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_984d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_984d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_984d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_984d_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_984d
result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_984d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_984d_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_984d_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_984d_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_984d_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_984d
result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_984d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_984d_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_984d_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_984d_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_984d_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_984d
result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_984d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_984d_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_984d_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_984d_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_984d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_984d
result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_984d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_984d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_984d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_984d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_984d_return_output);

-- t8_MUX_uxn_opcodes_h_l510_c7_984d
t8_MUX_uxn_opcodes_h_l510_c7_984d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l510_c7_984d_cond,
t8_MUX_uxn_opcodes_h_l510_c7_984d_iftrue,
t8_MUX_uxn_opcodes_h_l510_c7_984d_iffalse,
t8_MUX_uxn_opcodes_h_l510_c7_984d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l513_c11_a970
BIN_OP_EQ_uxn_opcodes_h_l513_c11_a970 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l513_c11_a970_left,
BIN_OP_EQ_uxn_opcodes_h_l513_c11_a970_right,
BIN_OP_EQ_uxn_opcodes_h_l513_c11_a970_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_21d8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_21d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_21d8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_21d8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_21d8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_21d8_return_output);

-- n8_MUX_uxn_opcodes_h_l513_c7_2424
n8_MUX_uxn_opcodes_h_l513_c7_2424 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l513_c7_2424_cond,
n8_MUX_uxn_opcodes_h_l513_c7_2424_iftrue,
n8_MUX_uxn_opcodes_h_l513_c7_2424_iffalse,
n8_MUX_uxn_opcodes_h_l513_c7_2424_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l513_c7_2424
device_out_result_MUX_uxn_opcodes_h_l513_c7_2424 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l513_c7_2424_cond,
device_out_result_MUX_uxn_opcodes_h_l513_c7_2424_iftrue,
device_out_result_MUX_uxn_opcodes_h_l513_c7_2424_iffalse,
device_out_result_MUX_uxn_opcodes_h_l513_c7_2424_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l513_c7_2424
result_u8_value_MUX_uxn_opcodes_h_l513_c7_2424 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l513_c7_2424_cond,
result_u8_value_MUX_uxn_opcodes_h_l513_c7_2424_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l513_c7_2424_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l513_c7_2424_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l513_c7_2424
result_u16_value_MUX_uxn_opcodes_h_l513_c7_2424 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l513_c7_2424_cond,
result_u16_value_MUX_uxn_opcodes_h_l513_c7_2424_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l513_c7_2424_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l513_c7_2424_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_2424
result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_2424 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_2424_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_2424_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_2424_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_2424_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_2424
result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_2424 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_2424_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_2424_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_2424_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_2424_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_2424
result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_2424 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_2424_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_2424_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_2424_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_2424_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_2424
result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_2424 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_2424_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_2424_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_2424_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_2424_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_2424
result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_2424 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_2424_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_2424_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_2424_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_2424_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_2424
result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_2424 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_2424_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_2424_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_2424_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_2424_return_output);

-- t8_MUX_uxn_opcodes_h_l513_c7_2424
t8_MUX_uxn_opcodes_h_l513_c7_2424 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l513_c7_2424_cond,
t8_MUX_uxn_opcodes_h_l513_c7_2424_iftrue,
t8_MUX_uxn_opcodes_h_l513_c7_2424_iffalse,
t8_MUX_uxn_opcodes_h_l513_c7_2424_return_output);

-- sp_relative_shift_uxn_opcodes_h_l515_c30_5a22
sp_relative_shift_uxn_opcodes_h_l515_c30_5a22 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l515_c30_5a22_ins,
sp_relative_shift_uxn_opcodes_h_l515_c30_5a22_x,
sp_relative_shift_uxn_opcodes_h_l515_c30_5a22_y,
sp_relative_shift_uxn_opcodes_h_l515_c30_5a22_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l519_c9_0c07
BIN_OP_EQ_uxn_opcodes_h_l519_c9_0c07 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l519_c9_0c07_left,
BIN_OP_EQ_uxn_opcodes_h_l519_c9_0c07_right,
BIN_OP_EQ_uxn_opcodes_h_l519_c9_0c07_return_output);

-- MUX_uxn_opcodes_h_l519_c9_1d4f
MUX_uxn_opcodes_h_l519_c9_1d4f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l519_c9_1d4f_cond,
MUX_uxn_opcodes_h_l519_c9_1d4f_iftrue,
MUX_uxn_opcodes_h_l519_c9_1d4f_iffalse,
MUX_uxn_opcodes_h_l519_c9_1d4f_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l520_c42_e243
BIN_OP_MINUS_uxn_opcodes_h_l520_c42_e243 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l520_c42_e243_left,
BIN_OP_MINUS_uxn_opcodes_h_l520_c42_e243_right,
BIN_OP_MINUS_uxn_opcodes_h_l520_c42_e243_return_output);

-- device_out_uxn_opcodes_h_l520_c23_fd84
device_out_uxn_opcodes_h_l520_c23_fd84 : entity work.device_out_0CLK_1666823b port map (
clk,
device_out_uxn_opcodes_h_l520_c23_fd84_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l520_c23_fd84_device_address,
device_out_uxn_opcodes_h_l520_c23_fd84_value,
device_out_uxn_opcodes_h_l520_c23_fd84_phase,
device_out_uxn_opcodes_h_l520_c23_fd84_previous_device_ram_read,
device_out_uxn_opcodes_h_l520_c23_fd84_previous_ram_read,
device_out_uxn_opcodes_h_l520_c23_fd84_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l497_c6_5a6d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_984d_return_output,
 n8_MUX_uxn_opcodes_h_l497_c2_8e48_return_output,
 device_out_result_MUX_uxn_opcodes_h_l497_c2_8e48_return_output,
 result_MUX_uxn_opcodes_h_l497_c2_8e48_return_output,
 t8_MUX_uxn_opcodes_h_l497_c2_8e48_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l510_c11_7afd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_2424_return_output,
 n8_MUX_uxn_opcodes_h_l510_c7_984d_return_output,
 device_out_result_MUX_uxn_opcodes_h_l510_c7_984d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_984d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l510_c7_984d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l510_c7_984d_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_984d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_984d_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_984d_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_984d_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_984d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_984d_return_output,
 t8_MUX_uxn_opcodes_h_l510_c7_984d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l513_c11_a970_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_21d8_return_output,
 n8_MUX_uxn_opcodes_h_l513_c7_2424_return_output,
 device_out_result_MUX_uxn_opcodes_h_l513_c7_2424_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l513_c7_2424_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l513_c7_2424_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_2424_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_2424_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_2424_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_2424_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_2424_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_2424_return_output,
 t8_MUX_uxn_opcodes_h_l513_c7_2424_return_output,
 sp_relative_shift_uxn_opcodes_h_l515_c30_5a22_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l519_c9_0c07_return_output,
 MUX_uxn_opcodes_h_l519_c9_1d4f_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l520_c42_e243_return_output,
 device_out_uxn_opcodes_h_l520_c23_fd84_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_5a6d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_5a6d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_5a6d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_984d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_984d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_984d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_984d_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l497_c2_8e48_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l497_c2_8e48_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l510_c7_984d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l497_c2_8e48_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l497_c2_8e48_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_8e48_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_8e48_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_984d_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_8e48_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_8e48_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l497_c2_8e48_iftrue : opcode_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l497_c2_8e48_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l497_c2_8e48_iffalse : opcode_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_75a6_uxn_opcodes_h_l497_c2_8e48_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l497_c2_8e48_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l497_c2_8e48_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l497_c2_8e48_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l497_c2_8e48_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l510_c7_984d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l497_c2_8e48_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l497_c2_8e48_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l502_c3_752d : signed(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l507_c3_8d5a : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_7afd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_7afd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_7afd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_2424_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_2424_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_2424_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_2424_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l510_c7_984d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l510_c7_984d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l513_c7_2424_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l510_c7_984d_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_984d_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_984d_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_2424_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_984d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_984d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l511_c3_418f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_984d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l510_c7_984d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_984d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_984d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_984d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_984d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_2424_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_984d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_984d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_984d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_984d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_2424_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_984d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_984d_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_984d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_984d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_2424_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_984d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_984d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_984d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_TRUE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l510_c7_984d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_984d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_2424_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_984d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_984d_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_984d_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_984d_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_2424_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_984d_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_984d_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_984d_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_984d_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_2424_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_984d_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_984d_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_984d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_984d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_2424_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_984d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_984d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_984d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_984d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_2424_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_984d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_984d_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l510_c7_984d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l510_c7_984d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l513_c7_2424_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l510_c7_984d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_a970_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_a970_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_a970_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_21d8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_21d8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_21d8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_21d8_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l513_c7_2424_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l513_c7_2424_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l513_c7_2424_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_2424_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_2424_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_2424_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_2424_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_2424_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_2424_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_2424_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_2424_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_2424_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_2424_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_2424_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_2424_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_2424_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_2424_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_2424_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_2424_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_2424_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l518_c3_9f4c : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_2424_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_2424_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_2424_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_2424_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_2424_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_2424_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_2424_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_2424_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_2424_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_2424_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l513_c7_2424_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l513_c7_2424_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l513_c7_2424_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_5a22_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_5a22_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_5a22_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_5a22_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l519_c9_1d4f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_0c07_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_0c07_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_0c07_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l519_c9_1d4f_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l519_c9_1d4f_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l519_c9_1d4f_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l520_c23_fd84_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l520_c23_fd84_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l520_c23_fd84_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l520_c23_fd84_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l520_c23_fd84_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_e243_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_e243_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_e243_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l520_c23_fd84_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l520_c23_fd84_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l521_c32_7d3f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l522_c31_a44a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l523_c21_d9df_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l524_c22_e224_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l525_c26_714e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l526_c29_455f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l527_c24_09ef_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_584e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_b8fa_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_2746_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_e1c9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_0bce_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_8fa5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_55fd_return_output : unsigned(0 downto 0);
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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_984d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l507_c3_8d5a := resize(to_unsigned(1, 1), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_0c07_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_5a22_y := resize(to_signed(-2, 3), 4);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l518_c3_9f4c := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_2424_iffalse := VAR_result_sp_relative_shift_uxn_opcodes_h_l518_c3_9f4c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_5a6d_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_7afd_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l511_c3_418f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_984d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l511_c3_418f;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_2424_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_a970_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l502_c3_752d := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_e243_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_5a22_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_21d8_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_984d_iffalse := VAR_CLOCK_ENABLE;
     VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_8e48_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_984d_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_2424_iftrue := device_out_result;
     VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_5a22_ins := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l519_c9_1d4f_iffalse := n8;
     VAR_n8_MUX_uxn_opcodes_h_l497_c2_8e48_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l510_c7_984d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l513_c7_2424_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_5a6d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_7afd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_a970_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_0c07_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_e243_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l520_c23_fd84_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_device_out_uxn_opcodes_h_l520_c23_fd84_previous_ram_read := VAR_previous_ram_read;
     VAR_MUX_uxn_opcodes_h_l519_c9_1d4f_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l513_c7_2424_iftrue := VAR_previous_stack_read;
     VAR_device_out_uxn_opcodes_h_l520_c23_fd84_device_address := t8;
     VAR_t8_MUX_uxn_opcodes_h_l497_c2_8e48_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l510_c7_984d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l513_c7_2424_iffalse := t8;
     -- result_sp_relative_shift_TRUE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l510_c7_984d] LATENCY=0
     VAR_result_sp_relative_shift_TRUE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l510_c7_984d_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_584e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_584e_return_output := result.u8_value;

     -- BIN_OP_MINUS[uxn_opcodes_h_l520_c42_e243] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l520_c42_e243_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_e243_left;
     BIN_OP_MINUS_uxn_opcodes_h_l520_c42_e243_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_e243_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_e243_return_output := BIN_OP_MINUS_uxn_opcodes_h_l520_c42_e243_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l497_c6_5a6d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l497_c6_5a6d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_5a6d_left;
     BIN_OP_EQ_uxn_opcodes_h_l497_c6_5a6d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_5a6d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_5a6d_return_output := BIN_OP_EQ_uxn_opcodes_h_l497_c6_5a6d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_2746 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_2746_return_output := result.is_device_ram_write;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l510_c7_984d] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l510_c7_984d_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l513_c11_a970] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l513_c11_a970_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_a970_left;
     BIN_OP_EQ_uxn_opcodes_h_l513_c11_a970_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_a970_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_a970_return_output := BIN_OP_EQ_uxn_opcodes_h_l513_c11_a970_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l510_c11_7afd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l510_c11_7afd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_7afd_left;
     BIN_OP_EQ_uxn_opcodes_h_l510_c11_7afd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_7afd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_7afd_return_output := BIN_OP_EQ_uxn_opcodes_h_l510_c11_7afd_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770[uxn_opcodes_h_l497_c2_8e48] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l497_c2_8e48_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4770(
     result,
     to_unsigned(0, 1),
     VAR_result_sp_relative_shift_uxn_opcodes_h_l502_c3_752d,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l507_c3_8d5a,
     to_unsigned(0, 1));

     -- sp_relative_shift[uxn_opcodes_h_l515_c30_5a22] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l515_c30_5a22_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_5a22_ins;
     sp_relative_shift_uxn_opcodes_h_l515_c30_5a22_x <= VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_5a22_x;
     sp_relative_shift_uxn_opcodes_h_l515_c30_5a22_y <= VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_5a22_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_5a22_return_output := sp_relative_shift_uxn_opcodes_h_l515_c30_5a22_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_55fd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_55fd_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_b8fa LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_b8fa_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_8fa5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_8fa5_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_0bce LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_0bce_return_output := result.device_ram_address;

     -- BIN_OP_EQ[uxn_opcodes_h_l519_c9_0c07] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l519_c9_0c07_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_0c07_left;
     BIN_OP_EQ_uxn_opcodes_h_l519_c9_0c07_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_0c07_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_0c07_return_output := BIN_OP_EQ_uxn_opcodes_h_l519_c9_0c07_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_e1c9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_e1c9_return_output := result.vram_write_layer;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_984d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_5a6d_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_8e48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_5a6d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l497_c2_8e48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_5a6d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l497_c2_8e48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_5a6d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l497_c2_8e48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_5a6d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_2424_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_7afd_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_984d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_7afd_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l510_c7_984d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_7afd_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_984d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_7afd_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_984d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_7afd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_984d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_7afd_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_984d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_7afd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_984d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_7afd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_984d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_7afd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_984d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_7afd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_984d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_7afd_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_984d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_7afd_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l510_c7_984d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_7afd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_21d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_a970_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_2424_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_a970_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l513_c7_2424_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_a970_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_2424_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_a970_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_2424_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_a970_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_2424_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_a970_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_2424_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_a970_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_2424_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_a970_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_2424_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_a970_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_2424_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_a970_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_2424_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_a970_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l513_c7_2424_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_a970_return_output;
     VAR_MUX_uxn_opcodes_h_l519_c9_1d4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_0c07_return_output;
     VAR_device_out_uxn_opcodes_h_l520_c23_fd84_phase := VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_e243_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_984d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_b8fa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_2424_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_b8fa_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_984d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_2746_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_2424_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_2746_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_984d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_55fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_2424_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_55fd_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_984d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_8fa5_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_2424_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_8fa5_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_984d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_e1c9_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_2424_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_e1c9_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_984d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_0bce_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_2424_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_0bce_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_984d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_584e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_2424_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_584e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l497_c2_8e48_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l497_c2_8e48_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_984d_iftrue := VAR_result_sp_relative_shift_TRUE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l510_c7_984d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_984d_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l510_c7_984d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_2424_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_5a22_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l510_c7_984d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_984d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_984d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_984d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_984d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_984d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_984d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_984d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_984d_return_output;

     -- MUX[uxn_opcodes_h_l519_c9_1d4f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l519_c9_1d4f_cond <= VAR_MUX_uxn_opcodes_h_l519_c9_1d4f_cond;
     MUX_uxn_opcodes_h_l519_c9_1d4f_iftrue <= VAR_MUX_uxn_opcodes_h_l519_c9_1d4f_iftrue;
     MUX_uxn_opcodes_h_l519_c9_1d4f_iffalse <= VAR_MUX_uxn_opcodes_h_l519_c9_1d4f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l519_c9_1d4f_return_output := MUX_uxn_opcodes_h_l519_c9_1d4f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l510_c7_984d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_984d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_984d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_984d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_984d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_984d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_984d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_984d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_984d_return_output;

     -- t8_MUX[uxn_opcodes_h_l513_c7_2424] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l513_c7_2424_cond <= VAR_t8_MUX_uxn_opcodes_h_l513_c7_2424_cond;
     t8_MUX_uxn_opcodes_h_l513_c7_2424_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l513_c7_2424_iftrue;
     t8_MUX_uxn_opcodes_h_l513_c7_2424_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l513_c7_2424_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l513_c7_2424_return_output := t8_MUX_uxn_opcodes_h_l513_c7_2424_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l513_c7_2424] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_2424_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_2424_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_2424_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_2424_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_2424_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_2424_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_2424_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_2424_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_2424_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_984d_return_output;
     VAR_device_out_uxn_opcodes_h_l520_c23_fd84_value := VAR_MUX_uxn_opcodes_h_l519_c9_1d4f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l513_c7_2424_iffalse := VAR_MUX_uxn_opcodes_h_l519_c9_1d4f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_984d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_2424_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l510_c7_984d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l513_c7_2424_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l513_c7_2424] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_2424_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_2424_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_2424_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_2424_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_2424_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_2424_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_2424_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_2424_return_output;

     -- t8_MUX[uxn_opcodes_h_l510_c7_984d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l510_c7_984d_cond <= VAR_t8_MUX_uxn_opcodes_h_l510_c7_984d_cond;
     t8_MUX_uxn_opcodes_h_l510_c7_984d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l510_c7_984d_iftrue;
     t8_MUX_uxn_opcodes_h_l510_c7_984d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l510_c7_984d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l510_c7_984d_return_output := t8_MUX_uxn_opcodes_h_l510_c7_984d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l510_c7_984d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_984d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_984d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_984d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_984d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_984d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_984d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_984d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_984d_return_output;

     -- n8_MUX[uxn_opcodes_h_l513_c7_2424] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l513_c7_2424_cond <= VAR_n8_MUX_uxn_opcodes_h_l513_c7_2424_cond;
     n8_MUX_uxn_opcodes_h_l513_c7_2424_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l513_c7_2424_iftrue;
     n8_MUX_uxn_opcodes_h_l513_c7_2424_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l513_c7_2424_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l513_c7_2424_return_output := n8_MUX_uxn_opcodes_h_l513_c7_2424_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_21d8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_2424_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l510_c7_984d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l513_c7_2424_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l497_c2_8e48_iffalse := VAR_t8_MUX_uxn_opcodes_h_l510_c7_984d_return_output;
     -- t8_MUX[uxn_opcodes_h_l497_c2_8e48] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l497_c2_8e48_cond <= VAR_t8_MUX_uxn_opcodes_h_l497_c2_8e48_cond;
     t8_MUX_uxn_opcodes_h_l497_c2_8e48_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l497_c2_8e48_iftrue;
     t8_MUX_uxn_opcodes_h_l497_c2_8e48_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l497_c2_8e48_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l497_c2_8e48_return_output := t8_MUX_uxn_opcodes_h_l497_c2_8e48_return_output;

     -- n8_MUX[uxn_opcodes_h_l510_c7_984d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l510_c7_984d_cond <= VAR_n8_MUX_uxn_opcodes_h_l510_c7_984d_cond;
     n8_MUX_uxn_opcodes_h_l510_c7_984d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l510_c7_984d_iftrue;
     n8_MUX_uxn_opcodes_h_l510_c7_984d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l510_c7_984d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l510_c7_984d_return_output := n8_MUX_uxn_opcodes_h_l510_c7_984d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l517_c1_21d8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_21d8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_21d8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_21d8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_21d8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_21d8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_21d8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_21d8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_21d8_return_output;

     -- Submodule level 4
     VAR_device_out_uxn_opcodes_h_l520_c23_fd84_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_21d8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l497_c2_8e48_iffalse := VAR_n8_MUX_uxn_opcodes_h_l510_c7_984d_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l497_c2_8e48_return_output;
     -- n8_MUX[uxn_opcodes_h_l497_c2_8e48] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l497_c2_8e48_cond <= VAR_n8_MUX_uxn_opcodes_h_l497_c2_8e48_cond;
     n8_MUX_uxn_opcodes_h_l497_c2_8e48_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l497_c2_8e48_iftrue;
     n8_MUX_uxn_opcodes_h_l497_c2_8e48_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l497_c2_8e48_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l497_c2_8e48_return_output := n8_MUX_uxn_opcodes_h_l497_c2_8e48_return_output;

     -- device_out[uxn_opcodes_h_l520_c23_fd84] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l520_c23_fd84_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l520_c23_fd84_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l520_c23_fd84_device_address <= VAR_device_out_uxn_opcodes_h_l520_c23_fd84_device_address;
     device_out_uxn_opcodes_h_l520_c23_fd84_value <= VAR_device_out_uxn_opcodes_h_l520_c23_fd84_value;
     device_out_uxn_opcodes_h_l520_c23_fd84_phase <= VAR_device_out_uxn_opcodes_h_l520_c23_fd84_phase;
     device_out_uxn_opcodes_h_l520_c23_fd84_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l520_c23_fd84_previous_device_ram_read;
     device_out_uxn_opcodes_h_l520_c23_fd84_previous_ram_read <= VAR_device_out_uxn_opcodes_h_l520_c23_fd84_previous_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l520_c23_fd84_return_output := device_out_uxn_opcodes_h_l520_c23_fd84_return_output;

     -- Submodule level 5
     VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_2424_iffalse := VAR_device_out_uxn_opcodes_h_l520_c23_fd84_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l497_c2_8e48_return_output;
     -- device_out_result_MUX[uxn_opcodes_h_l513_c7_2424] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l513_c7_2424_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_2424_cond;
     device_out_result_MUX_uxn_opcodes_h_l513_c7_2424_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_2424_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l513_c7_2424_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_2424_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_2424_return_output := device_out_result_MUX_uxn_opcodes_h_l513_c7_2424_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_opcodes_h_l523_c21_d9df] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l523_c21_d9df_return_output := VAR_device_out_uxn_opcodes_h_l520_c23_fd84_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l525_c26_714e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l525_c26_714e_return_output := VAR_device_out_uxn_opcodes_h_l520_c23_fd84_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_opcodes_h_l526_c29_455f] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l526_c29_455f_return_output := VAR_device_out_uxn_opcodes_h_l520_c23_fd84_return_output.vram_write_layer;

     -- CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d[uxn_opcodes_h_l524_c22_e224] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l524_c22_e224_return_output := VAR_device_out_uxn_opcodes_h_l520_c23_fd84_return_output.u16_addr;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l522_c31_a44a] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l522_c31_a44a_return_output := VAR_device_out_uxn_opcodes_h_l520_c23_fd84_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l521_c32_7d3f] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l521_c32_7d3f_return_output := VAR_device_out_uxn_opcodes_h_l520_c23_fd84_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d[uxn_opcodes_h_l527_c24_09ef] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l527_c24_09ef_return_output := VAR_device_out_uxn_opcodes_h_l520_c23_fd84_return_output.is_deo_done;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_2424_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l524_c22_e224_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_2424_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l527_c24_09ef_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_2424_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l521_c32_7d3f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_2424_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l525_c26_714e_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_2424_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l526_c29_455f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_2424_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l522_c31_a44a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_2424_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l523_c21_d9df_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_984d_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_2424_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l513_c7_2424] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l513_c7_2424_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_2424_cond;
     result_u16_value_MUX_uxn_opcodes_h_l513_c7_2424_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_2424_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l513_c7_2424_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_2424_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_2424_return_output := result_u16_value_MUX_uxn_opcodes_h_l513_c7_2424_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l513_c7_2424] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l513_c7_2424_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_2424_cond;
     result_u8_value_MUX_uxn_opcodes_h_l513_c7_2424_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_2424_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l513_c7_2424_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_2424_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_2424_return_output := result_u8_value_MUX_uxn_opcodes_h_l513_c7_2424_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l513_c7_2424] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_2424_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_2424_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_2424_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_2424_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_2424_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_2424_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_2424_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_2424_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l513_c7_2424] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_2424_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_2424_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_2424_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_2424_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_2424_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_2424_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_2424_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_2424_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l513_c7_2424] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_2424_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_2424_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_2424_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_2424_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_2424_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_2424_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_2424_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_2424_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l510_c7_984d] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l510_c7_984d_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_984d_cond;
     device_out_result_MUX_uxn_opcodes_h_l510_c7_984d_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_984d_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l510_c7_984d_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_984d_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_984d_return_output := device_out_result_MUX_uxn_opcodes_h_l510_c7_984d_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l513_c7_2424] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_2424_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_2424_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_2424_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_2424_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_2424_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_2424_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_2424_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_2424_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l513_c7_2424] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_2424_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_2424_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_2424_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_2424_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_2424_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_2424_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_2424_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_2424_return_output;

     -- Submodule level 7
     VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_8e48_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_984d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_984d_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_2424_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_984d_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_2424_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_984d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_2424_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_984d_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_2424_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_984d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_2424_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_984d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_2424_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_984d_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_2424_return_output;
     -- result_vram_write_layer_MUX[uxn_opcodes_h_l510_c7_984d] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_984d_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_984d_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_984d_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_984d_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_984d_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_984d_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_984d_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_984d_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l497_c2_8e48] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l497_c2_8e48_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_8e48_cond;
     device_out_result_MUX_uxn_opcodes_h_l497_c2_8e48_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_8e48_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l497_c2_8e48_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_8e48_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_8e48_return_output := device_out_result_MUX_uxn_opcodes_h_l497_c2_8e48_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l510_c7_984d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l510_c7_984d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_984d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l510_c7_984d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_984d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l510_c7_984d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_984d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_984d_return_output := result_u8_value_MUX_uxn_opcodes_h_l510_c7_984d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l510_c7_984d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l510_c7_984d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_984d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l510_c7_984d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_984d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l510_c7_984d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_984d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_984d_return_output := result_u16_value_MUX_uxn_opcodes_h_l510_c7_984d_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l510_c7_984d] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_984d_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_984d_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_984d_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_984d_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_984d_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_984d_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_984d_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_984d_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l510_c7_984d] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_984d_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_984d_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_984d_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_984d_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_984d_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_984d_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_984d_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_984d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l510_c7_984d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_984d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_984d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_984d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_984d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_984d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_984d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_984d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_984d_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l510_c7_984d] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_984d_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_984d_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_984d_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_984d_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_984d_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_984d_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_984d_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_984d_return_output;

     -- Submodule level 8
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_8e48_return_output;
     -- result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_75a6[uxn_opcodes_h_l497_c2_8e48] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_75a6_uxn_opcodes_h_l497_c2_8e48_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_75a6(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_984d_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_984d_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_984d_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_984d_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_984d_return_output,
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_984d_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_984d_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_984d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_984d_return_output);

     -- Submodule level 9
     VAR_result_MUX_uxn_opcodes_h_l497_c2_8e48_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_75a6_uxn_opcodes_h_l497_c2_8e48_return_output;
     -- result_MUX[uxn_opcodes_h_l497_c2_8e48] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l497_c2_8e48_cond <= VAR_result_MUX_uxn_opcodes_h_l497_c2_8e48_cond;
     result_MUX_uxn_opcodes_h_l497_c2_8e48_iftrue <= VAR_result_MUX_uxn_opcodes_h_l497_c2_8e48_iftrue;
     result_MUX_uxn_opcodes_h_l497_c2_8e48_iffalse <= VAR_result_MUX_uxn_opcodes_h_l497_c2_8e48_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l497_c2_8e48_return_output := result_MUX_uxn_opcodes_h_l497_c2_8e48_return_output;

     -- Submodule level 10
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l497_c2_8e48_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l497_c2_8e48_return_output;
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
