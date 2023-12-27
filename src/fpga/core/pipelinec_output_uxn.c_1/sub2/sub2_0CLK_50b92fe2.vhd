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
-- Submodules: 71
entity sub2_0CLK_50b92fe2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sub2_0CLK_50b92fe2;
architecture arch of sub2_0CLK_50b92fe2 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2496_c6_1fb0]
signal BIN_OP_EQ_uxn_opcodes_h_l2496_c6_1fb0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2496_c6_1fb0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2496_c6_1fb0_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2496_c2_5986]
signal tmp16_MUX_uxn_opcodes_h_l2496_c2_5986_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2496_c2_5986_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2496_c2_5986]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_5986_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_5986_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2496_c2_5986]
signal result_u8_value_MUX_uxn_opcodes_h_l2496_c2_5986_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2496_c2_5986_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2496_c2_5986]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_5986_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_5986_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2496_c2_5986]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_5986_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_5986_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2496_c2_5986]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_5986_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_5986_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2496_c2_5986]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_5986_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_5986_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2496_c2_5986]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_5986_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_5986_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2496_c2_5986]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_5986_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_5986_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2496_c2_5986]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_5986_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_5986_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2496_c2_5986]
signal t16_MUX_uxn_opcodes_h_l2496_c2_5986_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2496_c2_5986_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2496_c2_5986]
signal n16_MUX_uxn_opcodes_h_l2496_c2_5986_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2496_c2_5986_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2509_c11_c5e2]
signal BIN_OP_EQ_uxn_opcodes_h_l2509_c11_c5e2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2509_c11_c5e2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2509_c11_c5e2_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2509_c7_453d]
signal tmp16_MUX_uxn_opcodes_h_l2509_c7_453d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2509_c7_453d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2509_c7_453d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2509_c7_453d_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2509_c7_453d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_453d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_453d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_453d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_453d_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2509_c7_453d]
signal result_u8_value_MUX_uxn_opcodes_h_l2509_c7_453d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2509_c7_453d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2509_c7_453d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2509_c7_453d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2509_c7_453d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_453d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_453d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_453d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_453d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2509_c7_453d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_453d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_453d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_453d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_453d_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2509_c7_453d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_453d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_453d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_453d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_453d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2509_c7_453d]
signal t16_MUX_uxn_opcodes_h_l2509_c7_453d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2509_c7_453d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2509_c7_453d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2509_c7_453d_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2509_c7_453d]
signal n16_MUX_uxn_opcodes_h_l2509_c7_453d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2509_c7_453d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2509_c7_453d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2509_c7_453d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2512_c11_bdfd]
signal BIN_OP_EQ_uxn_opcodes_h_l2512_c11_bdfd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2512_c11_bdfd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2512_c11_bdfd_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2512_c7_9972]
signal tmp16_MUX_uxn_opcodes_h_l2512_c7_9972_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2512_c7_9972_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2512_c7_9972_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2512_c7_9972_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2512_c7_9972]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_9972_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_9972_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_9972_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_9972_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2512_c7_9972]
signal result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9972_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9972_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9972_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9972_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2512_c7_9972]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_9972_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_9972_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_9972_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_9972_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2512_c7_9972]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9972_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9972_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9972_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9972_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2512_c7_9972]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9972_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9972_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9972_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9972_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2512_c7_9972]
signal t16_MUX_uxn_opcodes_h_l2512_c7_9972_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2512_c7_9972_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2512_c7_9972_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2512_c7_9972_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2512_c7_9972]
signal n16_MUX_uxn_opcodes_h_l2512_c7_9972_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2512_c7_9972_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2512_c7_9972_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2512_c7_9972_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2517_c11_42a5]
signal BIN_OP_EQ_uxn_opcodes_h_l2517_c11_42a5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2517_c11_42a5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2517_c11_42a5_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2517_c7_c373]
signal tmp16_MUX_uxn_opcodes_h_l2517_c7_c373_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2517_c7_c373_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2517_c7_c373_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2517_c7_c373_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2517_c7_c373]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c373_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c373_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c373_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c373_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2517_c7_c373]
signal result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c373_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c373_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c373_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c373_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2517_c7_c373]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c373_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c373_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c373_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c373_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2517_c7_c373]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c373_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c373_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c373_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c373_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2517_c7_c373]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c373_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c373_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c373_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c373_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2517_c7_c373]
signal t16_MUX_uxn_opcodes_h_l2517_c7_c373_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2517_c7_c373_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2517_c7_c373_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2517_c7_c373_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2517_c7_c373]
signal n16_MUX_uxn_opcodes_h_l2517_c7_c373_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2517_c7_c373_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2517_c7_c373_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2517_c7_c373_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2518_c3_9df6]
signal BIN_OP_OR_uxn_opcodes_h_l2518_c3_9df6_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2518_c3_9df6_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2518_c3_9df6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2521_c11_121f]
signal BIN_OP_EQ_uxn_opcodes_h_l2521_c11_121f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2521_c11_121f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2521_c11_121f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2521_c7_24e7]
signal tmp16_MUX_uxn_opcodes_h_l2521_c7_24e7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2521_c7_24e7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2521_c7_24e7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2521_c7_24e7_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2521_c7_24e7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_24e7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_24e7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_24e7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_24e7_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2521_c7_24e7]
signal result_u8_value_MUX_uxn_opcodes_h_l2521_c7_24e7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2521_c7_24e7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2521_c7_24e7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2521_c7_24e7_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2521_c7_24e7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_24e7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_24e7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_24e7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_24e7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2521_c7_24e7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_24e7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_24e7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_24e7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_24e7_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2521_c7_24e7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_24e7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_24e7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_24e7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_24e7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2521_c7_24e7]
signal n16_MUX_uxn_opcodes_h_l2521_c7_24e7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2521_c7_24e7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2521_c7_24e7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2521_c7_24e7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2525_c11_c80c]
signal BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c80c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c80c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c80c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2525_c7_612a]
signal tmp16_MUX_uxn_opcodes_h_l2525_c7_612a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2525_c7_612a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2525_c7_612a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2525_c7_612a_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2525_c7_612a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_612a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_612a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_612a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_612a_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2525_c7_612a]
signal result_u8_value_MUX_uxn_opcodes_h_l2525_c7_612a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2525_c7_612a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2525_c7_612a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2525_c7_612a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2525_c7_612a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_612a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_612a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_612a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_612a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2525_c7_612a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_612a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_612a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_612a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_612a_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2525_c7_612a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_612a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_612a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_612a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_612a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2525_c7_612a]
signal n16_MUX_uxn_opcodes_h_l2525_c7_612a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2525_c7_612a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2525_c7_612a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2525_c7_612a_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2526_c3_aee9]
signal BIN_OP_OR_uxn_opcodes_h_l2526_c3_aee9_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2526_c3_aee9_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2526_c3_aee9_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2527_c11_8f2a]
signal BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_8f2a_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_8f2a_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_8f2a_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2528_c30_5c98]
signal sp_relative_shift_uxn_opcodes_h_l2528_c30_5c98_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2528_c30_5c98_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2528_c30_5c98_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2528_c30_5c98_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2533_c11_b699]
signal BIN_OP_EQ_uxn_opcodes_h_l2533_c11_b699_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2533_c11_b699_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2533_c11_b699_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2533_c7_cc40]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_cc40_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_cc40_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_cc40_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_cc40_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2533_c7_cc40]
signal result_u8_value_MUX_uxn_opcodes_h_l2533_c7_cc40_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2533_c7_cc40_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2533_c7_cc40_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2533_c7_cc40_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2533_c7_cc40]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_cc40_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_cc40_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_cc40_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_cc40_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2533_c7_cc40]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_cc40_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_cc40_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_cc40_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_cc40_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2536_c31_cf0c]
signal CONST_SR_8_uxn_opcodes_h_l2536_c31_cf0c_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2536_c31_cf0c_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_786c
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_786c_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_786c_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_b856( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2496_c6_1fb0
BIN_OP_EQ_uxn_opcodes_h_l2496_c6_1fb0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2496_c6_1fb0_left,
BIN_OP_EQ_uxn_opcodes_h_l2496_c6_1fb0_right,
BIN_OP_EQ_uxn_opcodes_h_l2496_c6_1fb0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2496_c2_5986
tmp16_MUX_uxn_opcodes_h_l2496_c2_5986 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2496_c2_5986_cond,
tmp16_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue,
tmp16_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse,
tmp16_MUX_uxn_opcodes_h_l2496_c2_5986_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_5986
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_5986 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_5986_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_5986_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2496_c2_5986
result_u8_value_MUX_uxn_opcodes_h_l2496_c2_5986 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2496_c2_5986_cond,
result_u8_value_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2496_c2_5986_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_5986
result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_5986 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_5986_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_5986_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_5986
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_5986 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_5986_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_5986_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_5986
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_5986 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_5986_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_5986_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_5986
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_5986 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_5986_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_5986_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_5986
result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_5986 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_5986_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_5986_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_5986
result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_5986 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_5986_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_5986_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_5986
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_5986 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_5986_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_5986_return_output);

-- t16_MUX_uxn_opcodes_h_l2496_c2_5986
t16_MUX_uxn_opcodes_h_l2496_c2_5986 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2496_c2_5986_cond,
t16_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue,
t16_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse,
t16_MUX_uxn_opcodes_h_l2496_c2_5986_return_output);

-- n16_MUX_uxn_opcodes_h_l2496_c2_5986
n16_MUX_uxn_opcodes_h_l2496_c2_5986 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2496_c2_5986_cond,
n16_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue,
n16_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse,
n16_MUX_uxn_opcodes_h_l2496_c2_5986_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2509_c11_c5e2
BIN_OP_EQ_uxn_opcodes_h_l2509_c11_c5e2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2509_c11_c5e2_left,
BIN_OP_EQ_uxn_opcodes_h_l2509_c11_c5e2_right,
BIN_OP_EQ_uxn_opcodes_h_l2509_c11_c5e2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2509_c7_453d
tmp16_MUX_uxn_opcodes_h_l2509_c7_453d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2509_c7_453d_cond,
tmp16_MUX_uxn_opcodes_h_l2509_c7_453d_iftrue,
tmp16_MUX_uxn_opcodes_h_l2509_c7_453d_iffalse,
tmp16_MUX_uxn_opcodes_h_l2509_c7_453d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_453d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_453d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_453d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_453d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_453d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_453d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2509_c7_453d
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_453d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_453d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_453d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_453d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_453d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_453d
result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_453d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_453d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_453d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_453d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_453d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_453d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_453d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_453d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_453d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_453d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_453d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_453d
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_453d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_453d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_453d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_453d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_453d_return_output);

-- t16_MUX_uxn_opcodes_h_l2509_c7_453d
t16_MUX_uxn_opcodes_h_l2509_c7_453d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2509_c7_453d_cond,
t16_MUX_uxn_opcodes_h_l2509_c7_453d_iftrue,
t16_MUX_uxn_opcodes_h_l2509_c7_453d_iffalse,
t16_MUX_uxn_opcodes_h_l2509_c7_453d_return_output);

-- n16_MUX_uxn_opcodes_h_l2509_c7_453d
n16_MUX_uxn_opcodes_h_l2509_c7_453d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2509_c7_453d_cond,
n16_MUX_uxn_opcodes_h_l2509_c7_453d_iftrue,
n16_MUX_uxn_opcodes_h_l2509_c7_453d_iffalse,
n16_MUX_uxn_opcodes_h_l2509_c7_453d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2512_c11_bdfd
BIN_OP_EQ_uxn_opcodes_h_l2512_c11_bdfd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2512_c11_bdfd_left,
BIN_OP_EQ_uxn_opcodes_h_l2512_c11_bdfd_right,
BIN_OP_EQ_uxn_opcodes_h_l2512_c11_bdfd_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2512_c7_9972
tmp16_MUX_uxn_opcodes_h_l2512_c7_9972 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2512_c7_9972_cond,
tmp16_MUX_uxn_opcodes_h_l2512_c7_9972_iftrue,
tmp16_MUX_uxn_opcodes_h_l2512_c7_9972_iffalse,
tmp16_MUX_uxn_opcodes_h_l2512_c7_9972_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_9972
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_9972 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_9972_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_9972_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_9972_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_9972_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9972
result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9972 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9972_cond,
result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9972_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9972_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9972_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_9972
result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_9972 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_9972_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_9972_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_9972_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_9972_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9972
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9972 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9972_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9972_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9972_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9972_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9972
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9972 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9972_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9972_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9972_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9972_return_output);

-- t16_MUX_uxn_opcodes_h_l2512_c7_9972
t16_MUX_uxn_opcodes_h_l2512_c7_9972 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2512_c7_9972_cond,
t16_MUX_uxn_opcodes_h_l2512_c7_9972_iftrue,
t16_MUX_uxn_opcodes_h_l2512_c7_9972_iffalse,
t16_MUX_uxn_opcodes_h_l2512_c7_9972_return_output);

-- n16_MUX_uxn_opcodes_h_l2512_c7_9972
n16_MUX_uxn_opcodes_h_l2512_c7_9972 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2512_c7_9972_cond,
n16_MUX_uxn_opcodes_h_l2512_c7_9972_iftrue,
n16_MUX_uxn_opcodes_h_l2512_c7_9972_iffalse,
n16_MUX_uxn_opcodes_h_l2512_c7_9972_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2517_c11_42a5
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_42a5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_42a5_left,
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_42a5_right,
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_42a5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2517_c7_c373
tmp16_MUX_uxn_opcodes_h_l2517_c7_c373 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2517_c7_c373_cond,
tmp16_MUX_uxn_opcodes_h_l2517_c7_c373_iftrue,
tmp16_MUX_uxn_opcodes_h_l2517_c7_c373_iffalse,
tmp16_MUX_uxn_opcodes_h_l2517_c7_c373_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c373
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c373 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c373_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c373_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c373_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c373_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c373
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c373 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c373_cond,
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c373_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c373_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c373_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c373
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c373 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c373_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c373_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c373_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c373_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c373
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c373 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c373_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c373_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c373_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c373_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c373
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c373 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c373_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c373_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c373_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c373_return_output);

-- t16_MUX_uxn_opcodes_h_l2517_c7_c373
t16_MUX_uxn_opcodes_h_l2517_c7_c373 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2517_c7_c373_cond,
t16_MUX_uxn_opcodes_h_l2517_c7_c373_iftrue,
t16_MUX_uxn_opcodes_h_l2517_c7_c373_iffalse,
t16_MUX_uxn_opcodes_h_l2517_c7_c373_return_output);

-- n16_MUX_uxn_opcodes_h_l2517_c7_c373
n16_MUX_uxn_opcodes_h_l2517_c7_c373 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2517_c7_c373_cond,
n16_MUX_uxn_opcodes_h_l2517_c7_c373_iftrue,
n16_MUX_uxn_opcodes_h_l2517_c7_c373_iffalse,
n16_MUX_uxn_opcodes_h_l2517_c7_c373_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2518_c3_9df6
BIN_OP_OR_uxn_opcodes_h_l2518_c3_9df6 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2518_c3_9df6_left,
BIN_OP_OR_uxn_opcodes_h_l2518_c3_9df6_right,
BIN_OP_OR_uxn_opcodes_h_l2518_c3_9df6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2521_c11_121f
BIN_OP_EQ_uxn_opcodes_h_l2521_c11_121f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2521_c11_121f_left,
BIN_OP_EQ_uxn_opcodes_h_l2521_c11_121f_right,
BIN_OP_EQ_uxn_opcodes_h_l2521_c11_121f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2521_c7_24e7
tmp16_MUX_uxn_opcodes_h_l2521_c7_24e7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2521_c7_24e7_cond,
tmp16_MUX_uxn_opcodes_h_l2521_c7_24e7_iftrue,
tmp16_MUX_uxn_opcodes_h_l2521_c7_24e7_iffalse,
tmp16_MUX_uxn_opcodes_h_l2521_c7_24e7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_24e7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_24e7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_24e7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_24e7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_24e7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_24e7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2521_c7_24e7
result_u8_value_MUX_uxn_opcodes_h_l2521_c7_24e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2521_c7_24e7_cond,
result_u8_value_MUX_uxn_opcodes_h_l2521_c7_24e7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2521_c7_24e7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2521_c7_24e7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_24e7
result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_24e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_24e7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_24e7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_24e7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_24e7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_24e7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_24e7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_24e7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_24e7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_24e7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_24e7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_24e7
result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_24e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_24e7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_24e7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_24e7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_24e7_return_output);

-- n16_MUX_uxn_opcodes_h_l2521_c7_24e7
n16_MUX_uxn_opcodes_h_l2521_c7_24e7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2521_c7_24e7_cond,
n16_MUX_uxn_opcodes_h_l2521_c7_24e7_iftrue,
n16_MUX_uxn_opcodes_h_l2521_c7_24e7_iffalse,
n16_MUX_uxn_opcodes_h_l2521_c7_24e7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c80c
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c80c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c80c_left,
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c80c_right,
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c80c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2525_c7_612a
tmp16_MUX_uxn_opcodes_h_l2525_c7_612a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2525_c7_612a_cond,
tmp16_MUX_uxn_opcodes_h_l2525_c7_612a_iftrue,
tmp16_MUX_uxn_opcodes_h_l2525_c7_612a_iffalse,
tmp16_MUX_uxn_opcodes_h_l2525_c7_612a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_612a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_612a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_612a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_612a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_612a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_612a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2525_c7_612a
result_u8_value_MUX_uxn_opcodes_h_l2525_c7_612a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2525_c7_612a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2525_c7_612a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2525_c7_612a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2525_c7_612a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_612a
result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_612a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_612a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_612a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_612a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_612a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_612a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_612a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_612a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_612a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_612a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_612a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_612a
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_612a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_612a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_612a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_612a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_612a_return_output);

-- n16_MUX_uxn_opcodes_h_l2525_c7_612a
n16_MUX_uxn_opcodes_h_l2525_c7_612a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2525_c7_612a_cond,
n16_MUX_uxn_opcodes_h_l2525_c7_612a_iftrue,
n16_MUX_uxn_opcodes_h_l2525_c7_612a_iffalse,
n16_MUX_uxn_opcodes_h_l2525_c7_612a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2526_c3_aee9
BIN_OP_OR_uxn_opcodes_h_l2526_c3_aee9 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2526_c3_aee9_left,
BIN_OP_OR_uxn_opcodes_h_l2526_c3_aee9_right,
BIN_OP_OR_uxn_opcodes_h_l2526_c3_aee9_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_8f2a
BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_8f2a : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_8f2a_left,
BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_8f2a_right,
BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_8f2a_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2528_c30_5c98
sp_relative_shift_uxn_opcodes_h_l2528_c30_5c98 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2528_c30_5c98_ins,
sp_relative_shift_uxn_opcodes_h_l2528_c30_5c98_x,
sp_relative_shift_uxn_opcodes_h_l2528_c30_5c98_y,
sp_relative_shift_uxn_opcodes_h_l2528_c30_5c98_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2533_c11_b699
BIN_OP_EQ_uxn_opcodes_h_l2533_c11_b699 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2533_c11_b699_left,
BIN_OP_EQ_uxn_opcodes_h_l2533_c11_b699_right,
BIN_OP_EQ_uxn_opcodes_h_l2533_c11_b699_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_cc40
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_cc40 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_cc40_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_cc40_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_cc40_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_cc40_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2533_c7_cc40
result_u8_value_MUX_uxn_opcodes_h_l2533_c7_cc40 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2533_c7_cc40_cond,
result_u8_value_MUX_uxn_opcodes_h_l2533_c7_cc40_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2533_c7_cc40_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2533_c7_cc40_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_cc40
result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_cc40 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_cc40_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_cc40_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_cc40_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_cc40_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_cc40
result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_cc40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_cc40_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_cc40_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_cc40_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_cc40_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2536_c31_cf0c
CONST_SR_8_uxn_opcodes_h_l2536_c31_cf0c : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2536_c31_cf0c_x,
CONST_SR_8_uxn_opcodes_h_l2536_c31_cf0c_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_786c
CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_786c : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_786c_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_786c_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2496_c6_1fb0_return_output,
 tmp16_MUX_uxn_opcodes_h_l2496_c2_5986_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_5986_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2496_c2_5986_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_5986_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_5986_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_5986_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_5986_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_5986_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_5986_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_5986_return_output,
 t16_MUX_uxn_opcodes_h_l2496_c2_5986_return_output,
 n16_MUX_uxn_opcodes_h_l2496_c2_5986_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2509_c11_c5e2_return_output,
 tmp16_MUX_uxn_opcodes_h_l2509_c7_453d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_453d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2509_c7_453d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_453d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_453d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_453d_return_output,
 t16_MUX_uxn_opcodes_h_l2509_c7_453d_return_output,
 n16_MUX_uxn_opcodes_h_l2509_c7_453d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2512_c11_bdfd_return_output,
 tmp16_MUX_uxn_opcodes_h_l2512_c7_9972_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_9972_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9972_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_9972_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9972_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9972_return_output,
 t16_MUX_uxn_opcodes_h_l2512_c7_9972_return_output,
 n16_MUX_uxn_opcodes_h_l2512_c7_9972_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2517_c11_42a5_return_output,
 tmp16_MUX_uxn_opcodes_h_l2517_c7_c373_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c373_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c373_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c373_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c373_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c373_return_output,
 t16_MUX_uxn_opcodes_h_l2517_c7_c373_return_output,
 n16_MUX_uxn_opcodes_h_l2517_c7_c373_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2518_c3_9df6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2521_c11_121f_return_output,
 tmp16_MUX_uxn_opcodes_h_l2521_c7_24e7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_24e7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2521_c7_24e7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_24e7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_24e7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_24e7_return_output,
 n16_MUX_uxn_opcodes_h_l2521_c7_24e7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c80c_return_output,
 tmp16_MUX_uxn_opcodes_h_l2525_c7_612a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_612a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2525_c7_612a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_612a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_612a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_612a_return_output,
 n16_MUX_uxn_opcodes_h_l2525_c7_612a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2526_c3_aee9_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_8f2a_return_output,
 sp_relative_shift_uxn_opcodes_h_l2528_c30_5c98_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2533_c11_b699_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_cc40_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2533_c7_cc40_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_cc40_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_cc40_return_output,
 CONST_SR_8_uxn_opcodes_h_l2536_c31_cf0c_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_786c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_1fb0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_1fb0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_1fb0_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_453d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_5986_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_5986_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2506_c3_0967 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_453d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_5986_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_5986_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_453d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_5986_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_5986_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2496_c2_5986_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_5986_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_5986_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2496_c2_5986_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_5986_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_5986_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_453d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_5986_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_5986_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2501_c3_a2cd : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_453d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_5986_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_5986_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2496_c2_5986_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_5986_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_5986_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2496_c2_5986_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_5986_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_5986_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_453d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_5986_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_5986_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2509_c7_453d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2496_c2_5986_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2496_c2_5986_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2509_c7_453d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2496_c2_5986_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2496_c2_5986_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_c5e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_c5e2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_c5e2_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_453d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_453d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_9972_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_453d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_453d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2510_c3_ee6d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_453d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_9972_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_453d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_453d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_453d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9972_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_453d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_453d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_453d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_9972_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_453d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_453d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_453d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9972_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_453d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_453d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_453d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9972_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_453d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2509_c7_453d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2509_c7_453d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2512_c7_9972_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2509_c7_453d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2509_c7_453d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2509_c7_453d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2512_c7_9972_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2509_c7_453d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_bdfd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_bdfd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_bdfd_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_9972_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_9972_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_c373_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_9972_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_9972_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2515_c3_95d7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_9972_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c373_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_9972_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9972_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9972_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c373_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9972_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_9972_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_9972_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c373_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_9972_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9972_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9972_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c373_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9972_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9972_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9972_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c373_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9972_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2512_c7_9972_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2512_c7_9972_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2517_c7_c373_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2512_c7_9972_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2512_c7_9972_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2512_c7_9972_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2517_c7_c373_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2512_c7_9972_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_42a5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_42a5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_42a5_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_c373_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_c373_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_24e7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_c373_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c373_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2519_c3_5f58 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c373_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_24e7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c373_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c373_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c373_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_24e7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c373_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c373_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c373_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_24e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c373_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c373_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c373_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_24e7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c373_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c373_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c373_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_24e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c373_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2517_c7_c373_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2517_c7_c373_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2517_c7_c373_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2517_c7_c373_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2517_c7_c373_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2521_c7_24e7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2517_c7_c373_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_9df6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_9df6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_9df6_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_121f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_121f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_121f_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_24e7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_24e7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_612a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_24e7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_24e7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_24e7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_612a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_24e7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_24e7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_24e7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_612a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_24e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_24e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_24e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_612a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_24e7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_24e7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_24e7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_612a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_24e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_24e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_24e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_612a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_24e7_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2521_c7_24e7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2521_c7_24e7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2525_c7_612a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2521_c7_24e7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c80c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c80c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c80c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_612a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_612a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_612a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_612a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2530_c3_f924 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_612a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_cc40_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_612a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_612a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_612a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_cc40_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_612a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_612a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_612a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_612a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_612a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_612a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_cc40_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_612a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_612a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_612a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_cc40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_612a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2525_c7_612a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2525_c7_612a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2525_c7_612a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_aee9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_aee9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_aee9_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_8f2a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_8f2a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_8f2a_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_5c98_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_5c98_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_5c98_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_5c98_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2531_c21_bbf8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_b699_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_b699_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_b699_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_cc40_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2535_c3_b18e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_cc40_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_cc40_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_cc40_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_cc40_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_cc40_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_cc40_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2534_c3_9b92 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_cc40_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_cc40_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_cc40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_cc40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_cc40_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2536_c31_cf0c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2536_c31_cf0c_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2536_c21_a7a0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2512_l2509_l2496_l2533_l2521_l2517_DUPLICATE_ff03_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2512_l2509_l2525_l2521_l2517_DUPLICATE_2a32_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2521_l2517_DUPLICATE_67b5_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2525_l2521_l2517_DUPLICATE_f506_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2522_l2513_l2526_l2518_DUPLICATE_d0e9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_786c_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_786c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2533_l2521_DUPLICATE_15f3_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l2540_l2492_DUPLICATE_06e6_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2506_c3_0967 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2506_c3_0967;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_cc40_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2534_c3_9b92 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_cc40_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2534_c3_9b92;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_5c98_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2530_c3_f924 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_612a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2530_c3_f924;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c80c_right := to_unsigned(5, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_5c98_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_bdfd_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_42a5_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_b699_right := to_unsigned(6, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2501_c3_a2cd := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2501_c3_a2cd;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_612a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2519_c3_5f58 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c373_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2519_c3_5f58;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_121f_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_c5e2_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2510_c3_ee6d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_453d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2510_c3_ee6d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_1fb0_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2515_c3_95d7 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_9972_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2515_c3_95d7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2535_c3_b18e := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_cc40_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2535_c3_b18e;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue := to_unsigned(0, 1);

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

     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_5c98_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_aee9_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2509_c7_453d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2512_c7_9972_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2517_c7_c373_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2525_c7_612a_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_1fb0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_c5e2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_bdfd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_42a5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_121f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c80c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_b699_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_8f2a_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_9df6_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2509_c7_453d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2517_c7_c373_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2536_c31_cf0c_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_453d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_9972_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_c373_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_24e7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_612a_iffalse := tmp16;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2521_l2517_DUPLICATE_67b5 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2521_l2517_DUPLICATE_67b5_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2496_c6_1fb0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2496_c6_1fb0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_1fb0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2496_c6_1fb0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_1fb0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_1fb0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2496_c6_1fb0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2521_c11_121f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2521_c11_121f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_121f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2521_c11_121f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_121f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_121f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2521_c11_121f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2525_l2521_l2517_DUPLICATE_f506 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2525_l2521_l2517_DUPLICATE_f506_return_output := result.is_opc_done;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2496_c2_5986] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2496_c2_5986_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2512_l2509_l2525_l2521_l2517_DUPLICATE_2a32 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2512_l2509_l2525_l2521_l2517_DUPLICATE_2a32_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2525_c11_c80c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c80c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c80c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c80c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c80c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c80c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c80c_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2496_c2_5986] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2496_c2_5986_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2517_c11_42a5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2517_c11_42a5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_42a5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2517_c11_42a5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_42a5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_42a5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2517_c11_42a5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2509_c11_c5e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2509_c11_c5e2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_c5e2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2509_c11_c5e2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_c5e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_c5e2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2509_c11_c5e2_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2522_l2513_l2526_l2518_DUPLICATE_d0e9 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2522_l2513_l2526_l2518_DUPLICATE_d0e9_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_SR_8[uxn_opcodes_h_l2536_c31_cf0c] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2536_c31_cf0c_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2536_c31_cf0c_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2536_c31_cf0c_return_output := CONST_SR_8_uxn_opcodes_h_l2536_c31_cf0c_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2512_l2509_l2496_l2533_l2521_l2517_DUPLICATE_ff03 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2512_l2509_l2496_l2533_l2521_l2517_DUPLICATE_ff03_return_output := result.u8_value;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2496_c2_5986] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2496_c2_5986_return_output := result.is_pc_updated;

     -- sp_relative_shift[uxn_opcodes_h_l2528_c30_5c98] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2528_c30_5c98_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_5c98_ins;
     sp_relative_shift_uxn_opcodes_h_l2528_c30_5c98_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_5c98_x;
     sp_relative_shift_uxn_opcodes_h_l2528_c30_5c98_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_5c98_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_5c98_return_output := sp_relative_shift_uxn_opcodes_h_l2528_c30_5c98_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2496_c2_5986] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2496_c2_5986_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2533_l2521_DUPLICATE_15f3 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2533_l2521_DUPLICATE_15f3_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2512_c11_bdfd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2512_c11_bdfd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_bdfd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2512_c11_bdfd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_bdfd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_bdfd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2512_c11_bdfd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2533_c11_b699] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2533_c11_b699_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_b699_left;
     BIN_OP_EQ_uxn_opcodes_h_l2533_c11_b699_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_b699_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_b699_return_output := BIN_OP_EQ_uxn_opcodes_h_l2533_c11_b699_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2496_c2_5986_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_1fb0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_5986_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_1fb0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_5986_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_1fb0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_5986_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_1fb0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_5986_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_1fb0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_5986_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_1fb0_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_5986_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_1fb0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_5986_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_1fb0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_5986_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_1fb0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_5986_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_1fb0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2496_c2_5986_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_1fb0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_5986_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_1fb0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2509_c7_453d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_c5e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_453d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_c5e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_453d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_c5e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_453d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_c5e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_453d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_c5e2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_453d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_c5e2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2509_c7_453d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_c5e2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_453d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_c5e2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2512_c7_9972_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_bdfd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9972_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_bdfd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_9972_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_bdfd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9972_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_bdfd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_9972_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_bdfd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9972_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_bdfd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2512_c7_9972_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_bdfd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_9972_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_bdfd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2517_c7_c373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_42a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_42a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_42a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_42a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_42a5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_42a5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2517_c7_c373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_42a5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_c373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_42a5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2521_c7_24e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_121f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_24e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_121f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_24e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_121f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_24e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_121f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_24e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_121f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_24e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_121f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_24e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_121f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2525_c7_612a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c80c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_612a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c80c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_612a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c80c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_612a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c80c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_612a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c80c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_612a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c80c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_612a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c80c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_cc40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_b699_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_cc40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_b699_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_cc40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_b699_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_cc40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_b699_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_9df6_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2522_l2513_l2526_l2518_DUPLICATE_d0e9_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_aee9_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2522_l2513_l2526_l2518_DUPLICATE_d0e9_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_786c_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2522_l2513_l2526_l2518_DUPLICATE_d0e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_453d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2521_l2517_DUPLICATE_67b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9972_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2521_l2517_DUPLICATE_67b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c373_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2521_l2517_DUPLICATE_67b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_24e7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2521_l2517_DUPLICATE_67b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_cc40_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2521_l2517_DUPLICATE_67b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_453d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2525_l2521_l2517_DUPLICATE_f506_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9972_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2525_l2521_l2517_DUPLICATE_f506_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c373_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2525_l2521_l2517_DUPLICATE_f506_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_24e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2525_l2521_l2517_DUPLICATE_f506_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_612a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2525_l2521_l2517_DUPLICATE_f506_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_cc40_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2525_l2521_l2517_DUPLICATE_f506_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_453d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2512_l2509_l2525_l2521_l2517_DUPLICATE_2a32_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_9972_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2512_l2509_l2525_l2521_l2517_DUPLICATE_2a32_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c373_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2512_l2509_l2525_l2521_l2517_DUPLICATE_2a32_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_24e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2512_l2509_l2525_l2521_l2517_DUPLICATE_2a32_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_612a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2512_l2509_l2525_l2521_l2517_DUPLICATE_2a32_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_24e7_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2533_l2521_DUPLICATE_15f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_cc40_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2533_l2521_DUPLICATE_15f3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2512_l2509_l2496_l2533_l2521_l2517_DUPLICATE_ff03_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_453d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2512_l2509_l2496_l2533_l2521_l2517_DUPLICATE_ff03_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9972_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2512_l2509_l2496_l2533_l2521_l2517_DUPLICATE_ff03_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c373_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2512_l2509_l2496_l2533_l2521_l2517_DUPLICATE_ff03_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_24e7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2512_l2509_l2496_l2533_l2521_l2517_DUPLICATE_ff03_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_cc40_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2512_l2509_l2496_l2533_l2521_l2517_DUPLICATE_ff03_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2496_c2_5986_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2496_c2_5986_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2496_c2_5986_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2496_c2_5986_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_612a_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_5c98_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2525_c7_612a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_612a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_612a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_612a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_612a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_612a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_612a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_612a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_612a_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2496_c2_5986] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_5986_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_5986_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_5986_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_5986_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2533_c7_cc40] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_cc40_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_cc40_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_cc40_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_cc40_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_cc40_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_cc40_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_cc40_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_cc40_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2518_c3_9df6] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2518_c3_9df6_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_9df6_left;
     BIN_OP_OR_uxn_opcodes_h_l2518_c3_9df6_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_9df6_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_9df6_return_output := BIN_OP_OR_uxn_opcodes_h_l2518_c3_9df6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2533_c7_cc40] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_cc40_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_cc40_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_cc40_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_cc40_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_cc40_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_cc40_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_cc40_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_cc40_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2536_c21_a7a0] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2536_c21_a7a0_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2536_c31_cf0c_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l2526_c3_aee9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2526_c3_aee9_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_aee9_left;
     BIN_OP_OR_uxn_opcodes_h_l2526_c3_aee9_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_aee9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_aee9_return_output := BIN_OP_OR_uxn_opcodes_h_l2526_c3_aee9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2533_c7_cc40] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_cc40_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_cc40_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_cc40_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_cc40_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_cc40_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_cc40_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_cc40_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_cc40_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_786c LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_786c_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_786c_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_786c_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_786c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2496_c2_5986] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_5986_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_5986_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_5986_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_5986_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2496_c2_5986] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_5986_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_5986_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_5986_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_5986_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2496_c2_5986] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_5986_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_5986_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_5986_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_5986_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2517_c7_c373_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_9df6_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_8f2a_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_aee9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2525_c7_612a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_aee9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_cc40_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2536_c21_a7a0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2521_c7_24e7_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_786c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2512_c7_9972_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_786c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_612a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_cc40_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_24e7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_612a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_612a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_cc40_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_612a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_cc40_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2525_c7_612a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_612a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_612a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_612a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_612a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_612a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_612a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_612a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_612a_return_output;

     -- n16_MUX[uxn_opcodes_h_l2525_c7_612a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2525_c7_612a_cond <= VAR_n16_MUX_uxn_opcodes_h_l2525_c7_612a_cond;
     n16_MUX_uxn_opcodes_h_l2525_c7_612a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2525_c7_612a_iftrue;
     n16_MUX_uxn_opcodes_h_l2525_c7_612a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2525_c7_612a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2525_c7_612a_return_output := n16_MUX_uxn_opcodes_h_l2525_c7_612a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2533_c7_cc40] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2533_c7_cc40_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_cc40_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2533_c7_cc40_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_cc40_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2533_c7_cc40_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_cc40_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_cc40_return_output := result_u8_value_MUX_uxn_opcodes_h_l2533_c7_cc40_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2521_c7_24e7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_24e7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_24e7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_24e7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_24e7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_24e7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_24e7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_24e7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_24e7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2525_c7_612a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_612a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_612a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_612a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_612a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_612a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_612a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_612a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_612a_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l2527_c11_8f2a] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_8f2a_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_8f2a_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_8f2a_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_8f2a_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_8f2a_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_8f2a_return_output;

     -- t16_MUX[uxn_opcodes_h_l2517_c7_c373] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2517_c7_c373_cond <= VAR_t16_MUX_uxn_opcodes_h_l2517_c7_c373_cond;
     t16_MUX_uxn_opcodes_h_l2517_c7_c373_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2517_c7_c373_iftrue;
     t16_MUX_uxn_opcodes_h_l2517_c7_c373_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2517_c7_c373_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2517_c7_c373_return_output := t16_MUX_uxn_opcodes_h_l2517_c7_c373_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2525_c7_612a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_612a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_612a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_612a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_612a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_612a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_612a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_612a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_612a_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_612a_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_8f2a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2521_c7_24e7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2525_c7_612a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_24e7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_612a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c373_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_24e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_24e7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_612a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_24e7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_612a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_612a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_cc40_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2512_c7_9972_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2517_c7_c373_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2521_c7_24e7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_24e7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_24e7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_24e7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_24e7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_24e7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_24e7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_24e7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_24e7_return_output;

     -- n16_MUX[uxn_opcodes_h_l2521_c7_24e7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2521_c7_24e7_cond <= VAR_n16_MUX_uxn_opcodes_h_l2521_c7_24e7_cond;
     n16_MUX_uxn_opcodes_h_l2521_c7_24e7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2521_c7_24e7_iftrue;
     n16_MUX_uxn_opcodes_h_l2521_c7_24e7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2521_c7_24e7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2521_c7_24e7_return_output := n16_MUX_uxn_opcodes_h_l2521_c7_24e7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2521_c7_24e7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_24e7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_24e7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_24e7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_24e7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_24e7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_24e7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_24e7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_24e7_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2531_c21_bbf8] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2531_c21_bbf8_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_8f2a_return_output);

     -- t16_MUX[uxn_opcodes_h_l2512_c7_9972] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2512_c7_9972_cond <= VAR_t16_MUX_uxn_opcodes_h_l2512_c7_9972_cond;
     t16_MUX_uxn_opcodes_h_l2512_c7_9972_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2512_c7_9972_iftrue;
     t16_MUX_uxn_opcodes_h_l2512_c7_9972_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2512_c7_9972_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2512_c7_9972_return_output := t16_MUX_uxn_opcodes_h_l2512_c7_9972_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2517_c7_c373] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c373_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c373_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c373_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c373_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c373_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c373_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c373_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c373_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2525_c7_612a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2525_c7_612a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_612a_cond;
     tmp16_MUX_uxn_opcodes_h_l2525_c7_612a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_612a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2525_c7_612a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_612a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_612a_return_output := tmp16_MUX_uxn_opcodes_h_l2525_c7_612a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2521_c7_24e7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_24e7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_24e7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_24e7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_24e7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_24e7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_24e7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_24e7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_24e7_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_612a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2531_c21_bbf8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2517_c7_c373_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2521_c7_24e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c373_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_24e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_9972_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c373_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c373_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_24e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c373_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_24e7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2509_c7_453d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2512_c7_9972_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_24e7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_612a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2517_c7_c373] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c373_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c373_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c373_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c373_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c373_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c373_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c373_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c373_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2512_c7_9972] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_9972_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_9972_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_9972_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_9972_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_9972_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_9972_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_9972_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_9972_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2525_c7_612a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2525_c7_612a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_612a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2525_c7_612a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_612a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2525_c7_612a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_612a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_612a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2525_c7_612a_return_output;

     -- t16_MUX[uxn_opcodes_h_l2509_c7_453d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2509_c7_453d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2509_c7_453d_cond;
     t16_MUX_uxn_opcodes_h_l2509_c7_453d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2509_c7_453d_iftrue;
     t16_MUX_uxn_opcodes_h_l2509_c7_453d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2509_c7_453d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2509_c7_453d_return_output := t16_MUX_uxn_opcodes_h_l2509_c7_453d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2517_c7_c373] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c373_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c373_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c373_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c373_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c373_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c373_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c373_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c373_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2521_c7_24e7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2521_c7_24e7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_24e7_cond;
     tmp16_MUX_uxn_opcodes_h_l2521_c7_24e7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_24e7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2521_c7_24e7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_24e7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_24e7_return_output := tmp16_MUX_uxn_opcodes_h_l2521_c7_24e7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2517_c7_c373] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c373_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c373_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c373_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c373_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c373_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c373_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c373_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c373_return_output;

     -- n16_MUX[uxn_opcodes_h_l2517_c7_c373] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2517_c7_c373_cond <= VAR_n16_MUX_uxn_opcodes_h_l2517_c7_c373_cond;
     n16_MUX_uxn_opcodes_h_l2517_c7_c373_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2517_c7_c373_iftrue;
     n16_MUX_uxn_opcodes_h_l2517_c7_c373_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2517_c7_c373_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2517_c7_c373_return_output := n16_MUX_uxn_opcodes_h_l2517_c7_c373_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2512_c7_9972_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2517_c7_c373_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9972_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c373_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_453d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_9972_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9972_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c373_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_9972_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c373_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_24e7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_612a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2509_c7_453d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_c373_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_24e7_return_output;
     -- t16_MUX[uxn_opcodes_h_l2496_c2_5986] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2496_c2_5986_cond <= VAR_t16_MUX_uxn_opcodes_h_l2496_c2_5986_cond;
     t16_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue;
     t16_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2496_c2_5986_return_output := t16_MUX_uxn_opcodes_h_l2496_c2_5986_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2517_c7_c373] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2517_c7_c373_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_c373_cond;
     tmp16_MUX_uxn_opcodes_h_l2517_c7_c373_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_c373_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2517_c7_c373_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_c373_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_c373_return_output := tmp16_MUX_uxn_opcodes_h_l2517_c7_c373_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2509_c7_453d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_453d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_453d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_453d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_453d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_453d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_453d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_453d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_453d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2512_c7_9972] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_9972_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_9972_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_9972_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_9972_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_9972_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_9972_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_9972_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_9972_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2512_c7_9972] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9972_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9972_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9972_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9972_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9972_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9972_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9972_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9972_return_output;

     -- n16_MUX[uxn_opcodes_h_l2512_c7_9972] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2512_c7_9972_cond <= VAR_n16_MUX_uxn_opcodes_h_l2512_c7_9972_cond;
     n16_MUX_uxn_opcodes_h_l2512_c7_9972_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2512_c7_9972_iftrue;
     n16_MUX_uxn_opcodes_h_l2512_c7_9972_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2512_c7_9972_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2512_c7_9972_return_output := n16_MUX_uxn_opcodes_h_l2512_c7_9972_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2512_c7_9972] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9972_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9972_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9972_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9972_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9972_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9972_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9972_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9972_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2521_c7_24e7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2521_c7_24e7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_24e7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2521_c7_24e7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_24e7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2521_c7_24e7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_24e7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_24e7_return_output := result_u8_value_MUX_uxn_opcodes_h_l2521_c7_24e7_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2509_c7_453d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2512_c7_9972_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_453d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9972_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_453d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_453d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9972_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_453d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_9972_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c373_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_24e7_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2496_c2_5986_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_9972_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_c373_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2509_c7_453d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_453d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_453d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_453d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_453d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_453d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_453d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_453d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_453d_return_output;

     -- n16_MUX[uxn_opcodes_h_l2509_c7_453d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2509_c7_453d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2509_c7_453d_cond;
     n16_MUX_uxn_opcodes_h_l2509_c7_453d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2509_c7_453d_iftrue;
     n16_MUX_uxn_opcodes_h_l2509_c7_453d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2509_c7_453d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2509_c7_453d_return_output := n16_MUX_uxn_opcodes_h_l2509_c7_453d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2517_c7_c373] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c373_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c373_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c373_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c373_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c373_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c373_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c373_return_output := result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c373_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2509_c7_453d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_453d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_453d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_453d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_453d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_453d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_453d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_453d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_453d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2512_c7_9972] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2512_c7_9972_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_9972_cond;
     tmp16_MUX_uxn_opcodes_h_l2512_c7_9972_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_9972_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2512_c7_9972_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_9972_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_9972_return_output := tmp16_MUX_uxn_opcodes_h_l2512_c7_9972_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2509_c7_453d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_453d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_453d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_453d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_453d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_453d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_453d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_453d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_453d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2496_c2_5986] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_5986_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_5986_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_5986_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_5986_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2509_c7_453d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_453d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_453d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_453d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9972_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c373_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_453d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_9972_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2496_c2_5986] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_5986_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_5986_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_5986_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_5986_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2496_c2_5986] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_5986_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_5986_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_5986_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_5986_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2512_c7_9972] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9972_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9972_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9972_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9972_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9972_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9972_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9972_return_output := result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9972_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2509_c7_453d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2509_c7_453d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_453d_cond;
     tmp16_MUX_uxn_opcodes_h_l2509_c7_453d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_453d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2509_c7_453d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_453d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_453d_return_output := tmp16_MUX_uxn_opcodes_h_l2509_c7_453d_return_output;

     -- n16_MUX[uxn_opcodes_h_l2496_c2_5986] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2496_c2_5986_cond <= VAR_n16_MUX_uxn_opcodes_h_l2496_c2_5986_cond;
     n16_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue;
     n16_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2496_c2_5986_return_output := n16_MUX_uxn_opcodes_h_l2496_c2_5986_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2496_c2_5986] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_5986_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_5986_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_5986_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_5986_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2496_c2_5986_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_453d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9972_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_453d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2509_c7_453d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2509_c7_453d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_453d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2509_c7_453d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_453d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2509_c7_453d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_453d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_453d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2509_c7_453d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2496_c2_5986] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2496_c2_5986_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_5986_cond;
     tmp16_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_5986_return_output := tmp16_MUX_uxn_opcodes_h_l2496_c2_5986_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_453d_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_5986_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2496_c2_5986] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2496_c2_5986_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_5986_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_5986_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_5986_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_5986_return_output := result_u8_value_MUX_uxn_opcodes_h_l2496_c2_5986_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l2540_l2492_DUPLICATE_06e6 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l2540_l2492_DUPLICATE_06e6_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b856(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_5986_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_5986_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_5986_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_5986_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_5986_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_5986_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_5986_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_5986_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_5986_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l2540_l2492_DUPLICATE_06e6_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l2540_l2492_DUPLICATE_06e6_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
