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
-- BIN_OP_EQ[uxn_opcodes_h_l2496_c6_21cd]
signal BIN_OP_EQ_uxn_opcodes_h_l2496_c6_21cd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2496_c6_21cd_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2496_c6_21cd_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2496_c2_9834]
signal n16_MUX_uxn_opcodes_h_l2496_c2_9834_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2496_c2_9834_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2496_c2_9834]
signal tmp16_MUX_uxn_opcodes_h_l2496_c2_9834_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2496_c2_9834_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2496_c2_9834]
signal t16_MUX_uxn_opcodes_h_l2496_c2_9834_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2496_c2_9834_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2496_c2_9834]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_9834_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_9834_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2496_c2_9834]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_9834_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_9834_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2496_c2_9834]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_9834_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_9834_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2496_c2_9834]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_9834_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_9834_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2496_c2_9834]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_9834_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_9834_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2496_c2_9834]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_9834_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_9834_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2496_c2_9834]
signal result_u8_value_MUX_uxn_opcodes_h_l2496_c2_9834_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2496_c2_9834_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2496_c2_9834]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_9834_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_9834_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2496_c2_9834]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_9834_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_9834_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2509_c11_de6a]
signal BIN_OP_EQ_uxn_opcodes_h_l2509_c11_de6a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2509_c11_de6a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2509_c11_de6a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2509_c7_e86f]
signal n16_MUX_uxn_opcodes_h_l2509_c7_e86f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2509_c7_e86f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2509_c7_e86f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2509_c7_e86f]
signal tmp16_MUX_uxn_opcodes_h_l2509_c7_e86f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2509_c7_e86f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2509_c7_e86f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2509_c7_e86f]
signal t16_MUX_uxn_opcodes_h_l2509_c7_e86f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2509_c7_e86f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2509_c7_e86f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2509_c7_e86f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e86f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e86f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e86f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2509_c7_e86f]
signal result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e86f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e86f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e86f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2509_c7_e86f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e86f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e86f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e86f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2509_c7_e86f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e86f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e86f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e86f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2509_c7_e86f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e86f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e86f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e86f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2512_c11_7fd9]
signal BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7fd9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7fd9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7fd9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2512_c7_de2a]
signal n16_MUX_uxn_opcodes_h_l2512_c7_de2a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2512_c7_de2a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2512_c7_de2a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2512_c7_de2a]
signal tmp16_MUX_uxn_opcodes_h_l2512_c7_de2a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2512_c7_de2a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2512_c7_de2a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2512_c7_de2a]
signal t16_MUX_uxn_opcodes_h_l2512_c7_de2a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2512_c7_de2a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2512_c7_de2a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2512_c7_de2a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_de2a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_de2a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_de2a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2512_c7_de2a]
signal result_u8_value_MUX_uxn_opcodes_h_l2512_c7_de2a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2512_c7_de2a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2512_c7_de2a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2512_c7_de2a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_de2a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_de2a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_de2a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2512_c7_de2a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_de2a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_de2a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_de2a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2512_c7_de2a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_de2a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_de2a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_de2a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2517_c11_ba57]
signal BIN_OP_EQ_uxn_opcodes_h_l2517_c11_ba57_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2517_c11_ba57_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2517_c11_ba57_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2517_c7_4d47]
signal n16_MUX_uxn_opcodes_h_l2517_c7_4d47_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2517_c7_4d47_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2517_c7_4d47_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2517_c7_4d47]
signal tmp16_MUX_uxn_opcodes_h_l2517_c7_4d47_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2517_c7_4d47_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2517_c7_4d47_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2517_c7_4d47]
signal t16_MUX_uxn_opcodes_h_l2517_c7_4d47_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2517_c7_4d47_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2517_c7_4d47_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2517_c7_4d47]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4d47_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4d47_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4d47_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2517_c7_4d47]
signal result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4d47_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4d47_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4d47_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2517_c7_4d47]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4d47_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4d47_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4d47_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2517_c7_4d47]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4d47_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4d47_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4d47_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2517_c7_4d47]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4d47_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4d47_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4d47_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2518_c3_e0a5]
signal BIN_OP_OR_uxn_opcodes_h_l2518_c3_e0a5_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2518_c3_e0a5_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2518_c3_e0a5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2521_c11_85f6]
signal BIN_OP_EQ_uxn_opcodes_h_l2521_c11_85f6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2521_c11_85f6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2521_c11_85f6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2521_c7_7d96]
signal n16_MUX_uxn_opcodes_h_l2521_c7_7d96_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2521_c7_7d96_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2521_c7_7d96_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2521_c7_7d96_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2521_c7_7d96]
signal tmp16_MUX_uxn_opcodes_h_l2521_c7_7d96_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2521_c7_7d96_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2521_c7_7d96_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2521_c7_7d96_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2521_c7_7d96]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_7d96_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_7d96_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_7d96_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_7d96_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2521_c7_7d96]
signal result_u8_value_MUX_uxn_opcodes_h_l2521_c7_7d96_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2521_c7_7d96_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2521_c7_7d96_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2521_c7_7d96_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2521_c7_7d96]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_7d96_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_7d96_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_7d96_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_7d96_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2521_c7_7d96]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_7d96_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_7d96_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_7d96_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_7d96_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2521_c7_7d96]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_7d96_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_7d96_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_7d96_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_7d96_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2525_c11_7f1c]
signal BIN_OP_EQ_uxn_opcodes_h_l2525_c11_7f1c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2525_c11_7f1c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2525_c11_7f1c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2525_c7_226c]
signal n16_MUX_uxn_opcodes_h_l2525_c7_226c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2525_c7_226c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2525_c7_226c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2525_c7_226c_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2525_c7_226c]
signal tmp16_MUX_uxn_opcodes_h_l2525_c7_226c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2525_c7_226c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2525_c7_226c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2525_c7_226c_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2525_c7_226c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_226c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_226c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_226c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_226c_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2525_c7_226c]
signal result_u8_value_MUX_uxn_opcodes_h_l2525_c7_226c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2525_c7_226c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2525_c7_226c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2525_c7_226c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2525_c7_226c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_226c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_226c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_226c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_226c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2525_c7_226c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_226c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_226c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_226c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_226c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2525_c7_226c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_226c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_226c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_226c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_226c_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2526_c3_c1bc]
signal BIN_OP_OR_uxn_opcodes_h_l2526_c3_c1bc_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2526_c3_c1bc_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2526_c3_c1bc_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2527_c11_444d]
signal BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_444d_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_444d_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_444d_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2528_c30_9383]
signal sp_relative_shift_uxn_opcodes_h_l2528_c30_9383_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2528_c30_9383_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2528_c30_9383_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2528_c30_9383_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2533_c11_d907]
signal BIN_OP_EQ_uxn_opcodes_h_l2533_c11_d907_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2533_c11_d907_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2533_c11_d907_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2533_c7_b84a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_b84a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_b84a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_b84a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_b84a_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2533_c7_b84a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_b84a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_b84a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_b84a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_b84a_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2533_c7_b84a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_b84a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_b84a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_b84a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_b84a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2533_c7_b84a]
signal result_u8_value_MUX_uxn_opcodes_h_l2533_c7_b84a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2533_c7_b84a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2533_c7_b84a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2533_c7_b84a_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2536_c31_b07e]
signal CONST_SR_8_uxn_opcodes_h_l2536_c31_b07e_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2536_c31_b07e_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_41ac
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_41ac_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_41ac_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_ee25( ref_toks_0 : opcode_result_t;
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
      base.is_ram_write := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.u8_value := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_vram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2496_c6_21cd
BIN_OP_EQ_uxn_opcodes_h_l2496_c6_21cd : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2496_c6_21cd_left,
BIN_OP_EQ_uxn_opcodes_h_l2496_c6_21cd_right,
BIN_OP_EQ_uxn_opcodes_h_l2496_c6_21cd_return_output);

-- n16_MUX_uxn_opcodes_h_l2496_c2_9834
n16_MUX_uxn_opcodes_h_l2496_c2_9834 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2496_c2_9834_cond,
n16_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue,
n16_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse,
n16_MUX_uxn_opcodes_h_l2496_c2_9834_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2496_c2_9834
tmp16_MUX_uxn_opcodes_h_l2496_c2_9834 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2496_c2_9834_cond,
tmp16_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue,
tmp16_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse,
tmp16_MUX_uxn_opcodes_h_l2496_c2_9834_return_output);

-- t16_MUX_uxn_opcodes_h_l2496_c2_9834
t16_MUX_uxn_opcodes_h_l2496_c2_9834 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2496_c2_9834_cond,
t16_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue,
t16_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse,
t16_MUX_uxn_opcodes_h_l2496_c2_9834_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_9834
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_9834 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_9834_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_9834_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_9834
result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_9834 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_9834_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_9834_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_9834
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_9834 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_9834_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_9834_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_9834
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_9834 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_9834_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_9834_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_9834
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_9834 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_9834_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_9834_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_9834
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_9834 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_9834_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_9834_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2496_c2_9834
result_u8_value_MUX_uxn_opcodes_h_l2496_c2_9834 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2496_c2_9834_cond,
result_u8_value_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2496_c2_9834_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_9834
result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_9834 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_9834_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_9834_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_9834
result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_9834 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_9834_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_9834_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2509_c11_de6a
BIN_OP_EQ_uxn_opcodes_h_l2509_c11_de6a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2509_c11_de6a_left,
BIN_OP_EQ_uxn_opcodes_h_l2509_c11_de6a_right,
BIN_OP_EQ_uxn_opcodes_h_l2509_c11_de6a_return_output);

-- n16_MUX_uxn_opcodes_h_l2509_c7_e86f
n16_MUX_uxn_opcodes_h_l2509_c7_e86f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2509_c7_e86f_cond,
n16_MUX_uxn_opcodes_h_l2509_c7_e86f_iftrue,
n16_MUX_uxn_opcodes_h_l2509_c7_e86f_iffalse,
n16_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2509_c7_e86f
tmp16_MUX_uxn_opcodes_h_l2509_c7_e86f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2509_c7_e86f_cond,
tmp16_MUX_uxn_opcodes_h_l2509_c7_e86f_iftrue,
tmp16_MUX_uxn_opcodes_h_l2509_c7_e86f_iffalse,
tmp16_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output);

-- t16_MUX_uxn_opcodes_h_l2509_c7_e86f
t16_MUX_uxn_opcodes_h_l2509_c7_e86f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2509_c7_e86f_cond,
t16_MUX_uxn_opcodes_h_l2509_c7_e86f_iftrue,
t16_MUX_uxn_opcodes_h_l2509_c7_e86f_iffalse,
t16_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e86f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e86f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e86f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e86f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e86f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e86f
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e86f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e86f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e86f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e86f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e86f
result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e86f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e86f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e86f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e86f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e86f
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e86f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e86f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e86f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e86f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e86f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e86f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e86f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e86f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e86f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7fd9
BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7fd9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7fd9_left,
BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7fd9_right,
BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7fd9_return_output);

-- n16_MUX_uxn_opcodes_h_l2512_c7_de2a
n16_MUX_uxn_opcodes_h_l2512_c7_de2a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2512_c7_de2a_cond,
n16_MUX_uxn_opcodes_h_l2512_c7_de2a_iftrue,
n16_MUX_uxn_opcodes_h_l2512_c7_de2a_iffalse,
n16_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2512_c7_de2a
tmp16_MUX_uxn_opcodes_h_l2512_c7_de2a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2512_c7_de2a_cond,
tmp16_MUX_uxn_opcodes_h_l2512_c7_de2a_iftrue,
tmp16_MUX_uxn_opcodes_h_l2512_c7_de2a_iffalse,
tmp16_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output);

-- t16_MUX_uxn_opcodes_h_l2512_c7_de2a
t16_MUX_uxn_opcodes_h_l2512_c7_de2a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2512_c7_de2a_cond,
t16_MUX_uxn_opcodes_h_l2512_c7_de2a_iftrue,
t16_MUX_uxn_opcodes_h_l2512_c7_de2a_iffalse,
t16_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_de2a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_de2a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_de2a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_de2a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_de2a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2512_c7_de2a
result_u8_value_MUX_uxn_opcodes_h_l2512_c7_de2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2512_c7_de2a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2512_c7_de2a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2512_c7_de2a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_de2a
result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_de2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_de2a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_de2a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_de2a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_de2a
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_de2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_de2a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_de2a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_de2a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_de2a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_de2a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_de2a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_de2a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_de2a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2517_c11_ba57
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_ba57 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_ba57_left,
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_ba57_right,
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_ba57_return_output);

-- n16_MUX_uxn_opcodes_h_l2517_c7_4d47
n16_MUX_uxn_opcodes_h_l2517_c7_4d47 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2517_c7_4d47_cond,
n16_MUX_uxn_opcodes_h_l2517_c7_4d47_iftrue,
n16_MUX_uxn_opcodes_h_l2517_c7_4d47_iffalse,
n16_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2517_c7_4d47
tmp16_MUX_uxn_opcodes_h_l2517_c7_4d47 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2517_c7_4d47_cond,
tmp16_MUX_uxn_opcodes_h_l2517_c7_4d47_iftrue,
tmp16_MUX_uxn_opcodes_h_l2517_c7_4d47_iffalse,
tmp16_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output);

-- t16_MUX_uxn_opcodes_h_l2517_c7_4d47
t16_MUX_uxn_opcodes_h_l2517_c7_4d47 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2517_c7_4d47_cond,
t16_MUX_uxn_opcodes_h_l2517_c7_4d47_iftrue,
t16_MUX_uxn_opcodes_h_l2517_c7_4d47_iffalse,
t16_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4d47
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4d47 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4d47_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4d47_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4d47_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4d47
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4d47 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4d47_cond,
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4d47_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4d47_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4d47
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4d47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4d47_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4d47_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4d47_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4d47
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4d47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4d47_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4d47_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4d47_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4d47
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4d47 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4d47_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4d47_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4d47_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2518_c3_e0a5
BIN_OP_OR_uxn_opcodes_h_l2518_c3_e0a5 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2518_c3_e0a5_left,
BIN_OP_OR_uxn_opcodes_h_l2518_c3_e0a5_right,
BIN_OP_OR_uxn_opcodes_h_l2518_c3_e0a5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2521_c11_85f6
BIN_OP_EQ_uxn_opcodes_h_l2521_c11_85f6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2521_c11_85f6_left,
BIN_OP_EQ_uxn_opcodes_h_l2521_c11_85f6_right,
BIN_OP_EQ_uxn_opcodes_h_l2521_c11_85f6_return_output);

-- n16_MUX_uxn_opcodes_h_l2521_c7_7d96
n16_MUX_uxn_opcodes_h_l2521_c7_7d96 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2521_c7_7d96_cond,
n16_MUX_uxn_opcodes_h_l2521_c7_7d96_iftrue,
n16_MUX_uxn_opcodes_h_l2521_c7_7d96_iffalse,
n16_MUX_uxn_opcodes_h_l2521_c7_7d96_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2521_c7_7d96
tmp16_MUX_uxn_opcodes_h_l2521_c7_7d96 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2521_c7_7d96_cond,
tmp16_MUX_uxn_opcodes_h_l2521_c7_7d96_iftrue,
tmp16_MUX_uxn_opcodes_h_l2521_c7_7d96_iffalse,
tmp16_MUX_uxn_opcodes_h_l2521_c7_7d96_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_7d96
result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_7d96 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_7d96_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_7d96_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_7d96_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_7d96_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2521_c7_7d96
result_u8_value_MUX_uxn_opcodes_h_l2521_c7_7d96 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2521_c7_7d96_cond,
result_u8_value_MUX_uxn_opcodes_h_l2521_c7_7d96_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2521_c7_7d96_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2521_c7_7d96_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_7d96
result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_7d96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_7d96_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_7d96_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_7d96_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_7d96_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_7d96
result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_7d96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_7d96_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_7d96_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_7d96_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_7d96_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_7d96
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_7d96 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_7d96_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_7d96_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_7d96_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_7d96_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2525_c11_7f1c
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_7f1c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_7f1c_left,
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_7f1c_right,
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_7f1c_return_output);

-- n16_MUX_uxn_opcodes_h_l2525_c7_226c
n16_MUX_uxn_opcodes_h_l2525_c7_226c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2525_c7_226c_cond,
n16_MUX_uxn_opcodes_h_l2525_c7_226c_iftrue,
n16_MUX_uxn_opcodes_h_l2525_c7_226c_iffalse,
n16_MUX_uxn_opcodes_h_l2525_c7_226c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2525_c7_226c
tmp16_MUX_uxn_opcodes_h_l2525_c7_226c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2525_c7_226c_cond,
tmp16_MUX_uxn_opcodes_h_l2525_c7_226c_iftrue,
tmp16_MUX_uxn_opcodes_h_l2525_c7_226c_iffalse,
tmp16_MUX_uxn_opcodes_h_l2525_c7_226c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_226c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_226c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_226c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_226c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_226c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_226c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2525_c7_226c
result_u8_value_MUX_uxn_opcodes_h_l2525_c7_226c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2525_c7_226c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2525_c7_226c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2525_c7_226c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2525_c7_226c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_226c
result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_226c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_226c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_226c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_226c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_226c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_226c
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_226c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_226c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_226c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_226c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_226c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_226c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_226c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_226c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_226c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_226c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_226c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2526_c3_c1bc
BIN_OP_OR_uxn_opcodes_h_l2526_c3_c1bc : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2526_c3_c1bc_left,
BIN_OP_OR_uxn_opcodes_h_l2526_c3_c1bc_right,
BIN_OP_OR_uxn_opcodes_h_l2526_c3_c1bc_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_444d
BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_444d : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_444d_left,
BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_444d_right,
BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_444d_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2528_c30_9383
sp_relative_shift_uxn_opcodes_h_l2528_c30_9383 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2528_c30_9383_ins,
sp_relative_shift_uxn_opcodes_h_l2528_c30_9383_x,
sp_relative_shift_uxn_opcodes_h_l2528_c30_9383_y,
sp_relative_shift_uxn_opcodes_h_l2528_c30_9383_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2533_c11_d907
BIN_OP_EQ_uxn_opcodes_h_l2533_c11_d907 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2533_c11_d907_left,
BIN_OP_EQ_uxn_opcodes_h_l2533_c11_d907_right,
BIN_OP_EQ_uxn_opcodes_h_l2533_c11_d907_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_b84a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_b84a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_b84a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_b84a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_b84a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_b84a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_b84a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_b84a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_b84a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_b84a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_b84a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_b84a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_b84a
result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_b84a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_b84a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_b84a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_b84a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_b84a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2533_c7_b84a
result_u8_value_MUX_uxn_opcodes_h_l2533_c7_b84a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2533_c7_b84a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2533_c7_b84a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2533_c7_b84a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2533_c7_b84a_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2536_c31_b07e
CONST_SR_8_uxn_opcodes_h_l2536_c31_b07e : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2536_c31_b07e_x,
CONST_SR_8_uxn_opcodes_h_l2536_c31_b07e_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_41ac
CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_41ac : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_41ac_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_41ac_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2496_c6_21cd_return_output,
 n16_MUX_uxn_opcodes_h_l2496_c2_9834_return_output,
 tmp16_MUX_uxn_opcodes_h_l2496_c2_9834_return_output,
 t16_MUX_uxn_opcodes_h_l2496_c2_9834_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_9834_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_9834_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_9834_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_9834_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_9834_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_9834_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2496_c2_9834_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_9834_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_9834_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2509_c11_de6a_return_output,
 n16_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output,
 tmp16_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output,
 t16_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7fd9_return_output,
 n16_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output,
 tmp16_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output,
 t16_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2517_c11_ba57_return_output,
 n16_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output,
 tmp16_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output,
 t16_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2518_c3_e0a5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2521_c11_85f6_return_output,
 n16_MUX_uxn_opcodes_h_l2521_c7_7d96_return_output,
 tmp16_MUX_uxn_opcodes_h_l2521_c7_7d96_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_7d96_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2521_c7_7d96_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_7d96_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_7d96_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_7d96_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2525_c11_7f1c_return_output,
 n16_MUX_uxn_opcodes_h_l2525_c7_226c_return_output,
 tmp16_MUX_uxn_opcodes_h_l2525_c7_226c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_226c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2525_c7_226c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_226c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_226c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_226c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2526_c3_c1bc_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_444d_return_output,
 sp_relative_shift_uxn_opcodes_h_l2528_c30_9383_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2533_c11_d907_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_b84a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_b84a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_b84a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2533_c7_b84a_return_output,
 CONST_SR_8_uxn_opcodes_h_l2536_c31_b07e_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_41ac_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_21cd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_21cd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_21cd_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2496_c2_9834_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2496_c2_9834_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_9834_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_9834_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2496_c2_9834_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2496_c2_9834_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2501_c3_6fb6 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_9834_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_9834_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2496_c2_9834_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_9834_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_9834_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_9834_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_9834_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_9834_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_9834_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2506_c3_789d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_9834_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_9834_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2496_c2_9834_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_9834_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_9834_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_9834_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_9834_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2496_c2_9834_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_9834_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_9834_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2496_c2_9834_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_9834_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_9834_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_de6a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_de6a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_de6a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2509_c7_e86f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2509_c7_e86f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2509_c7_e86f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_e86f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_e86f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_e86f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2509_c7_e86f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2509_c7_e86f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2509_c7_e86f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e86f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e86f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e86f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e86f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e86f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e86f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e86f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e86f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e86f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e86f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e86f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e86f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e86f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2510_c3_fb7f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e86f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e86f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7fd9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7fd9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7fd9_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2512_c7_de2a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2512_c7_de2a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2512_c7_de2a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_de2a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_de2a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_de2a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2512_c7_de2a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2512_c7_de2a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2512_c7_de2a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_de2a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_de2a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_de2a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_de2a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_de2a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_de2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_de2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_de2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_de2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_de2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_de2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_de2a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_de2a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2515_c3_db6f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_de2a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_de2a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_ba57_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_ba57_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_ba57_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2517_c7_4d47_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2517_c7_4d47_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2521_c7_7d96_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2517_c7_4d47_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_4d47_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_4d47_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_7d96_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_4d47_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2517_c7_4d47_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2517_c7_4d47_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2517_c7_4d47_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4d47_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4d47_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_7d96_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4d47_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4d47_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4d47_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_7d96_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4d47_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4d47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4d47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_7d96_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4d47_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4d47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4d47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_7d96_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4d47_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4d47_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2519_c3_472e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4d47_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_7d96_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4d47_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_e0a5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_e0a5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_e0a5_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_85f6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_85f6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_85f6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2521_c7_7d96_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2521_c7_7d96_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2525_c7_226c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2521_c7_7d96_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_7d96_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_7d96_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_226c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_7d96_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_7d96_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_7d96_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_226c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_7d96_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_7d96_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_7d96_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_226c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_7d96_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_7d96_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_7d96_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_226c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_7d96_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_7d96_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_7d96_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_226c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_7d96_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_7d96_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_7d96_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_226c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_7d96_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_7f1c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_7f1c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_7f1c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2525_c7_226c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2525_c7_226c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2525_c7_226c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_226c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_226c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_226c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_226c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_226c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_b84a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_226c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_226c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_226c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_b84a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_226c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_226c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_226c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_226c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_226c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_226c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_b84a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_226c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_226c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2530_c3_d7fc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_226c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_b84a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_226c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_c1bc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_c1bc_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_c1bc_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_444d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_444d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_444d_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_9383_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_9383_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_9383_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_9383_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2531_c21_5a69_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_d907_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_d907_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_d907_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_b84a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2534_c3_ee85 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_b84a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_b84a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_b84a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2535_c3_1905 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_b84a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_b84a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_b84a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_b84a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_b84a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_b84a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_b84a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_b84a_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2536_c31_b07e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2536_c31_b07e_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2536_c21_1d8d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2512_l2509_l2496_l2533_l2521_l2517_DUPLICATE_bf73_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2521_l2517_DUPLICATE_250b_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2512_l2509_l2525_l2521_l2517_DUPLICATE_13f5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2525_l2521_l2517_DUPLICATE_461c_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2513_l2518_l2522_l2526_DUPLICATE_406b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_41ac_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_41ac_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2533_l2521_DUPLICATE_2ae1_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l2540_l2492_DUPLICATE_7796_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2515_c3_db6f := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_de2a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2515_c3_db6f;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_226c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_21cd_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2530_c3_d7fc := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_226c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2530_c3_d7fc;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_9383_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2519_c3_472e := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4d47_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2519_c3_472e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2535_c3_1905 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_b84a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2535_c3_1905;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2506_c3_789d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2506_c3_789d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_de6a_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_b84a_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_9383_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_ba57_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2501_c3_6fb6 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2501_c3_6fb6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_7f1c_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2510_c3_fb7f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e86f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2510_c3_fb7f;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2534_c3_ee85 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_b84a_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2534_c3_ee85;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7fd9_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_d907_right := to_unsigned(6, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_85f6_right := to_unsigned(4, 3);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_9383_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_c1bc_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2509_c7_e86f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2512_c7_de2a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2517_c7_4d47_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2525_c7_226c_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_21cd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_de6a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7fd9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_ba57_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_85f6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_7f1c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_d907_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_444d_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_e0a5_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2509_c7_e86f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2517_c7_4d47_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2536_c31_b07e_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_e86f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_de2a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_4d47_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_7d96_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_226c_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2509_c11_de6a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2509_c11_de6a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_de6a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2509_c11_de6a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_de6a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_de6a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2509_c11_de6a_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2536_c31_b07e] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2536_c31_b07e_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2536_c31_b07e_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2536_c31_b07e_return_output := CONST_SR_8_uxn_opcodes_h_l2536_c31_b07e_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2512_l2509_l2496_l2533_l2521_l2517_DUPLICATE_bf73 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2512_l2509_l2496_l2533_l2521_l2517_DUPLICATE_bf73_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2521_c11_85f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2521_c11_85f6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_85f6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2521_c11_85f6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_85f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_85f6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2521_c11_85f6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2496_c6_21cd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2496_c6_21cd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_21cd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2496_c6_21cd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_21cd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_21cd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2496_c6_21cd_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2528_c30_9383] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2528_c30_9383_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_9383_ins;
     sp_relative_shift_uxn_opcodes_h_l2528_c30_9383_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_9383_x;
     sp_relative_shift_uxn_opcodes_h_l2528_c30_9383_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_9383_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_9383_return_output := sp_relative_shift_uxn_opcodes_h_l2528_c30_9383_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2496_c2_9834] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2496_c2_9834_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2512_l2509_l2525_l2521_l2517_DUPLICATE_13f5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2512_l2509_l2525_l2521_l2517_DUPLICATE_13f5_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2525_l2521_l2517_DUPLICATE_461c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2525_l2521_l2517_DUPLICATE_461c_return_output := result.is_opc_done;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2521_l2517_DUPLICATE_250b LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2521_l2517_DUPLICATE_250b_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2517_c11_ba57] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2517_c11_ba57_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_ba57_left;
     BIN_OP_EQ_uxn_opcodes_h_l2517_c11_ba57_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_ba57_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_ba57_return_output := BIN_OP_EQ_uxn_opcodes_h_l2517_c11_ba57_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2496_c2_9834] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2496_c2_9834_return_output := result.is_vram_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2496_c2_9834] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2496_c2_9834_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2533_l2521_DUPLICATE_2ae1 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2533_l2521_DUPLICATE_2ae1_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2533_c11_d907] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2533_c11_d907_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_d907_left;
     BIN_OP_EQ_uxn_opcodes_h_l2533_c11_d907_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_d907_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_d907_return_output := BIN_OP_EQ_uxn_opcodes_h_l2533_c11_d907_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2525_c11_7f1c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2525_c11_7f1c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_7f1c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2525_c11_7f1c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_7f1c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_7f1c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2525_c11_7f1c_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2496_c2_9834] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2496_c2_9834_return_output := result.is_ram_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2513_l2518_l2522_l2526_DUPLICATE_406b LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2513_l2518_l2522_l2526_DUPLICATE_406b_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2512_c11_7fd9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7fd9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7fd9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7fd9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7fd9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7fd9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7fd9_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2496_c2_9834_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_21cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_9834_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_21cd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_9834_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_21cd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_9834_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_21cd_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_9834_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_21cd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_9834_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_21cd_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_9834_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_21cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_9834_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_21cd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_9834_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_21cd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_9834_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_21cd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2496_c2_9834_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_21cd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_9834_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_21cd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2509_c7_e86f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_de6a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e86f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_de6a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e86f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_de6a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e86f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_de6a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e86f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_de6a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e86f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_de6a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2509_c7_e86f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_de6a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_e86f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_de6a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2512_c7_de2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7fd9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_de2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7fd9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_de2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7fd9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_de2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7fd9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_de2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7fd9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_de2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7fd9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2512_c7_de2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7fd9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_de2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7fd9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2517_c7_4d47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_ba57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4d47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_ba57_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4d47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_ba57_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4d47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_ba57_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4d47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_ba57_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4d47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_ba57_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2517_c7_4d47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_ba57_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_4d47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_ba57_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2521_c7_7d96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_85f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_7d96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_85f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_7d96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_85f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_7d96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_85f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_7d96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_85f6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_7d96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_85f6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_7d96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_85f6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2525_c7_226c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_7f1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_226c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_7f1c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_226c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_7f1c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_226c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_7f1c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_226c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_7f1c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_226c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_7f1c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_226c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_7f1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_b84a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_d907_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_b84a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_d907_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_b84a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_d907_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_b84a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_d907_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_e0a5_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2513_l2518_l2522_l2526_DUPLICATE_406b_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_c1bc_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2513_l2518_l2522_l2526_DUPLICATE_406b_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_41ac_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2513_l2518_l2522_l2526_DUPLICATE_406b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e86f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2521_l2517_DUPLICATE_250b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_de2a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2521_l2517_DUPLICATE_250b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4d47_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2521_l2517_DUPLICATE_250b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_7d96_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2521_l2517_DUPLICATE_250b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_b84a_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2521_l2517_DUPLICATE_250b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e86f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2525_l2521_l2517_DUPLICATE_461c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_de2a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2525_l2521_l2517_DUPLICATE_461c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4d47_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2525_l2521_l2517_DUPLICATE_461c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_7d96_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2525_l2521_l2517_DUPLICATE_461c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_226c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2525_l2521_l2517_DUPLICATE_461c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_b84a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2512_l2509_l2533_l2525_l2521_l2517_DUPLICATE_461c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e86f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2512_l2509_l2525_l2521_l2517_DUPLICATE_13f5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_de2a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2512_l2509_l2525_l2521_l2517_DUPLICATE_13f5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4d47_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2512_l2509_l2525_l2521_l2517_DUPLICATE_13f5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_7d96_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2512_l2509_l2525_l2521_l2517_DUPLICATE_13f5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_226c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2512_l2509_l2525_l2521_l2517_DUPLICATE_13f5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_7d96_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2533_l2521_DUPLICATE_2ae1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_b84a_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2533_l2521_DUPLICATE_2ae1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2512_l2509_l2496_l2533_l2521_l2517_DUPLICATE_bf73_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e86f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2512_l2509_l2496_l2533_l2521_l2517_DUPLICATE_bf73_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_de2a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2512_l2509_l2496_l2533_l2521_l2517_DUPLICATE_bf73_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4d47_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2512_l2509_l2496_l2533_l2521_l2517_DUPLICATE_bf73_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_7d96_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2512_l2509_l2496_l2533_l2521_l2517_DUPLICATE_bf73_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_b84a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2512_l2509_l2496_l2533_l2521_l2517_DUPLICATE_bf73_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2496_c2_9834_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2496_c2_9834_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2496_c2_9834_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2496_c2_9834_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_226c_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_9383_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2533_c7_b84a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_b84a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_b84a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_b84a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_b84a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_b84a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_b84a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_b84a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_b84a_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2518_c3_e0a5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2518_c3_e0a5_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_e0a5_left;
     BIN_OP_OR_uxn_opcodes_h_l2518_c3_e0a5_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_e0a5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_e0a5_return_output := BIN_OP_OR_uxn_opcodes_h_l2518_c3_e0a5_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2496_c2_9834] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_9834_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_9834_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_9834_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_9834_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_41ac LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_41ac_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_41ac_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_41ac_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_41ac_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2526_c3_c1bc] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2526_c3_c1bc_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_c1bc_left;
     BIN_OP_OR_uxn_opcodes_h_l2526_c3_c1bc_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_c1bc_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_c1bc_return_output := BIN_OP_OR_uxn_opcodes_h_l2526_c3_c1bc_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2496_c2_9834] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_9834_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_9834_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_9834_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_9834_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2533_c7_b84a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_b84a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_b84a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_b84a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_b84a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_b84a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_b84a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_b84a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_b84a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2536_c21_1d8d] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2536_c21_1d8d_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2536_c31_b07e_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2525_c7_226c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_226c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_226c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_226c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_226c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_226c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_226c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_226c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_226c_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2496_c2_9834] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_9834_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_9834_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_9834_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_9834_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2496_c2_9834] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_9834_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_9834_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_9834_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_9834_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2533_c7_b84a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_b84a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_b84a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_b84a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_b84a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_b84a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_b84a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_b84a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_b84a_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2517_c7_4d47_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_e0a5_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_444d_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_c1bc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2525_c7_226c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_c1bc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_b84a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2536_c21_1d8d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2521_c7_7d96_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_41ac_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2512_c7_de2a_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_41ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_226c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_b84a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_7d96_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_226c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_226c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_b84a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_226c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_b84a_return_output;
     -- BIN_OP_MINUS[uxn_opcodes_h_l2527_c11_444d] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_444d_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_444d_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_444d_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_444d_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_444d_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_444d_return_output;

     -- t16_MUX[uxn_opcodes_h_l2517_c7_4d47] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2517_c7_4d47_cond <= VAR_t16_MUX_uxn_opcodes_h_l2517_c7_4d47_cond;
     t16_MUX_uxn_opcodes_h_l2517_c7_4d47_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2517_c7_4d47_iftrue;
     t16_MUX_uxn_opcodes_h_l2517_c7_4d47_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2517_c7_4d47_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output := t16_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2521_c7_7d96] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_7d96_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_7d96_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_7d96_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_7d96_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_7d96_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_7d96_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_7d96_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_7d96_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2525_c7_226c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_226c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_226c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_226c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_226c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_226c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_226c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_226c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_226c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2533_c7_b84a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2533_c7_b84a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_b84a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2533_c7_b84a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_b84a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2533_c7_b84a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_b84a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_b84a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2533_c7_b84a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2525_c7_226c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_226c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_226c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_226c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_226c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_226c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_226c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_226c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_226c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2525_c7_226c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2525_c7_226c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2525_c7_226c_cond;
     n16_MUX_uxn_opcodes_h_l2525_c7_226c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2525_c7_226c_iftrue;
     n16_MUX_uxn_opcodes_h_l2525_c7_226c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2525_c7_226c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2525_c7_226c_return_output := n16_MUX_uxn_opcodes_h_l2525_c7_226c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2525_c7_226c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_226c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_226c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_226c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_226c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_226c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_226c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_226c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_226c_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_226c_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_444d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2521_c7_7d96_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2525_c7_226c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_7d96_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_226c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4d47_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_7d96_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_7d96_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_226c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_7d96_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_226c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_226c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_b84a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2512_c7_de2a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output;
     -- t16_MUX[uxn_opcodes_h_l2512_c7_de2a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2512_c7_de2a_cond <= VAR_t16_MUX_uxn_opcodes_h_l2512_c7_de2a_cond;
     t16_MUX_uxn_opcodes_h_l2512_c7_de2a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2512_c7_de2a_iftrue;
     t16_MUX_uxn_opcodes_h_l2512_c7_de2a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2512_c7_de2a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output := t16_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2525_c7_226c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2525_c7_226c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_226c_cond;
     tmp16_MUX_uxn_opcodes_h_l2525_c7_226c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_226c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2525_c7_226c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_226c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_226c_return_output := tmp16_MUX_uxn_opcodes_h_l2525_c7_226c_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2531_c21_5a69] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2531_c21_5a69_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_444d_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2521_c7_7d96] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_7d96_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_7d96_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_7d96_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_7d96_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_7d96_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_7d96_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_7d96_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_7d96_return_output;

     -- n16_MUX[uxn_opcodes_h_l2521_c7_7d96] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2521_c7_7d96_cond <= VAR_n16_MUX_uxn_opcodes_h_l2521_c7_7d96_cond;
     n16_MUX_uxn_opcodes_h_l2521_c7_7d96_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2521_c7_7d96_iftrue;
     n16_MUX_uxn_opcodes_h_l2521_c7_7d96_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2521_c7_7d96_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2521_c7_7d96_return_output := n16_MUX_uxn_opcodes_h_l2521_c7_7d96_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2517_c7_4d47] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4d47_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4d47_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4d47_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4d47_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4d47_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4d47_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2521_c7_7d96] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_7d96_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_7d96_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_7d96_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_7d96_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_7d96_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_7d96_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_7d96_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_7d96_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2521_c7_7d96] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_7d96_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_7d96_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_7d96_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_7d96_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_7d96_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_7d96_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_7d96_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_7d96_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_226c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2531_c21_5a69_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2517_c7_4d47_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2521_c7_7d96_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4d47_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_7d96_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_de2a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4d47_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_7d96_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4d47_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_7d96_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2509_c7_e86f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_7d96_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_226c_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2517_c7_4d47] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4d47_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4d47_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4d47_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4d47_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4d47_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4d47_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2512_c7_de2a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_de2a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_de2a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_de2a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_de2a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_de2a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_de2a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2517_c7_4d47] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4d47_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4d47_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4d47_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4d47_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4d47_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4d47_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output;

     -- n16_MUX[uxn_opcodes_h_l2517_c7_4d47] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2517_c7_4d47_cond <= VAR_n16_MUX_uxn_opcodes_h_l2517_c7_4d47_cond;
     n16_MUX_uxn_opcodes_h_l2517_c7_4d47_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2517_c7_4d47_iftrue;
     n16_MUX_uxn_opcodes_h_l2517_c7_4d47_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2517_c7_4d47_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output := n16_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2521_c7_7d96] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2521_c7_7d96_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_7d96_cond;
     tmp16_MUX_uxn_opcodes_h_l2521_c7_7d96_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_7d96_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2521_c7_7d96_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_7d96_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_7d96_return_output := tmp16_MUX_uxn_opcodes_h_l2521_c7_7d96_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2517_c7_4d47] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4d47_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4d47_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4d47_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4d47_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4d47_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4d47_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2525_c7_226c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2525_c7_226c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_226c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2525_c7_226c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_226c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2525_c7_226c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_226c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_226c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2525_c7_226c_return_output;

     -- t16_MUX[uxn_opcodes_h_l2509_c7_e86f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2509_c7_e86f_cond <= VAR_t16_MUX_uxn_opcodes_h_l2509_c7_e86f_cond;
     t16_MUX_uxn_opcodes_h_l2509_c7_e86f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2509_c7_e86f_iftrue;
     t16_MUX_uxn_opcodes_h_l2509_c7_e86f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2509_c7_e86f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output := t16_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2512_c7_de2a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_de2a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e86f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_de2a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_de2a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_7d96_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_226c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_4d47_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_7d96_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2521_c7_7d96] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2521_c7_7d96_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_7d96_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2521_c7_7d96_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_7d96_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2521_c7_7d96_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_7d96_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_7d96_return_output := result_u8_value_MUX_uxn_opcodes_h_l2521_c7_7d96_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2512_c7_de2a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_de2a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_de2a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_de2a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_de2a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_de2a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_de2a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2509_c7_e86f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e86f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e86f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e86f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e86f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e86f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e86f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output;

     -- n16_MUX[uxn_opcodes_h_l2512_c7_de2a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2512_c7_de2a_cond <= VAR_n16_MUX_uxn_opcodes_h_l2512_c7_de2a_cond;
     n16_MUX_uxn_opcodes_h_l2512_c7_de2a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2512_c7_de2a_iftrue;
     n16_MUX_uxn_opcodes_h_l2512_c7_de2a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2512_c7_de2a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output := n16_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2512_c7_de2a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_de2a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_de2a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_de2a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_de2a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_de2a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_de2a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2517_c7_4d47] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2517_c7_4d47_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_4d47_cond;
     tmp16_MUX_uxn_opcodes_h_l2517_c7_4d47_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_4d47_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2517_c7_4d47_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_4d47_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output := tmp16_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output;

     -- t16_MUX[uxn_opcodes_h_l2496_c2_9834] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2496_c2_9834_cond <= VAR_t16_MUX_uxn_opcodes_h_l2496_c2_9834_cond;
     t16_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue;
     t16_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2496_c2_9834_return_output := t16_MUX_uxn_opcodes_h_l2496_c2_9834_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2512_c7_de2a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_de2a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_de2a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_de2a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_de2a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_de2a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_de2a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2509_c7_e86f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e86f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e86f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e86f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4d47_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_7d96_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2496_c2_9834_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_de2a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2512_c7_de2a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2512_c7_de2a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_de2a_cond;
     tmp16_MUX_uxn_opcodes_h_l2512_c7_de2a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_de2a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2512_c7_de2a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_de2a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output := tmp16_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2509_c7_e86f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e86f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e86f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e86f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e86f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e86f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e86f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2509_c7_e86f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e86f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e86f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e86f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e86f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e86f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e86f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2509_c7_e86f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e86f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e86f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e86f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e86f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e86f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e86f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output;

     -- n16_MUX[uxn_opcodes_h_l2509_c7_e86f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2509_c7_e86f_cond <= VAR_n16_MUX_uxn_opcodes_h_l2509_c7_e86f_cond;
     n16_MUX_uxn_opcodes_h_l2509_c7_e86f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2509_c7_e86f_iftrue;
     n16_MUX_uxn_opcodes_h_l2509_c7_e86f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2509_c7_e86f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output := n16_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2517_c7_4d47] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4d47_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4d47_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4d47_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4d47_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4d47_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4d47_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output := result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2496_c2_9834] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_9834_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_9834_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_9834_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_9834_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_de2a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4d47_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_e86f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2496_c2_9834] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_9834_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_9834_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_9834_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_9834_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2512_c7_de2a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2512_c7_de2a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_de2a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2512_c7_de2a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_de2a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2512_c7_de2a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_de2a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2496_c2_9834] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_9834_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_9834_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_9834_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_9834_return_output;

     -- n16_MUX[uxn_opcodes_h_l2496_c2_9834] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2496_c2_9834_cond <= VAR_n16_MUX_uxn_opcodes_h_l2496_c2_9834_cond;
     n16_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue;
     n16_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2496_c2_9834_return_output := n16_MUX_uxn_opcodes_h_l2496_c2_9834_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2496_c2_9834] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_9834_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_9834_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_9834_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_9834_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2509_c7_e86f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2509_c7_e86f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_e86f_cond;
     tmp16_MUX_uxn_opcodes_h_l2509_c7_e86f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_e86f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2509_c7_e86f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_e86f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output := tmp16_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2496_c2_9834_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e86f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_de2a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2509_c7_e86f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e86f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e86f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e86f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e86f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e86f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e86f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2496_c2_9834] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2496_c2_9834_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_9834_cond;
     tmp16_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_9834_return_output := tmp16_MUX_uxn_opcodes_h_l2496_c2_9834_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e86f_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_9834_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2496_c2_9834] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2496_c2_9834_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_9834_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_9834_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_9834_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_9834_return_output := result_u8_value_MUX_uxn_opcodes_h_l2496_c2_9834_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l2540_l2492_DUPLICATE_7796 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l2540_l2492_DUPLICATE_7796_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_ee25(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_9834_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_9834_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_9834_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_9834_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_9834_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_9834_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_9834_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_9834_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_9834_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l2540_l2492_DUPLICATE_7796_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l2540_l2492_DUPLICATE_7796_return_output;
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
