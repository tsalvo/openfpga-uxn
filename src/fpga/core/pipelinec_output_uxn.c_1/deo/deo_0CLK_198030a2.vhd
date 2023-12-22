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
entity deo_0CLK_198030a2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo_0CLK_198030a2;
architecture arch of deo_0CLK_198030a2 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l514_c6_1c58]
signal BIN_OP_EQ_uxn_opcodes_h_l514_c6_1c58_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l514_c6_1c58_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l514_c6_1c58_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l527_c7_0802]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_0802_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_0802_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_0802_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_0802_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l514_c2_cd9a]
signal t8_MUX_uxn_opcodes_h_l514_c2_cd9a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l514_c2_cd9a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l514_c2_cd9a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l514_c2_cd9a_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_h_l514_c2_cd9a]
signal result_MUX_uxn_opcodes_h_l514_c2_cd9a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l514_c2_cd9a_iftrue : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l514_c2_cd9a_iffalse : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l514_c2_cd9a_return_output : opcode_result_t;

-- n8_MUX[uxn_opcodes_h_l514_c2_cd9a]
signal n8_MUX_uxn_opcodes_h_l514_c2_cd9a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l514_c2_cd9a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l514_c2_cd9a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l514_c2_cd9a_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l514_c2_cd9a]
signal device_out_result_MUX_uxn_opcodes_h_l514_c2_cd9a_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l514_c2_cd9a_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l514_c2_cd9a_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l514_c2_cd9a_return_output : device_out_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l527_c11_24b3]
signal BIN_OP_EQ_uxn_opcodes_h_l527_c11_24b3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l527_c11_24b3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l527_c11_24b3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l530_c7_dbf8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_dbf8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l527_c7_0802]
signal t8_MUX_uxn_opcodes_h_l527_c7_0802_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l527_c7_0802_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l527_c7_0802_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l527_c7_0802_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l527_c7_0802]
signal result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_0802_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_0802_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_0802_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_0802_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l527_c7_0802]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_0802_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_0802_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_0802_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_0802_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l527_c7_0802]
signal result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_0802_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_0802_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_0802_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_0802_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l527_c7_0802]
signal result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_0802_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_0802_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_0802_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_0802_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l527_c7_0802]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_0802_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_0802_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_0802_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_0802_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l527_c7_0802]
signal result_u8_value_MUX_uxn_opcodes_h_l527_c7_0802_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l527_c7_0802_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l527_c7_0802_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l527_c7_0802_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l527_c7_0802]
signal result_u16_value_MUX_uxn_opcodes_h_l527_c7_0802_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l527_c7_0802_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l527_c7_0802_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l527_c7_0802_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l527_c7_0802]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_0802_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_0802_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_0802_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_0802_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l527_c7_0802]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_0802_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_0802_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_0802_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_0802_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l527_c7_0802]
signal n8_MUX_uxn_opcodes_h_l527_c7_0802_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l527_c7_0802_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l527_c7_0802_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l527_c7_0802_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l527_c7_0802]
signal device_out_result_MUX_uxn_opcodes_h_l527_c7_0802_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l527_c7_0802_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l527_c7_0802_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l527_c7_0802_return_output : device_out_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l530_c11_f744]
signal BIN_OP_EQ_uxn_opcodes_h_l530_c11_f744_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l530_c11_f744_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l530_c11_f744_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l534_c1_4804]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_4804_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_4804_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_4804_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_4804_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l530_c7_dbf8]
signal t8_MUX_uxn_opcodes_h_l530_c7_dbf8_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l530_c7_dbf8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_dbf8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l530_c7_dbf8]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_dbf8_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l530_c7_dbf8]
signal result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_dbf8_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l530_c7_dbf8]
signal result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_dbf8_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l530_c7_dbf8]
signal result_u8_value_MUX_uxn_opcodes_h_l530_c7_dbf8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l530_c7_dbf8]
signal result_u16_value_MUX_uxn_opcodes_h_l530_c7_dbf8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l530_c7_dbf8]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_dbf8_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l530_c7_dbf8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_dbf8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l530_c7_dbf8]
signal n8_MUX_uxn_opcodes_h_l530_c7_dbf8_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l530_c7_dbf8]
signal device_out_result_MUX_uxn_opcodes_h_l530_c7_dbf8_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output : device_out_result_t;

-- sp_relative_shift[uxn_opcodes_h_l532_c30_959f]
signal sp_relative_shift_uxn_opcodes_h_l532_c30_959f_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l532_c30_959f_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l532_c30_959f_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l532_c30_959f_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l536_c9_ddd7]
signal BIN_OP_EQ_uxn_opcodes_h_l536_c9_ddd7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l536_c9_ddd7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l536_c9_ddd7_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l536_c9_f90b]
signal MUX_uxn_opcodes_h_l536_c9_f90b_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l536_c9_f90b_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l536_c9_f90b_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l536_c9_f90b_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l537_c42_ea06]
signal BIN_OP_MINUS_uxn_opcodes_h_l537_c42_ea06_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l537_c42_ea06_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l537_c42_ea06_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l537_c23_6d8e]
signal device_out_uxn_opcodes_h_l537_c23_6d8e_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l537_c23_6d8e_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l537_c23_6d8e_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l537_c23_6d8e_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l537_c23_6d8e_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l537_c23_6d8e_previous_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l537_c23_6d8e_return_output : device_out_result_t;

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_82d1( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.vram_write_layer := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.device_ram_address := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.u8_value := ref_toks_6;
      base.u16_value := ref_toks_7;
      base.is_device_ram_write := ref_toks_8;
      base.sp_relative_shift := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l514_c6_1c58
BIN_OP_EQ_uxn_opcodes_h_l514_c6_1c58 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l514_c6_1c58_left,
BIN_OP_EQ_uxn_opcodes_h_l514_c6_1c58_right,
BIN_OP_EQ_uxn_opcodes_h_l514_c6_1c58_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_0802
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_0802 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_0802_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_0802_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_0802_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_0802_return_output);

-- t8_MUX_uxn_opcodes_h_l514_c2_cd9a
t8_MUX_uxn_opcodes_h_l514_c2_cd9a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l514_c2_cd9a_cond,
t8_MUX_uxn_opcodes_h_l514_c2_cd9a_iftrue,
t8_MUX_uxn_opcodes_h_l514_c2_cd9a_iffalse,
t8_MUX_uxn_opcodes_h_l514_c2_cd9a_return_output);

-- result_MUX_uxn_opcodes_h_l514_c2_cd9a
result_MUX_uxn_opcodes_h_l514_c2_cd9a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l514_c2_cd9a_cond,
result_MUX_uxn_opcodes_h_l514_c2_cd9a_iftrue,
result_MUX_uxn_opcodes_h_l514_c2_cd9a_iffalse,
result_MUX_uxn_opcodes_h_l514_c2_cd9a_return_output);

-- n8_MUX_uxn_opcodes_h_l514_c2_cd9a
n8_MUX_uxn_opcodes_h_l514_c2_cd9a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l514_c2_cd9a_cond,
n8_MUX_uxn_opcodes_h_l514_c2_cd9a_iftrue,
n8_MUX_uxn_opcodes_h_l514_c2_cd9a_iffalse,
n8_MUX_uxn_opcodes_h_l514_c2_cd9a_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l514_c2_cd9a
device_out_result_MUX_uxn_opcodes_h_l514_c2_cd9a : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l514_c2_cd9a_cond,
device_out_result_MUX_uxn_opcodes_h_l514_c2_cd9a_iftrue,
device_out_result_MUX_uxn_opcodes_h_l514_c2_cd9a_iffalse,
device_out_result_MUX_uxn_opcodes_h_l514_c2_cd9a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l527_c11_24b3
BIN_OP_EQ_uxn_opcodes_h_l527_c11_24b3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l527_c11_24b3_left,
BIN_OP_EQ_uxn_opcodes_h_l527_c11_24b3_right,
BIN_OP_EQ_uxn_opcodes_h_l527_c11_24b3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_dbf8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_dbf8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_dbf8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output);

-- t8_MUX_uxn_opcodes_h_l527_c7_0802
t8_MUX_uxn_opcodes_h_l527_c7_0802 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l527_c7_0802_cond,
t8_MUX_uxn_opcodes_h_l527_c7_0802_iftrue,
t8_MUX_uxn_opcodes_h_l527_c7_0802_iffalse,
t8_MUX_uxn_opcodes_h_l527_c7_0802_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_0802
result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_0802 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_0802_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_0802_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_0802_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_0802_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_0802
result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_0802 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_0802_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_0802_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_0802_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_0802_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_0802
result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_0802 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_0802_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_0802_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_0802_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_0802_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_0802
result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_0802 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_0802_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_0802_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_0802_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_0802_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_0802
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_0802 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_0802_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_0802_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_0802_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_0802_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l527_c7_0802
result_u8_value_MUX_uxn_opcodes_h_l527_c7_0802 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l527_c7_0802_cond,
result_u8_value_MUX_uxn_opcodes_h_l527_c7_0802_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l527_c7_0802_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l527_c7_0802_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l527_c7_0802
result_u16_value_MUX_uxn_opcodes_h_l527_c7_0802 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l527_c7_0802_cond,
result_u16_value_MUX_uxn_opcodes_h_l527_c7_0802_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l527_c7_0802_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l527_c7_0802_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_0802
result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_0802 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_0802_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_0802_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_0802_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_0802_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_0802
result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_0802 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_0802_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_0802_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_0802_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_0802_return_output);

-- n8_MUX_uxn_opcodes_h_l527_c7_0802
n8_MUX_uxn_opcodes_h_l527_c7_0802 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l527_c7_0802_cond,
n8_MUX_uxn_opcodes_h_l527_c7_0802_iftrue,
n8_MUX_uxn_opcodes_h_l527_c7_0802_iffalse,
n8_MUX_uxn_opcodes_h_l527_c7_0802_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l527_c7_0802
device_out_result_MUX_uxn_opcodes_h_l527_c7_0802 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l527_c7_0802_cond,
device_out_result_MUX_uxn_opcodes_h_l527_c7_0802_iftrue,
device_out_result_MUX_uxn_opcodes_h_l527_c7_0802_iffalse,
device_out_result_MUX_uxn_opcodes_h_l527_c7_0802_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l530_c11_f744
BIN_OP_EQ_uxn_opcodes_h_l530_c11_f744 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l530_c11_f744_left,
BIN_OP_EQ_uxn_opcodes_h_l530_c11_f744_right,
BIN_OP_EQ_uxn_opcodes_h_l530_c11_f744_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_4804
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_4804 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_4804_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_4804_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_4804_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_4804_return_output);

-- t8_MUX_uxn_opcodes_h_l530_c7_dbf8
t8_MUX_uxn_opcodes_h_l530_c7_dbf8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l530_c7_dbf8_cond,
t8_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue,
t8_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse,
t8_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_dbf8
result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_dbf8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_dbf8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_dbf8
result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_dbf8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_dbf8_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_dbf8
result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_dbf8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_dbf8_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_dbf8
result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_dbf8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_dbf8_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l530_c7_dbf8
result_u8_value_MUX_uxn_opcodes_h_l530_c7_dbf8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l530_c7_dbf8_cond,
result_u8_value_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l530_c7_dbf8
result_u16_value_MUX_uxn_opcodes_h_l530_c7_dbf8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l530_c7_dbf8_cond,
result_u16_value_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_dbf8
result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_dbf8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_dbf8_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_dbf8
result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_dbf8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_dbf8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output);

-- n8_MUX_uxn_opcodes_h_l530_c7_dbf8
n8_MUX_uxn_opcodes_h_l530_c7_dbf8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l530_c7_dbf8_cond,
n8_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue,
n8_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse,
n8_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l530_c7_dbf8
device_out_result_MUX_uxn_opcodes_h_l530_c7_dbf8 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l530_c7_dbf8_cond,
device_out_result_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue,
device_out_result_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse,
device_out_result_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output);

-- sp_relative_shift_uxn_opcodes_h_l532_c30_959f
sp_relative_shift_uxn_opcodes_h_l532_c30_959f : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l532_c30_959f_ins,
sp_relative_shift_uxn_opcodes_h_l532_c30_959f_x,
sp_relative_shift_uxn_opcodes_h_l532_c30_959f_y,
sp_relative_shift_uxn_opcodes_h_l532_c30_959f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l536_c9_ddd7
BIN_OP_EQ_uxn_opcodes_h_l536_c9_ddd7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l536_c9_ddd7_left,
BIN_OP_EQ_uxn_opcodes_h_l536_c9_ddd7_right,
BIN_OP_EQ_uxn_opcodes_h_l536_c9_ddd7_return_output);

-- MUX_uxn_opcodes_h_l536_c9_f90b
MUX_uxn_opcodes_h_l536_c9_f90b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l536_c9_f90b_cond,
MUX_uxn_opcodes_h_l536_c9_f90b_iftrue,
MUX_uxn_opcodes_h_l536_c9_f90b_iffalse,
MUX_uxn_opcodes_h_l536_c9_f90b_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l537_c42_ea06
BIN_OP_MINUS_uxn_opcodes_h_l537_c42_ea06 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l537_c42_ea06_left,
BIN_OP_MINUS_uxn_opcodes_h_l537_c42_ea06_right,
BIN_OP_MINUS_uxn_opcodes_h_l537_c42_ea06_return_output);

-- device_out_uxn_opcodes_h_l537_c23_6d8e
device_out_uxn_opcodes_h_l537_c23_6d8e : entity work.device_out_0CLK_6ed52cc1 port map (
clk,
device_out_uxn_opcodes_h_l537_c23_6d8e_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l537_c23_6d8e_device_address,
device_out_uxn_opcodes_h_l537_c23_6d8e_value,
device_out_uxn_opcodes_h_l537_c23_6d8e_phase,
device_out_uxn_opcodes_h_l537_c23_6d8e_previous_device_ram_read,
device_out_uxn_opcodes_h_l537_c23_6d8e_previous_ram_read,
device_out_uxn_opcodes_h_l537_c23_6d8e_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l514_c6_1c58_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_0802_return_output,
 t8_MUX_uxn_opcodes_h_l514_c2_cd9a_return_output,
 result_MUX_uxn_opcodes_h_l514_c2_cd9a_return_output,
 n8_MUX_uxn_opcodes_h_l514_c2_cd9a_return_output,
 device_out_result_MUX_uxn_opcodes_h_l514_c2_cd9a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l527_c11_24b3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output,
 t8_MUX_uxn_opcodes_h_l527_c7_0802_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_0802_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_0802_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_0802_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_0802_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_0802_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l527_c7_0802_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l527_c7_0802_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_0802_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_0802_return_output,
 n8_MUX_uxn_opcodes_h_l527_c7_0802_return_output,
 device_out_result_MUX_uxn_opcodes_h_l527_c7_0802_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l530_c11_f744_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_4804_return_output,
 t8_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output,
 n8_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output,
 device_out_result_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output,
 sp_relative_shift_uxn_opcodes_h_l532_c30_959f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l536_c9_ddd7_return_output,
 MUX_uxn_opcodes_h_l536_c9_f90b_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l537_c42_ea06_return_output,
 device_out_uxn_opcodes_h_l537_c23_6d8e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c6_1c58_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c6_1c58_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c6_1c58_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_0802_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_0802_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_0802_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_0802_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l514_c2_cd9a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l514_c2_cd9a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l527_c7_0802_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l514_c2_cd9a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l514_c2_cd9a_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l514_c2_cd9a_iftrue : opcode_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l514_c2_cd9a_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l514_c2_cd9a_iffalse : opcode_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_82d1_uxn_opcodes_h_l514_c2_cd9a_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l514_c2_cd9a_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l514_c2_cd9a_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l514_c2_cd9a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l514_c2_cd9a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l527_c7_0802_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l514_c2_cd9a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l514_c2_cd9a_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l514_c2_cd9a_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l514_c2_cd9a_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_0802_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l514_c2_cd9a_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l514_c2_cd9a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l519_c3_be25 : signed(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l524_c3_3104 : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_24b3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_24b3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_24b3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_dbf8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l527_c7_0802_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l527_c7_0802_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l527_c7_0802_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_0802_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_0802_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_0802_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_0802_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_0802_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_0802_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_0802_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_0802_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_0802_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_0802_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_0802_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_0802_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_0802_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_0802_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_0802_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_0802_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_0802_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l528_c3_5e23 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_0802_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l527_c7_0802_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_0802_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_0802_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_0802_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_0802_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_0802_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_0802_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l527_c7_0802_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l527_c7_0802_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l527_c7_0802_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l527_c7_0802_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_0802_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_0802_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_0802_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_0802_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_0802_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_TRUE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l527_c7_0802_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_0802_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_0802_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_0802_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l527_c7_0802_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l527_c7_0802_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l527_c7_0802_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_0802_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_0802_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_0802_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_f744_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_f744_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_f744_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_4804_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_4804_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_4804_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_4804_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l530_c7_dbf8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_dbf8_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_dbf8_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_dbf8_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_dbf8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_dbf8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l530_c7_dbf8_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_dbf8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l535_c3_0c39 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_dbf8_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l530_c7_dbf8_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_dbf8_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l532_c30_959f_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l532_c30_959f_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l532_c30_959f_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l532_c30_959f_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l536_c9_f90b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l536_c9_ddd7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l536_c9_ddd7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l536_c9_ddd7_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l536_c9_f90b_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l536_c9_f90b_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l536_c9_f90b_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l537_c23_6d8e_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l537_c23_6d8e_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l537_c23_6d8e_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l537_c23_6d8e_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l537_c23_6d8e_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l537_c42_ea06_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l537_c42_ea06_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l537_c42_ea06_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l537_c23_6d8e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l537_c23_6d8e_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l538_c32_7e33_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l539_c31_a1dd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l540_c21_1937_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l541_c22_c152_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l542_c26_708d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l543_c29_ccc9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l544_c24_e34f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_d3ff_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_5750_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_0485_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_ef1e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_e066_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_6d80_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_ef92_return_output : unsigned(0 downto 0);
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l536_c9_ddd7_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_f744_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l532_c30_959f_y := resize(to_signed(-2, 3), 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_0802_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c6_1c58_right := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l537_c42_ea06_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l528_c3_5e23 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_0802_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l528_c3_5e23;
     VAR_sp_relative_shift_uxn_opcodes_h_l532_c30_959f_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_4804_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l519_c3_be25 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_24b3_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l524_c3_3104 := resize(to_unsigned(1, 1), 4);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l535_c3_0c39 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse := VAR_result_sp_relative_shift_uxn_opcodes_h_l535_c3_0c39;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_0802_iffalse := VAR_CLOCK_ENABLE;
     VAR_device_out_result_MUX_uxn_opcodes_h_l514_c2_cd9a_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_0802_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue := device_out_result;
     VAR_sp_relative_shift_uxn_opcodes_h_l532_c30_959f_ins := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l536_c9_f90b_iffalse := n8;
     VAR_n8_MUX_uxn_opcodes_h_l514_c2_cd9a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l527_c7_0802_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c6_1c58_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_24b3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_f744_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l536_c9_ddd7_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l537_c42_ea06_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l537_c23_6d8e_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_device_out_uxn_opcodes_h_l537_c23_6d8e_previous_ram_read := VAR_previous_ram_read;
     VAR_MUX_uxn_opcodes_h_l536_c9_f90b_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue := VAR_previous_stack_read;
     VAR_device_out_uxn_opcodes_h_l537_c23_6d8e_device_address := t8;
     VAR_t8_MUX_uxn_opcodes_h_l514_c2_cd9a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l527_c7_0802_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse := t8;
     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l527_c7_0802] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l527_c7_0802_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_d3ff LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_d3ff_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l514_c6_1c58] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l514_c6_1c58_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c6_1c58_left;
     BIN_OP_EQ_uxn_opcodes_h_l514_c6_1c58_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c6_1c58_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c6_1c58_return_output := BIN_OP_EQ_uxn_opcodes_h_l514_c6_1c58_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_5750 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_5750_return_output := result.vram_write_layer;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_ef1e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_ef1e_return_output := result.device_ram_address;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770[uxn_opcodes_h_l514_c2_cd9a] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l514_c2_cd9a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4770(
     result,
     to_unsigned(0, 1),
     VAR_result_sp_relative_shift_uxn_opcodes_h_l519_c3_be25,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l524_c3_3104,
     to_unsigned(0, 1));

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_e066 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_e066_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l530_c11_f744] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l530_c11_f744_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_f744_left;
     BIN_OP_EQ_uxn_opcodes_h_l530_c11_f744_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_f744_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_f744_return_output := BIN_OP_EQ_uxn_opcodes_h_l530_c11_f744_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l537_c42_ea06] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l537_c42_ea06_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l537_c42_ea06_left;
     BIN_OP_MINUS_uxn_opcodes_h_l537_c42_ea06_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l537_c42_ea06_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l537_c42_ea06_return_output := BIN_OP_MINUS_uxn_opcodes_h_l537_c42_ea06_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_0485 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_0485_return_output := result.is_vram_write;

     -- sp_relative_shift[uxn_opcodes_h_l532_c30_959f] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l532_c30_959f_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l532_c30_959f_ins;
     sp_relative_shift_uxn_opcodes_h_l532_c30_959f_x <= VAR_sp_relative_shift_uxn_opcodes_h_l532_c30_959f_x;
     sp_relative_shift_uxn_opcodes_h_l532_c30_959f_y <= VAR_sp_relative_shift_uxn_opcodes_h_l532_c30_959f_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l532_c30_959f_return_output := sp_relative_shift_uxn_opcodes_h_l532_c30_959f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l536_c9_ddd7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l536_c9_ddd7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l536_c9_ddd7_left;
     BIN_OP_EQ_uxn_opcodes_h_l536_c9_ddd7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l536_c9_ddd7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l536_c9_ddd7_return_output := BIN_OP_EQ_uxn_opcodes_h_l536_c9_ddd7_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_6d80 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_6d80_return_output := result.u16_value;

     -- result_sp_relative_shift_TRUE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l527_c7_0802] LATENCY=0
     VAR_result_sp_relative_shift_TRUE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l527_c7_0802_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l527_c11_24b3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l527_c11_24b3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_24b3_left;
     BIN_OP_EQ_uxn_opcodes_h_l527_c11_24b3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_24b3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_24b3_return_output := BIN_OP_EQ_uxn_opcodes_h_l527_c11_24b3_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_ef92 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_ef92_return_output := result.is_device_ram_write;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_0802_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c6_1c58_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l514_c2_cd9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c6_1c58_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l514_c2_cd9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c6_1c58_return_output;
     VAR_result_MUX_uxn_opcodes_h_l514_c2_cd9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c6_1c58_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l514_c2_cd9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c6_1c58_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_dbf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_24b3_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_0802_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_24b3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l527_c7_0802_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_24b3_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_0802_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_24b3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_0802_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_24b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_0802_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_24b3_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_0802_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_24b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_0802_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_24b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_0802_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_24b3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l527_c7_0802_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_24b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_0802_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_24b3_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_0802_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_24b3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l527_c7_0802_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_24b3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_4804_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_f744_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_dbf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_f744_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l530_c7_dbf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_f744_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_dbf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_f744_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_dbf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_f744_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_dbf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_f744_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_dbf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_f744_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_dbf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_f744_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l530_c7_dbf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_f744_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_dbf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_f744_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_dbf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_f744_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l530_c7_dbf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_f744_return_output;
     VAR_MUX_uxn_opcodes_h_l536_c9_f90b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l536_c9_ddd7_return_output;
     VAR_device_out_uxn_opcodes_h_l537_c23_6d8e_phase := VAR_BIN_OP_MINUS_uxn_opcodes_h_l537_c42_ea06_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l527_c7_0802_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_6d80_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_6d80_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_0802_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_ef92_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_ef92_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_0802_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_d3ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_d3ff_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_0802_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_0485_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_0485_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_0802_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_5750_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_5750_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_0802_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_ef1e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_ef1e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_0802_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_e066_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_e066_return_output;
     VAR_result_MUX_uxn_opcodes_h_l514_c2_cd9a_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l514_c2_cd9a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_0802_iftrue := VAR_result_sp_relative_shift_TRUE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l527_c7_0802_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_0802_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l527_c7_0802_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l532_c30_959f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l527_c7_0802] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_0802_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_0802_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_0802_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_0802_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_0802_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_0802_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_0802_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_0802_return_output;

     -- t8_MUX[uxn_opcodes_h_l530_c7_dbf8] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l530_c7_dbf8_cond <= VAR_t8_MUX_uxn_opcodes_h_l530_c7_dbf8_cond;
     t8_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue;
     t8_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output := t8_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l527_c7_0802] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_0802_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_0802_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_0802_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_0802_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_0802_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_0802_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_0802_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_0802_return_output;

     -- MUX[uxn_opcodes_h_l536_c9_f90b] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l536_c9_f90b_cond <= VAR_MUX_uxn_opcodes_h_l536_c9_f90b_cond;
     MUX_uxn_opcodes_h_l536_c9_f90b_iftrue <= VAR_MUX_uxn_opcodes_h_l536_c9_f90b_iftrue;
     MUX_uxn_opcodes_h_l536_c9_f90b_iffalse <= VAR_MUX_uxn_opcodes_h_l536_c9_f90b_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l536_c9_f90b_return_output := MUX_uxn_opcodes_h_l536_c9_f90b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l530_c7_dbf8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_dbf8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_dbf8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_0802_return_output;
     VAR_device_out_uxn_opcodes_h_l537_c23_6d8e_value := VAR_MUX_uxn_opcodes_h_l536_c9_f90b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse := VAR_MUX_uxn_opcodes_h_l536_c9_f90b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_0802_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l527_c7_0802_iffalse := VAR_t8_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output;
     -- t8_MUX[uxn_opcodes_h_l527_c7_0802] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l527_c7_0802_cond <= VAR_t8_MUX_uxn_opcodes_h_l527_c7_0802_cond;
     t8_MUX_uxn_opcodes_h_l527_c7_0802_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l527_c7_0802_iftrue;
     t8_MUX_uxn_opcodes_h_l527_c7_0802_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l527_c7_0802_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l527_c7_0802_return_output := t8_MUX_uxn_opcodes_h_l527_c7_0802_return_output;

     -- n8_MUX[uxn_opcodes_h_l530_c7_dbf8] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l530_c7_dbf8_cond <= VAR_n8_MUX_uxn_opcodes_h_l530_c7_dbf8_cond;
     n8_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue;
     n8_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output := n8_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l527_c7_0802] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_0802_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_0802_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_0802_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_0802_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_0802_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_0802_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_0802_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_0802_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l530_c7_dbf8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_dbf8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_dbf8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_4804_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l527_c7_0802_iffalse := VAR_n8_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l514_c2_cd9a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l527_c7_0802_return_output;
     -- n8_MUX[uxn_opcodes_h_l527_c7_0802] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l527_c7_0802_cond <= VAR_n8_MUX_uxn_opcodes_h_l527_c7_0802_cond;
     n8_MUX_uxn_opcodes_h_l527_c7_0802_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l527_c7_0802_iftrue;
     n8_MUX_uxn_opcodes_h_l527_c7_0802_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l527_c7_0802_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l527_c7_0802_return_output := n8_MUX_uxn_opcodes_h_l527_c7_0802_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l534_c1_4804] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_4804_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_4804_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_4804_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_4804_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_4804_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_4804_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_4804_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_4804_return_output;

     -- t8_MUX[uxn_opcodes_h_l514_c2_cd9a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l514_c2_cd9a_cond <= VAR_t8_MUX_uxn_opcodes_h_l514_c2_cd9a_cond;
     t8_MUX_uxn_opcodes_h_l514_c2_cd9a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l514_c2_cd9a_iftrue;
     t8_MUX_uxn_opcodes_h_l514_c2_cd9a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l514_c2_cd9a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l514_c2_cd9a_return_output := t8_MUX_uxn_opcodes_h_l514_c2_cd9a_return_output;

     -- Submodule level 4
     VAR_device_out_uxn_opcodes_h_l537_c23_6d8e_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_4804_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l514_c2_cd9a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l527_c7_0802_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l514_c2_cd9a_return_output;
     -- device_out[uxn_opcodes_h_l537_c23_6d8e] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l537_c23_6d8e_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l537_c23_6d8e_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l537_c23_6d8e_device_address <= VAR_device_out_uxn_opcodes_h_l537_c23_6d8e_device_address;
     device_out_uxn_opcodes_h_l537_c23_6d8e_value <= VAR_device_out_uxn_opcodes_h_l537_c23_6d8e_value;
     device_out_uxn_opcodes_h_l537_c23_6d8e_phase <= VAR_device_out_uxn_opcodes_h_l537_c23_6d8e_phase;
     device_out_uxn_opcodes_h_l537_c23_6d8e_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l537_c23_6d8e_previous_device_ram_read;
     device_out_uxn_opcodes_h_l537_c23_6d8e_previous_ram_read <= VAR_device_out_uxn_opcodes_h_l537_c23_6d8e_previous_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l537_c23_6d8e_return_output := device_out_uxn_opcodes_h_l537_c23_6d8e_return_output;

     -- n8_MUX[uxn_opcodes_h_l514_c2_cd9a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l514_c2_cd9a_cond <= VAR_n8_MUX_uxn_opcodes_h_l514_c2_cd9a_cond;
     n8_MUX_uxn_opcodes_h_l514_c2_cd9a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l514_c2_cd9a_iftrue;
     n8_MUX_uxn_opcodes_h_l514_c2_cd9a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l514_c2_cd9a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l514_c2_cd9a_return_output := n8_MUX_uxn_opcodes_h_l514_c2_cd9a_return_output;

     -- Submodule level 5
     VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse := VAR_device_out_uxn_opcodes_h_l537_c23_6d8e_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l514_c2_cd9a_return_output;
     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l538_c32_7e33] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l538_c32_7e33_return_output := VAR_device_out_uxn_opcodes_h_l537_c23_6d8e_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_opcodes_h_l543_c29_ccc9] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l543_c29_ccc9_return_output := VAR_device_out_uxn_opcodes_h_l537_c23_6d8e_return_output.vram_write_layer;

     -- device_out_result_MUX[uxn_opcodes_h_l530_c7_dbf8] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l530_c7_dbf8_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_dbf8_cond;
     device_out_result_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output := device_out_result_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d[uxn_opcodes_h_l544_c24_e34f] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l544_c24_e34f_return_output := VAR_device_out_uxn_opcodes_h_l537_c23_6d8e_return_output.is_deo_done;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l539_c31_a1dd] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l539_c31_a1dd_return_output := VAR_device_out_uxn_opcodes_h_l537_c23_6d8e_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l542_c26_708d] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l542_c26_708d_return_output := VAR_device_out_uxn_opcodes_h_l537_c23_6d8e_return_output.is_vram_write;

     -- CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d[uxn_opcodes_h_l541_c22_c152] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l541_c22_c152_return_output := VAR_device_out_uxn_opcodes_h_l537_c23_6d8e_return_output.u16_addr;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_opcodes_h_l540_c21_1937] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l540_c21_1937_return_output := VAR_device_out_uxn_opcodes_h_l537_c23_6d8e_return_output.u8_value;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l541_c22_c152_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l544_c24_e34f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l538_c32_7e33_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l542_c26_708d_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l543_c29_ccc9_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l539_c31_a1dd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l540_c21_1937_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_0802_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output;
     -- result_vram_write_layer_MUX[uxn_opcodes_h_l530_c7_dbf8] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_dbf8_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_dbf8_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l530_c7_dbf8] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_dbf8_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_dbf8_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l530_c7_dbf8] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_dbf8_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_dbf8_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l530_c7_dbf8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l530_c7_dbf8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_dbf8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output := result_u8_value_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l530_c7_dbf8] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_dbf8_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_dbf8_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l530_c7_dbf8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l530_c7_dbf8_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l530_c7_dbf8_cond;
     result_u16_value_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output := result_u16_value_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l530_c7_dbf8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_dbf8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_dbf8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_dbf8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_dbf8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l527_c7_0802] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l527_c7_0802_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_0802_cond;
     device_out_result_MUX_uxn_opcodes_h_l527_c7_0802_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_0802_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l527_c7_0802_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_0802_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_0802_return_output := device_out_result_MUX_uxn_opcodes_h_l527_c7_0802_return_output;

     -- Submodule level 7
     VAR_device_out_result_MUX_uxn_opcodes_h_l514_c2_cd9a_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_0802_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_0802_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_0802_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_0802_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_0802_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l527_c7_0802_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_0802_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_0802_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_dbf8_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l527_c7_0802] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_0802_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_0802_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_0802_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_0802_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_0802_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_0802_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_0802_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_0802_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l527_c7_0802] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l527_c7_0802_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l527_c7_0802_cond;
     result_u16_value_MUX_uxn_opcodes_h_l527_c7_0802_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l527_c7_0802_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l527_c7_0802_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l527_c7_0802_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l527_c7_0802_return_output := result_u16_value_MUX_uxn_opcodes_h_l527_c7_0802_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l527_c7_0802] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l527_c7_0802_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_0802_cond;
     result_u8_value_MUX_uxn_opcodes_h_l527_c7_0802_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_0802_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l527_c7_0802_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_0802_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_0802_return_output := result_u8_value_MUX_uxn_opcodes_h_l527_c7_0802_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l527_c7_0802] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_0802_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_0802_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_0802_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_0802_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_0802_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_0802_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_0802_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_0802_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l514_c2_cd9a] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l514_c2_cd9a_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l514_c2_cd9a_cond;
     device_out_result_MUX_uxn_opcodes_h_l514_c2_cd9a_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l514_c2_cd9a_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l514_c2_cd9a_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l514_c2_cd9a_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l514_c2_cd9a_return_output := device_out_result_MUX_uxn_opcodes_h_l514_c2_cd9a_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l527_c7_0802] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_0802_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_0802_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_0802_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_0802_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_0802_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_0802_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_0802_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_0802_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l527_c7_0802] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_0802_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_0802_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_0802_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_0802_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_0802_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_0802_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_0802_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_0802_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l527_c7_0802] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_0802_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_0802_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_0802_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_0802_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_0802_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_0802_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_0802_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_0802_return_output;

     -- Submodule level 8
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l514_c2_cd9a_return_output;
     -- result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_82d1[uxn_opcodes_h_l514_c2_cd9a] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_82d1_uxn_opcodes_h_l514_c2_cd9a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_82d1(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_0802_return_output,
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_0802_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_0802_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_0802_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_0802_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_0802_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l527_c7_0802_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_0802_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_0802_return_output);

     -- Submodule level 9
     VAR_result_MUX_uxn_opcodes_h_l514_c2_cd9a_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_82d1_uxn_opcodes_h_l514_c2_cd9a_return_output;
     -- result_MUX[uxn_opcodes_h_l514_c2_cd9a] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l514_c2_cd9a_cond <= VAR_result_MUX_uxn_opcodes_h_l514_c2_cd9a_cond;
     result_MUX_uxn_opcodes_h_l514_c2_cd9a_iftrue <= VAR_result_MUX_uxn_opcodes_h_l514_c2_cd9a_iftrue;
     result_MUX_uxn_opcodes_h_l514_c2_cd9a_iffalse <= VAR_result_MUX_uxn_opcodes_h_l514_c2_cd9a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l514_c2_cd9a_return_output := result_MUX_uxn_opcodes_h_l514_c2_cd9a_return_output;

     -- Submodule level 10
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l514_c2_cd9a_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l514_c2_cd9a_return_output;
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
