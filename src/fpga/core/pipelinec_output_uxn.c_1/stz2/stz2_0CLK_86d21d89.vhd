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
-- Submodules: 87
entity stz2_0CLK_86d21d89 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end stz2_0CLK_86d21d89;
architecture arch of stz2_0CLK_86d21d89 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1680_c6_c1ec]
signal BIN_OP_EQ_uxn_opcodes_h_l1680_c6_c1ec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1680_c6_c1ec_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1680_c6_c1ec_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1680_c2_547a]
signal t8_MUX_uxn_opcodes_h_l1680_c2_547a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1680_c2_547a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1680_c2_547a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_547a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_547a_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1680_c2_547a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_547a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_547a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1680_c2_547a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_547a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_547a_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1680_c2_547a]
signal result_ram_value_MUX_uxn_opcodes_h_l1680_c2_547a_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1680_c2_547a_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1680_c2_547a]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_547a_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_547a_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1680_c2_547a]
signal result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_547a_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_547a_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1680_c2_547a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_547a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_547a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1680_c2_547a]
signal n16_MUX_uxn_opcodes_h_l1680_c2_547a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1680_c2_547a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1685_c11_6477]
signal BIN_OP_EQ_uxn_opcodes_h_l1685_c11_6477_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1685_c11_6477_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1685_c11_6477_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1685_c7_f1a3]
signal t8_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1685_c7_f1a3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1685_c7_f1a3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1685_c7_f1a3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1685_c7_f1a3]
signal result_ram_value_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1685_c7_f1a3]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1685_c7_f1a3]
signal result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1685_c7_f1a3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1685_c7_f1a3]
signal n16_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1688_c11_6860]
signal BIN_OP_EQ_uxn_opcodes_h_l1688_c11_6860_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1688_c11_6860_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1688_c11_6860_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1688_c7_34c5]
signal t8_MUX_uxn_opcodes_h_l1688_c7_34c5_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1688_c7_34c5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_34c5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1688_c7_34c5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_34c5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1688_c7_34c5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_34c5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1688_c7_34c5]
signal result_ram_value_MUX_uxn_opcodes_h_l1688_c7_34c5_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1688_c7_34c5]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_34c5_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1688_c7_34c5]
signal result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_34c5_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1688_c7_34c5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_34c5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1688_c7_34c5]
signal n16_MUX_uxn_opcodes_h_l1688_c7_34c5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1692_c11_df1a]
signal BIN_OP_EQ_uxn_opcodes_h_l1692_c11_df1a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1692_c11_df1a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1692_c11_df1a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1692_c7_3939]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_3939_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_3939_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_3939_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_3939_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1692_c7_3939]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_3939_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_3939_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_3939_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_3939_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1692_c7_3939]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_3939_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_3939_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_3939_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_3939_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1692_c7_3939]
signal result_ram_value_MUX_uxn_opcodes_h_l1692_c7_3939_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1692_c7_3939_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1692_c7_3939_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1692_c7_3939_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1692_c7_3939]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_3939_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_3939_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_3939_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_3939_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1692_c7_3939]
signal result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_3939_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_3939_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_3939_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_3939_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1692_c7_3939]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_3939_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_3939_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_3939_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_3939_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1692_c7_3939]
signal n16_MUX_uxn_opcodes_h_l1692_c7_3939_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1692_c7_3939_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1692_c7_3939_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1692_c7_3939_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1695_c11_915a]
signal BIN_OP_EQ_uxn_opcodes_h_l1695_c11_915a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1695_c11_915a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1695_c11_915a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1695_c7_0133]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0133_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0133_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0133_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0133_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1695_c7_0133]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0133_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0133_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0133_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0133_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1695_c7_0133]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0133_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0133_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0133_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0133_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1695_c7_0133]
signal result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0133_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0133_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0133_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0133_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1695_c7_0133]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0133_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0133_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0133_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0133_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1695_c7_0133]
signal result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0133_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0133_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0133_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0133_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1695_c7_0133]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0133_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0133_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0133_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0133_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1695_c7_0133]
signal n16_MUX_uxn_opcodes_h_l1695_c7_0133_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1695_c7_0133_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1695_c7_0133_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1695_c7_0133_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1697_c3_fcbb]
signal CONST_SL_8_uxn_opcodes_h_l1697_c3_fcbb_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1697_c3_fcbb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1700_c11_f321]
signal BIN_OP_EQ_uxn_opcodes_h_l1700_c11_f321_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1700_c11_f321_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1700_c11_f321_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1700_c7_8684]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_8684_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_8684_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_8684_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_8684_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1700_c7_8684]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_8684_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_8684_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_8684_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_8684_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1700_c7_8684]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_8684_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_8684_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_8684_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_8684_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1700_c7_8684]
signal result_ram_value_MUX_uxn_opcodes_h_l1700_c7_8684_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1700_c7_8684_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1700_c7_8684_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1700_c7_8684_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1700_c7_8684]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_8684_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_8684_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_8684_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_8684_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1700_c7_8684]
signal result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_8684_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_8684_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_8684_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_8684_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1700_c7_8684]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_8684_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_8684_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_8684_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_8684_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1700_c7_8684]
signal n16_MUX_uxn_opcodes_h_l1700_c7_8684_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1700_c7_8684_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1700_c7_8684_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1700_c7_8684_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1703_c11_7404]
signal BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7404_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7404_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7404_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1703_c7_a77b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_a77b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_a77b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_a77b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_a77b_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1703_c7_a77b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_a77b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_a77b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_a77b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_a77b_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1703_c7_a77b]
signal result_ram_value_MUX_uxn_opcodes_h_l1703_c7_a77b_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1703_c7_a77b_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1703_c7_a77b_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1703_c7_a77b_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1703_c7_a77b]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_a77b_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_a77b_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_a77b_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_a77b_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1703_c7_a77b]
signal result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_a77b_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_a77b_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_a77b_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_a77b_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1703_c7_a77b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_a77b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_a77b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_a77b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_a77b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1703_c7_a77b]
signal n16_MUX_uxn_opcodes_h_l1703_c7_a77b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1703_c7_a77b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1703_c7_a77b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1703_c7_a77b_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1704_c3_8c60]
signal BIN_OP_OR_uxn_opcodes_h_l1704_c3_8c60_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1704_c3_8c60_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1704_c3_8c60_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1706_c32_d400]
signal BIN_OP_AND_uxn_opcodes_h_l1706_c32_d400_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1706_c32_d400_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1706_c32_d400_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1706_c32_e724]
signal BIN_OP_GT_uxn_opcodes_h_l1706_c32_e724_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1706_c32_e724_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1706_c32_e724_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1706_c32_e599]
signal MUX_uxn_opcodes_h_l1706_c32_e599_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1706_c32_e599_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1706_c32_e599_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1706_c32_e599_return_output : signed(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1709_c32_de74]
signal CONST_SR_8_uxn_opcodes_h_l1709_c32_de74_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1709_c32_de74_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1711_c11_3c72]
signal BIN_OP_EQ_uxn_opcodes_h_l1711_c11_3c72_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1711_c11_3c72_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1711_c11_3c72_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1711_c7_00b3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_00b3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_00b3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_00b3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_00b3_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1711_c7_00b3]
signal result_ram_value_MUX_uxn_opcodes_h_l1711_c7_00b3_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1711_c7_00b3_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1711_c7_00b3_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1711_c7_00b3_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1711_c7_00b3]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_00b3_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_00b3_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_00b3_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_00b3_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1711_c7_00b3]
signal result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_00b3_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_00b3_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_00b3_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_00b3_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1711_c7_00b3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_00b3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_00b3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_00b3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_00b3_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1713_c32_99ad]
signal BIN_OP_PLUS_uxn_opcodes_h_l1713_c32_99ad_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1713_c32_99ad_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1713_c32_99ad_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1716_c11_993f]
signal BIN_OP_EQ_uxn_opcodes_h_l1716_c11_993f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1716_c11_993f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1716_c11_993f_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1716_c7_cc42]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_cc42_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_cc42_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_cc42_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_cc42_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1716_c7_cc42]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_cc42_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_cc42_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_cc42_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_cc42_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint9_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(8 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_4841( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.ram_value := ref_toks_4;
      base.is_ram_write := ref_toks_5;
      base.ram_addr := ref_toks_6;
      base.is_opc_done := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1680_c6_c1ec
BIN_OP_EQ_uxn_opcodes_h_l1680_c6_c1ec : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1680_c6_c1ec_left,
BIN_OP_EQ_uxn_opcodes_h_l1680_c6_c1ec_right,
BIN_OP_EQ_uxn_opcodes_h_l1680_c6_c1ec_return_output);

-- t8_MUX_uxn_opcodes_h_l1680_c2_547a
t8_MUX_uxn_opcodes_h_l1680_c2_547a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1680_c2_547a_cond,
t8_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue,
t8_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse,
t8_MUX_uxn_opcodes_h_l1680_c2_547a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_547a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_547a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_547a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_547a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_547a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_547a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_547a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_547a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_547a
result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_547a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_547a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_547a_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1680_c2_547a
result_ram_value_MUX_uxn_opcodes_h_l1680_c2_547a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1680_c2_547a_cond,
result_ram_value_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1680_c2_547a_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_547a
result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_547a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_547a_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_547a_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_547a
result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_547a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_547a_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_547a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_547a
result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_547a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_547a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_547a_return_output);

-- n16_MUX_uxn_opcodes_h_l1680_c2_547a
n16_MUX_uxn_opcodes_h_l1680_c2_547a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1680_c2_547a_cond,
n16_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue,
n16_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse,
n16_MUX_uxn_opcodes_h_l1680_c2_547a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1685_c11_6477
BIN_OP_EQ_uxn_opcodes_h_l1685_c11_6477 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1685_c11_6477_left,
BIN_OP_EQ_uxn_opcodes_h_l1685_c11_6477_right,
BIN_OP_EQ_uxn_opcodes_h_l1685_c11_6477_return_output);

-- t8_MUX_uxn_opcodes_h_l1685_c7_f1a3
t8_MUX_uxn_opcodes_h_l1685_c7_f1a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond,
t8_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue,
t8_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse,
t8_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_f1a3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_f1a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3
result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1685_c7_f1a3
result_ram_value_MUX_uxn_opcodes_h_l1685_c7_f1a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond,
result_ram_value_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_f1a3
result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_f1a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_f1a3
result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_f1a3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_f1a3
result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_f1a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output);

-- n16_MUX_uxn_opcodes_h_l1685_c7_f1a3
n16_MUX_uxn_opcodes_h_l1685_c7_f1a3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond,
n16_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue,
n16_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse,
n16_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1688_c11_6860
BIN_OP_EQ_uxn_opcodes_h_l1688_c11_6860 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1688_c11_6860_left,
BIN_OP_EQ_uxn_opcodes_h_l1688_c11_6860_right,
BIN_OP_EQ_uxn_opcodes_h_l1688_c11_6860_return_output);

-- t8_MUX_uxn_opcodes_h_l1688_c7_34c5
t8_MUX_uxn_opcodes_h_l1688_c7_34c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1688_c7_34c5_cond,
t8_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue,
t8_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse,
t8_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_34c5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_34c5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_34c5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_34c5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_34c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_34c5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_34c5
result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_34c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_34c5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1688_c7_34c5
result_ram_value_MUX_uxn_opcodes_h_l1688_c7_34c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1688_c7_34c5_cond,
result_ram_value_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_34c5
result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_34c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_34c5_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_34c5
result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_34c5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_34c5_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_34c5
result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_34c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_34c5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output);

-- n16_MUX_uxn_opcodes_h_l1688_c7_34c5
n16_MUX_uxn_opcodes_h_l1688_c7_34c5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1688_c7_34c5_cond,
n16_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue,
n16_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse,
n16_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1692_c11_df1a
BIN_OP_EQ_uxn_opcodes_h_l1692_c11_df1a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1692_c11_df1a_left,
BIN_OP_EQ_uxn_opcodes_h_l1692_c11_df1a_right,
BIN_OP_EQ_uxn_opcodes_h_l1692_c11_df1a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_3939
result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_3939 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_3939_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_3939_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_3939_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_3939_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_3939
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_3939 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_3939_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_3939_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_3939_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_3939_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_3939
result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_3939 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_3939_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_3939_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_3939_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_3939_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1692_c7_3939
result_ram_value_MUX_uxn_opcodes_h_l1692_c7_3939 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1692_c7_3939_cond,
result_ram_value_MUX_uxn_opcodes_h_l1692_c7_3939_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1692_c7_3939_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1692_c7_3939_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_3939
result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_3939 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_3939_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_3939_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_3939_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_3939_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_3939
result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_3939 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_3939_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_3939_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_3939_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_3939_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_3939
result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_3939 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_3939_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_3939_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_3939_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_3939_return_output);

-- n16_MUX_uxn_opcodes_h_l1692_c7_3939
n16_MUX_uxn_opcodes_h_l1692_c7_3939 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1692_c7_3939_cond,
n16_MUX_uxn_opcodes_h_l1692_c7_3939_iftrue,
n16_MUX_uxn_opcodes_h_l1692_c7_3939_iffalse,
n16_MUX_uxn_opcodes_h_l1692_c7_3939_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1695_c11_915a
BIN_OP_EQ_uxn_opcodes_h_l1695_c11_915a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1695_c11_915a_left,
BIN_OP_EQ_uxn_opcodes_h_l1695_c11_915a_right,
BIN_OP_EQ_uxn_opcodes_h_l1695_c11_915a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0133
result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0133 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0133_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0133_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0133_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0133_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0133
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0133 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0133_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0133_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0133_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0133_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0133
result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0133 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0133_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0133_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0133_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0133_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0133
result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0133 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0133_cond,
result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0133_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0133_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0133_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0133
result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0133 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0133_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0133_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0133_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0133_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0133
result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0133 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0133_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0133_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0133_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0133_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0133
result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0133 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0133_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0133_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0133_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0133_return_output);

-- n16_MUX_uxn_opcodes_h_l1695_c7_0133
n16_MUX_uxn_opcodes_h_l1695_c7_0133 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1695_c7_0133_cond,
n16_MUX_uxn_opcodes_h_l1695_c7_0133_iftrue,
n16_MUX_uxn_opcodes_h_l1695_c7_0133_iffalse,
n16_MUX_uxn_opcodes_h_l1695_c7_0133_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1697_c3_fcbb
CONST_SL_8_uxn_opcodes_h_l1697_c3_fcbb : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1697_c3_fcbb_x,
CONST_SL_8_uxn_opcodes_h_l1697_c3_fcbb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1700_c11_f321
BIN_OP_EQ_uxn_opcodes_h_l1700_c11_f321 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1700_c11_f321_left,
BIN_OP_EQ_uxn_opcodes_h_l1700_c11_f321_right,
BIN_OP_EQ_uxn_opcodes_h_l1700_c11_f321_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_8684
result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_8684 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_8684_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_8684_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_8684_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_8684_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_8684
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_8684 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_8684_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_8684_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_8684_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_8684_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_8684
result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_8684 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_8684_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_8684_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_8684_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_8684_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1700_c7_8684
result_ram_value_MUX_uxn_opcodes_h_l1700_c7_8684 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1700_c7_8684_cond,
result_ram_value_MUX_uxn_opcodes_h_l1700_c7_8684_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1700_c7_8684_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1700_c7_8684_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_8684
result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_8684 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_8684_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_8684_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_8684_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_8684_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_8684
result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_8684 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_8684_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_8684_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_8684_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_8684_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_8684
result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_8684 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_8684_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_8684_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_8684_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_8684_return_output);

-- n16_MUX_uxn_opcodes_h_l1700_c7_8684
n16_MUX_uxn_opcodes_h_l1700_c7_8684 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1700_c7_8684_cond,
n16_MUX_uxn_opcodes_h_l1700_c7_8684_iftrue,
n16_MUX_uxn_opcodes_h_l1700_c7_8684_iffalse,
n16_MUX_uxn_opcodes_h_l1700_c7_8684_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7404
BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7404 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7404_left,
BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7404_right,
BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7404_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_a77b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_a77b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_a77b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_a77b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_a77b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_a77b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_a77b
result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_a77b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_a77b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_a77b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_a77b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_a77b_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1703_c7_a77b
result_ram_value_MUX_uxn_opcodes_h_l1703_c7_a77b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1703_c7_a77b_cond,
result_ram_value_MUX_uxn_opcodes_h_l1703_c7_a77b_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1703_c7_a77b_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1703_c7_a77b_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_a77b
result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_a77b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_a77b_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_a77b_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_a77b_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_a77b_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_a77b
result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_a77b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_a77b_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_a77b_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_a77b_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_a77b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_a77b
result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_a77b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_a77b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_a77b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_a77b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_a77b_return_output);

-- n16_MUX_uxn_opcodes_h_l1703_c7_a77b
n16_MUX_uxn_opcodes_h_l1703_c7_a77b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1703_c7_a77b_cond,
n16_MUX_uxn_opcodes_h_l1703_c7_a77b_iftrue,
n16_MUX_uxn_opcodes_h_l1703_c7_a77b_iffalse,
n16_MUX_uxn_opcodes_h_l1703_c7_a77b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1704_c3_8c60
BIN_OP_OR_uxn_opcodes_h_l1704_c3_8c60 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1704_c3_8c60_left,
BIN_OP_OR_uxn_opcodes_h_l1704_c3_8c60_right,
BIN_OP_OR_uxn_opcodes_h_l1704_c3_8c60_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1706_c32_d400
BIN_OP_AND_uxn_opcodes_h_l1706_c32_d400 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1706_c32_d400_left,
BIN_OP_AND_uxn_opcodes_h_l1706_c32_d400_right,
BIN_OP_AND_uxn_opcodes_h_l1706_c32_d400_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1706_c32_e724
BIN_OP_GT_uxn_opcodes_h_l1706_c32_e724 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1706_c32_e724_left,
BIN_OP_GT_uxn_opcodes_h_l1706_c32_e724_right,
BIN_OP_GT_uxn_opcodes_h_l1706_c32_e724_return_output);

-- MUX_uxn_opcodes_h_l1706_c32_e599
MUX_uxn_opcodes_h_l1706_c32_e599 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1706_c32_e599_cond,
MUX_uxn_opcodes_h_l1706_c32_e599_iftrue,
MUX_uxn_opcodes_h_l1706_c32_e599_iffalse,
MUX_uxn_opcodes_h_l1706_c32_e599_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1709_c32_de74
CONST_SR_8_uxn_opcodes_h_l1709_c32_de74 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1709_c32_de74_x,
CONST_SR_8_uxn_opcodes_h_l1709_c32_de74_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1711_c11_3c72
BIN_OP_EQ_uxn_opcodes_h_l1711_c11_3c72 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1711_c11_3c72_left,
BIN_OP_EQ_uxn_opcodes_h_l1711_c11_3c72_right,
BIN_OP_EQ_uxn_opcodes_h_l1711_c11_3c72_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_00b3
result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_00b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_00b3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_00b3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_00b3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_00b3_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1711_c7_00b3
result_ram_value_MUX_uxn_opcodes_h_l1711_c7_00b3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1711_c7_00b3_cond,
result_ram_value_MUX_uxn_opcodes_h_l1711_c7_00b3_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1711_c7_00b3_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1711_c7_00b3_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_00b3
result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_00b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_00b3_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_00b3_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_00b3_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_00b3_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_00b3
result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_00b3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_00b3_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_00b3_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_00b3_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_00b3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_00b3
result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_00b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_00b3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_00b3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_00b3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_00b3_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1713_c32_99ad
BIN_OP_PLUS_uxn_opcodes_h_l1713_c32_99ad : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1713_c32_99ad_left,
BIN_OP_PLUS_uxn_opcodes_h_l1713_c32_99ad_right,
BIN_OP_PLUS_uxn_opcodes_h_l1713_c32_99ad_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1716_c11_993f
BIN_OP_EQ_uxn_opcodes_h_l1716_c11_993f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1716_c11_993f_left,
BIN_OP_EQ_uxn_opcodes_h_l1716_c11_993f_right,
BIN_OP_EQ_uxn_opcodes_h_l1716_c11_993f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_cc42
result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_cc42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_cc42_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_cc42_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_cc42_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_cc42_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_cc42
result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_cc42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_cc42_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_cc42_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_cc42_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_cc42_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1680_c6_c1ec_return_output,
 t8_MUX_uxn_opcodes_h_l1680_c2_547a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_547a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_547a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_547a_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1680_c2_547a_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_547a_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_547a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_547a_return_output,
 n16_MUX_uxn_opcodes_h_l1680_c2_547a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1685_c11_6477_return_output,
 t8_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output,
 n16_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1688_c11_6860_return_output,
 t8_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output,
 n16_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1692_c11_df1a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_3939_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_3939_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_3939_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1692_c7_3939_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_3939_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_3939_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_3939_return_output,
 n16_MUX_uxn_opcodes_h_l1692_c7_3939_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1695_c11_915a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0133_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0133_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0133_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0133_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0133_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0133_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0133_return_output,
 n16_MUX_uxn_opcodes_h_l1695_c7_0133_return_output,
 CONST_SL_8_uxn_opcodes_h_l1697_c3_fcbb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1700_c11_f321_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_8684_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_8684_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_8684_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1700_c7_8684_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_8684_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_8684_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_8684_return_output,
 n16_MUX_uxn_opcodes_h_l1700_c7_8684_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7404_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_a77b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_a77b_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1703_c7_a77b_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_a77b_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_a77b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_a77b_return_output,
 n16_MUX_uxn_opcodes_h_l1703_c7_a77b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1704_c3_8c60_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1706_c32_d400_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1706_c32_e724_return_output,
 MUX_uxn_opcodes_h_l1706_c32_e599_return_output,
 CONST_SR_8_uxn_opcodes_h_l1709_c32_de74_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1711_c11_3c72_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_00b3_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1711_c7_00b3_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_00b3_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_00b3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_00b3_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1713_c32_99ad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1716_c11_993f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_cc42_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_cc42_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c6_c1ec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c6_c1ec_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c6_c1ec_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1680_c2_547a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1680_c2_547a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_547a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_547a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1682_c3_3a2c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_547a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_547a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_547a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_547a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1680_c2_547a_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1680_c2_547a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_547a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_547a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_547a_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_547a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_547a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_547a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1680_c2_547a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1680_c2_547a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_6477_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_6477_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_6477_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1686_c3_636d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_6860_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_6860_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_6860_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1688_c7_34c5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_3939_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_34c5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1690_c3_868e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_3939_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_34c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_3939_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_34c5_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1692_c7_3939_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1688_c7_34c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_3939_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_34c5_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_3939_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_34c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_3939_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_34c5_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1692_c7_3939_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1688_c7_34c5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_df1a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_df1a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_df1a_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_3939_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_3939_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0133_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_3939_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_3939_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1693_c3_7b58 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_3939_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0133_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_3939_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_3939_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_3939_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0133_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_3939_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1692_c7_3939_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1692_c7_3939_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0133_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1692_c7_3939_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_3939_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_3939_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0133_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_3939_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_3939_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_3939_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0133_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_3939_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_3939_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_3939_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0133_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_3939_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1692_c7_3939_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1692_c7_3939_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1695_c7_0133_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1692_c7_3939_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_915a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_915a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_915a_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0133_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0133_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_8684_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0133_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0133_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1698_c3_7398 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0133_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_8684_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0133_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0133_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0133_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_8684_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0133_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0133_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0133_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1700_c7_8684_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0133_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0133_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0133_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_8684_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0133_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0133_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0133_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_8684_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0133_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0133_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0133_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_8684_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0133_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1695_c7_0133_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1695_c7_0133_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1700_c7_8684_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1695_c7_0133_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1697_c3_fcbb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1697_c3_fcbb_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_f321_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_f321_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_f321_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_8684_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_8684_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_a77b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_8684_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_8684_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1701_c3_516d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_8684_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1700_c7_8684_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_8684_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_8684_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_8684_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_a77b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_8684_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1700_c7_8684_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1700_c7_8684_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1703_c7_a77b_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1700_c7_8684_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_8684_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_8684_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_a77b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_8684_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_8684_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_8684_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_a77b_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_8684_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_8684_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_8684_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_a77b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_8684_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1700_c7_8684_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1700_c7_8684_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1703_c7_a77b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1700_c7_8684_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7404_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7404_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7404_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_a77b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_a77b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_a77b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_a77b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_a77b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_00b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_a77b_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1703_c7_a77b_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1703_c7_a77b_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1711_c7_00b3_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1703_c7_a77b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_a77b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_a77b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_00b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_a77b_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_a77b_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_a77b_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_00b3_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_a77b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_a77b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_a77b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_00b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_a77b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1703_c7_a77b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1703_c7_a77b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1703_c7_a77b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1704_c3_8c60_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1704_c3_8c60_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1704_c3_8c60_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1706_c32_e599_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1706_c32_e599_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1706_c32_e599_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1706_c32_d400_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1706_c32_d400_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1706_c32_d400_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1706_c32_e724_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1706_c32_e724_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1706_c32_e724_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1706_c32_e599_return_output : signed(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1708_c21_d000_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1709_c32_de74_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1709_c32_de74_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1709_c22_9fbf_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1711_c11_3c72_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1711_c11_3c72_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1711_c11_3c72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_00b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_00b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_00b3_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1711_c7_00b3_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1711_c7_00b3_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1711_c7_00b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_00b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_00b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_cc42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_00b3_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_00b3_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_00b3_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_00b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_00b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_00b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_cc42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_00b3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1713_c32_99ad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1713_c32_99ad_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1713_c32_99ad_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1713_c21_f9d0_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1714_c22_235d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1716_c11_993f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1716_c11_993f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1716_c11_993f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_cc42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_cc42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_cc42_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_cc42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_cc42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_cc42_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1688_l1685_l1680_l1703_l1700_l1695_l1692_DUPLICATE_354a_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1688_l1685_l1711_l1680_l1700_l1695_l1692_DUPLICATE_f9fa_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1688_l1685_l1711_l1680_l1700_l1695_l1692_DUPLICATE_3950_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1688_l1716_l1685_l1711_l1680_l1700_l1695_l1692_DUPLICATE_4fea_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1688_l1685_l1711_l1680_l1700_l1695_l1692_DUPLICATE_5fb8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1688_l1716_l1685_l1711_l1703_l1700_l1695_l1692_DUPLICATE_e3a1_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1704_l1696_DUPLICATE_7aa2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4841_uxn_opcodes_h_l1721_l1674_DUPLICATE_9cc9_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7404_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1693_c3_7b58 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_3939_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1693_c3_7b58;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_6477_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1701_c3_516d := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_8684_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1701_c3_516d;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_cc42_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_a77b_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_00b3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1713_c32_99ad_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1706_c32_d400_right := to_unsigned(128, 8);
     VAR_MUX_uxn_opcodes_h_l1706_c32_e599_iffalse := resize(to_signed(-3, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_915a_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1690_c3_868e := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1690_c3_868e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_6860_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1686_c3_636d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1686_c3_636d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1716_c11_993f_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c6_c1ec_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_df1a_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1682_c3_3a2c := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1682_c3_3a2c;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_a77b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_f321_right := to_unsigned(5, 3);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1706_c32_e724_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1698_c3_7398 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0133_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1698_c3_7398;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1711_c11_3c72_right := to_unsigned(7, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_cc42_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1706_c32_e599_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue := to_unsigned(0, 1);

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
     VAR_BIN_OP_AND_uxn_opcodes_h_l1706_c32_d400_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1704_c3_8c60_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1692_c7_3939_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1700_c7_8684_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1703_c7_a77b_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c6_c1ec_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_6477_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_6860_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_df1a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_915a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_f321_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7404_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1711_c11_3c72_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1716_c11_993f_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1713_c32_99ad_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse := t8;
     -- BIN_OP_PLUS[uxn_opcodes_h_l1713_c32_99ad] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1713_c32_99ad_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1713_c32_99ad_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1713_c32_99ad_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1713_c32_99ad_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1713_c32_99ad_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1713_c32_99ad_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1688_l1716_l1685_l1711_l1680_l1700_l1695_l1692_DUPLICATE_4fea LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1688_l1716_l1685_l1711_l1680_l1700_l1695_l1692_DUPLICATE_4fea_return_output := result.is_ram_write;

     -- BIN_OP_AND[uxn_opcodes_h_l1706_c32_d400] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1706_c32_d400_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1706_c32_d400_left;
     BIN_OP_AND_uxn_opcodes_h_l1706_c32_d400_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1706_c32_d400_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1706_c32_d400_return_output := BIN_OP_AND_uxn_opcodes_h_l1706_c32_d400_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1688_l1716_l1685_l1711_l1703_l1700_l1695_l1692_DUPLICATE_e3a1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1688_l1716_l1685_l1711_l1703_l1700_l1695_l1692_DUPLICATE_e3a1_return_output := result.is_opc_done;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1714_c22_235d] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1714_c22_235d_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1688_l1685_l1711_l1680_l1700_l1695_l1692_DUPLICATE_3950 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1688_l1685_l1711_l1680_l1700_l1695_l1692_DUPLICATE_3950_return_output := result.ram_value;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1708_c21_d000] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1708_c21_d000_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1704_l1696_DUPLICATE_7aa2 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1704_l1696_DUPLICATE_7aa2_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1685_c11_6477] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1685_c11_6477_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_6477_left;
     BIN_OP_EQ_uxn_opcodes_h_l1685_c11_6477_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_6477_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_6477_return_output := BIN_OP_EQ_uxn_opcodes_h_l1685_c11_6477_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1688_l1685_l1680_l1703_l1700_l1695_l1692_DUPLICATE_354a LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1688_l1685_l1680_l1703_l1700_l1695_l1692_DUPLICATE_354a_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1703_c11_7404] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7404_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7404_left;
     BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7404_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7404_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7404_return_output := BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7404_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1688_l1685_l1711_l1680_l1700_l1695_l1692_DUPLICATE_5fb8 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1688_l1685_l1711_l1680_l1700_l1695_l1692_DUPLICATE_5fb8_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l1692_c11_df1a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1692_c11_df1a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_df1a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1692_c11_df1a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_df1a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_df1a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1692_c11_df1a_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1700_c7_8684] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1700_c7_8684_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1700_c11_f321] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1700_c11_f321_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_f321_left;
     BIN_OP_EQ_uxn_opcodes_h_l1700_c11_f321_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_f321_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_f321_return_output := BIN_OP_EQ_uxn_opcodes_h_l1700_c11_f321_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1695_c11_915a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1695_c11_915a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_915a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1695_c11_915a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_915a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_915a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1695_c11_915a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1680_c6_c1ec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1680_c6_c1ec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c6_c1ec_left;
     BIN_OP_EQ_uxn_opcodes_h_l1680_c6_c1ec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c6_c1ec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c6_c1ec_return_output := BIN_OP_EQ_uxn_opcodes_h_l1680_c6_c1ec_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1688_l1685_l1711_l1680_l1700_l1695_l1692_DUPLICATE_f9fa LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1688_l1685_l1711_l1680_l1700_l1695_l1692_DUPLICATE_f9fa_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1716_c11_993f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1716_c11_993f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1716_c11_993f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1716_c11_993f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1716_c11_993f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1716_c11_993f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1716_c11_993f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1711_c11_3c72] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1711_c11_3c72_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1711_c11_3c72_left;
     BIN_OP_EQ_uxn_opcodes_h_l1711_c11_3c72_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1711_c11_3c72_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1711_c11_3c72_return_output := BIN_OP_EQ_uxn_opcodes_h_l1711_c11_3c72_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1688_c11_6860] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1688_c11_6860_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_6860_left;
     BIN_OP_EQ_uxn_opcodes_h_l1688_c11_6860_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_6860_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_6860_return_output := BIN_OP_EQ_uxn_opcodes_h_l1688_c11_6860_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1706_c32_e724_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1706_c32_d400_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1680_c2_547a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c6_c1ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_547a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c6_c1ec_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_547a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c6_c1ec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_547a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c6_c1ec_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_547a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c6_c1ec_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1680_c2_547a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c6_c1ec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_547a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c6_c1ec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_547a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c6_c1ec_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1680_c2_547a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c6_c1ec_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_6477_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_6477_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_6477_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_6477_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_6477_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_6477_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_6477_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_6477_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_6477_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1688_c7_34c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_6860_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_34c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_6860_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_34c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_6860_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_34c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_6860_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_34c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_6860_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1688_c7_34c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_6860_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_34c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_6860_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_34c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_6860_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1688_c7_34c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_6860_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1692_c7_3939_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_df1a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_3939_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_df1a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_3939_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_df1a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_3939_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_df1a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_3939_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_df1a_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1692_c7_3939_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_df1a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_3939_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_df1a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_3939_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_df1a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1695_c7_0133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_915a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_915a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_915a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_915a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_915a_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_915a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_915a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_915a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1700_c7_8684_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_f321_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_8684_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_f321_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_8684_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_f321_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_8684_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_f321_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_8684_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_f321_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1700_c7_8684_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_f321_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_8684_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_f321_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_8684_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_f321_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1703_c7_a77b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7404_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_a77b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7404_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_a77b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7404_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_a77b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7404_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_a77b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7404_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1703_c7_a77b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7404_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_a77b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7404_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_00b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1711_c11_3c72_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_00b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1711_c11_3c72_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_00b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1711_c11_3c72_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_00b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1711_c11_3c72_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1711_c7_00b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1711_c11_3c72_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_cc42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1716_c11_993f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_cc42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1716_c11_993f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_a77b_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1708_c21_d000_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1704_c3_8c60_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1704_l1696_DUPLICATE_7aa2_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1697_c3_fcbb_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1704_l1696_DUPLICATE_7aa2_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1711_c7_00b3_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1714_c22_235d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1688_l1685_l1680_l1703_l1700_l1695_l1692_DUPLICATE_354a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1688_l1685_l1680_l1703_l1700_l1695_l1692_DUPLICATE_354a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1688_l1685_l1680_l1703_l1700_l1695_l1692_DUPLICATE_354a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_3939_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1688_l1685_l1680_l1703_l1700_l1695_l1692_DUPLICATE_354a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0133_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1688_l1685_l1680_l1703_l1700_l1695_l1692_DUPLICATE_354a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_8684_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1688_l1685_l1680_l1703_l1700_l1695_l1692_DUPLICATE_354a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_a77b_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1688_l1685_l1680_l1703_l1700_l1695_l1692_DUPLICATE_354a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1688_l1685_l1711_l1680_l1700_l1695_l1692_DUPLICATE_5fb8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1688_l1685_l1711_l1680_l1700_l1695_l1692_DUPLICATE_5fb8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1688_l1685_l1711_l1680_l1700_l1695_l1692_DUPLICATE_5fb8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_3939_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1688_l1685_l1711_l1680_l1700_l1695_l1692_DUPLICATE_5fb8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0133_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1688_l1685_l1711_l1680_l1700_l1695_l1692_DUPLICATE_5fb8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_8684_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1688_l1685_l1711_l1680_l1700_l1695_l1692_DUPLICATE_5fb8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_00b3_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1688_l1685_l1711_l1680_l1700_l1695_l1692_DUPLICATE_5fb8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1688_l1716_l1685_l1711_l1703_l1700_l1695_l1692_DUPLICATE_e3a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1688_l1716_l1685_l1711_l1703_l1700_l1695_l1692_DUPLICATE_e3a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_3939_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1688_l1716_l1685_l1711_l1703_l1700_l1695_l1692_DUPLICATE_e3a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0133_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1688_l1716_l1685_l1711_l1703_l1700_l1695_l1692_DUPLICATE_e3a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_8684_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1688_l1716_l1685_l1711_l1703_l1700_l1695_l1692_DUPLICATE_e3a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_a77b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1688_l1716_l1685_l1711_l1703_l1700_l1695_l1692_DUPLICATE_e3a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_00b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1688_l1716_l1685_l1711_l1703_l1700_l1695_l1692_DUPLICATE_e3a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_cc42_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1688_l1716_l1685_l1711_l1703_l1700_l1695_l1692_DUPLICATE_e3a1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1688_l1716_l1685_l1711_l1680_l1700_l1695_l1692_DUPLICATE_4fea_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1688_l1716_l1685_l1711_l1680_l1700_l1695_l1692_DUPLICATE_4fea_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1688_l1716_l1685_l1711_l1680_l1700_l1695_l1692_DUPLICATE_4fea_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_3939_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1688_l1716_l1685_l1711_l1680_l1700_l1695_l1692_DUPLICATE_4fea_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0133_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1688_l1716_l1685_l1711_l1680_l1700_l1695_l1692_DUPLICATE_4fea_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_8684_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1688_l1716_l1685_l1711_l1680_l1700_l1695_l1692_DUPLICATE_4fea_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_00b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1688_l1716_l1685_l1711_l1680_l1700_l1695_l1692_DUPLICATE_4fea_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_cc42_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1688_l1716_l1685_l1711_l1680_l1700_l1695_l1692_DUPLICATE_4fea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1688_l1685_l1711_l1680_l1700_l1695_l1692_DUPLICATE_f9fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1688_l1685_l1711_l1680_l1700_l1695_l1692_DUPLICATE_f9fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1688_l1685_l1711_l1680_l1700_l1695_l1692_DUPLICATE_f9fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_3939_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1688_l1685_l1711_l1680_l1700_l1695_l1692_DUPLICATE_f9fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0133_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1688_l1685_l1711_l1680_l1700_l1695_l1692_DUPLICATE_f9fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_8684_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1688_l1685_l1711_l1680_l1700_l1695_l1692_DUPLICATE_f9fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_00b3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1688_l1685_l1711_l1680_l1700_l1695_l1692_DUPLICATE_f9fa_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1688_l1685_l1711_l1680_l1700_l1695_l1692_DUPLICATE_3950_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1688_l1685_l1711_l1680_l1700_l1695_l1692_DUPLICATE_3950_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1688_l1685_l1711_l1680_l1700_l1695_l1692_DUPLICATE_3950_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1692_c7_3939_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1688_l1685_l1711_l1680_l1700_l1695_l1692_DUPLICATE_3950_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0133_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1688_l1685_l1711_l1680_l1700_l1695_l1692_DUPLICATE_3950_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1700_c7_8684_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1688_l1685_l1711_l1680_l1700_l1695_l1692_DUPLICATE_3950_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1711_c7_00b3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1688_l1685_l1711_l1680_l1700_l1695_l1692_DUPLICATE_3950_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_8684_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1700_c7_8684_return_output;
     -- CONST_SL_8[uxn_opcodes_h_l1697_c3_fcbb] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1697_c3_fcbb_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1697_c3_fcbb_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1697_c3_fcbb_return_output := CONST_SL_8_uxn_opcodes_h_l1697_c3_fcbb_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1713_c21_f9d0] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1713_c21_f9d0_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1713_c32_99ad_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1716_c7_cc42] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_cc42_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_cc42_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_cc42_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_cc42_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_cc42_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_cc42_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_cc42_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_cc42_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1711_c7_00b3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_00b3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_00b3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_00b3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_00b3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_00b3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_00b3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_00b3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_00b3_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1716_c7_cc42] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_cc42_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_cc42_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_cc42_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_cc42_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_cc42_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_cc42_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_cc42_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_cc42_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1706_c32_e724] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1706_c32_e724_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1706_c32_e724_left;
     BIN_OP_GT_uxn_opcodes_h_l1706_c32_e724_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1706_c32_e724_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1706_c32_e724_return_output := BIN_OP_GT_uxn_opcodes_h_l1706_c32_e724_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1711_c7_00b3] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1711_c7_00b3_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1711_c7_00b3_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1711_c7_00b3_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1711_c7_00b3_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1711_c7_00b3_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1711_c7_00b3_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1711_c7_00b3_return_output := result_ram_value_MUX_uxn_opcodes_h_l1711_c7_00b3_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1704_c3_8c60] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1704_c3_8c60_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1704_c3_8c60_left;
     BIN_OP_OR_uxn_opcodes_h_l1704_c3_8c60_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1704_c3_8c60_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1704_c3_8c60_return_output := BIN_OP_OR_uxn_opcodes_h_l1704_c3_8c60_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1700_c7_8684] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_8684_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_8684_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_8684_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_8684_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_8684_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_8684_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_8684_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_8684_return_output;

     -- t8_MUX[uxn_opcodes_h_l1688_c7_34c5] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1688_c7_34c5_cond <= VAR_t8_MUX_uxn_opcodes_h_l1688_c7_34c5_cond;
     t8_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue;
     t8_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output := t8_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1706_c32_e599_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1706_c32_e724_return_output;
     VAR_CONST_SR_8_uxn_opcodes_h_l1709_c32_de74_x := VAR_BIN_OP_OR_uxn_opcodes_h_l1704_c3_8c60_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1703_c7_a77b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1704_c3_8c60_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_00b3_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1713_c21_f9d0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1695_c7_0133_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1697_c3_fcbb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_00b3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_cc42_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_00b3_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_cc42_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_a77b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_00b3_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1703_c7_a77b_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1711_c7_00b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0133_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_8684_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1695_c7_0133] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0133_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0133_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0133_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0133_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0133_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0133_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0133_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0133_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1711_c7_00b3] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_00b3_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_00b3_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_00b3_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_00b3_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_00b3_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_00b3_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_00b3_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_00b3_return_output;

     -- n16_MUX[uxn_opcodes_h_l1703_c7_a77b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1703_c7_a77b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1703_c7_a77b_cond;
     n16_MUX_uxn_opcodes_h_l1703_c7_a77b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1703_c7_a77b_iftrue;
     n16_MUX_uxn_opcodes_h_l1703_c7_a77b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1703_c7_a77b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1703_c7_a77b_return_output := n16_MUX_uxn_opcodes_h_l1703_c7_a77b_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1711_c7_00b3] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_00b3_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_00b3_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_00b3_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_00b3_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_00b3_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_00b3_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_00b3_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_00b3_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1709_c32_de74] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1709_c32_de74_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1709_c32_de74_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1709_c32_de74_return_output := CONST_SR_8_uxn_opcodes_h_l1709_c32_de74_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1703_c7_a77b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_a77b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_a77b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_a77b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_a77b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_a77b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_a77b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_a77b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_a77b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1711_c7_00b3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_00b3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_00b3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_00b3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_00b3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_00b3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_00b3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_00b3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_00b3_return_output;

     -- t8_MUX[uxn_opcodes_h_l1685_c7_f1a3] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond <= VAR_t8_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond;
     t8_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue;
     t8_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output := t8_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output;

     -- MUX[uxn_opcodes_h_l1706_c32_e599] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1706_c32_e599_cond <= VAR_MUX_uxn_opcodes_h_l1706_c32_e599_cond;
     MUX_uxn_opcodes_h_l1706_c32_e599_iftrue <= VAR_MUX_uxn_opcodes_h_l1706_c32_e599_iftrue;
     MUX_uxn_opcodes_h_l1706_c32_e599_iffalse <= VAR_MUX_uxn_opcodes_h_l1706_c32_e599_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1706_c32_e599_return_output := MUX_uxn_opcodes_h_l1706_c32_e599_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_a77b_iftrue := VAR_MUX_uxn_opcodes_h_l1706_c32_e599_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1700_c7_8684_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1703_c7_a77b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_a77b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_00b3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_a77b_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_00b3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_8684_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_a77b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_a77b_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_00b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_3939_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0133_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1703_c7_a77b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_a77b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_a77b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_a77b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_a77b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_a77b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_a77b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_a77b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_a77b_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1703_c7_a77b] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_a77b_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_a77b_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_a77b_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_a77b_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_a77b_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_a77b_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_a77b_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_a77b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1700_c7_8684] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_8684_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_8684_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_8684_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_8684_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_8684_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_8684_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_8684_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_8684_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1703_c7_a77b] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_a77b_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_a77b_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_a77b_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_a77b_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_a77b_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_a77b_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_a77b_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_a77b_return_output;

     -- t8_MUX[uxn_opcodes_h_l1680_c2_547a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1680_c2_547a_cond <= VAR_t8_MUX_uxn_opcodes_h_l1680_c2_547a_cond;
     t8_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue;
     t8_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1680_c2_547a_return_output := t8_MUX_uxn_opcodes_h_l1680_c2_547a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1703_c7_a77b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_a77b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_a77b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_a77b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_a77b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_a77b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_a77b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_a77b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_a77b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1700_c7_8684] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1700_c7_8684_cond <= VAR_n16_MUX_uxn_opcodes_h_l1700_c7_8684_cond;
     n16_MUX_uxn_opcodes_h_l1700_c7_8684_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1700_c7_8684_iftrue;
     n16_MUX_uxn_opcodes_h_l1700_c7_8684_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1700_c7_8684_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1700_c7_8684_return_output := n16_MUX_uxn_opcodes_h_l1700_c7_8684_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1692_c7_3939] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_3939_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_3939_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_3939_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_3939_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_3939_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_3939_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_3939_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_3939_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1709_c22_9fbf] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1709_c22_9fbf_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1709_c32_de74_return_output);

     -- Submodule level 4
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1703_c7_a77b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1709_c22_9fbf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1695_c7_0133_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1700_c7_8684_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_8684_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_a77b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_8684_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_a77b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0133_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_8684_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_8684_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_a77b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_8684_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_a77b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_3939_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1680_c2_547a_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1700_c7_8684] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_8684_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_8684_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_8684_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_8684_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_8684_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_8684_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_8684_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_8684_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1688_c7_34c5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_34c5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_34c5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1700_c7_8684] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_8684_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_8684_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_8684_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_8684_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_8684_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_8684_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_8684_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_8684_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1695_c7_0133] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0133_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0133_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0133_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0133_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0133_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0133_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0133_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0133_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1703_c7_a77b] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1703_c7_a77b_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1703_c7_a77b_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1703_c7_a77b_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1703_c7_a77b_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1703_c7_a77b_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1703_c7_a77b_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1703_c7_a77b_return_output := result_ram_value_MUX_uxn_opcodes_h_l1703_c7_a77b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1695_c7_0133] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1695_c7_0133_cond <= VAR_n16_MUX_uxn_opcodes_h_l1695_c7_0133_cond;
     n16_MUX_uxn_opcodes_h_l1695_c7_0133_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1695_c7_0133_iftrue;
     n16_MUX_uxn_opcodes_h_l1695_c7_0133_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1695_c7_0133_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1695_c7_0133_return_output := n16_MUX_uxn_opcodes_h_l1695_c7_0133_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1700_c7_8684] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_8684_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_8684_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_8684_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_8684_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_8684_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_8684_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_8684_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_8684_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1700_c7_8684] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_8684_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_8684_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_8684_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_8684_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_8684_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_8684_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_8684_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_8684_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1692_c7_3939_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1695_c7_0133_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0133_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_8684_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0133_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_8684_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_3939_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0133_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0133_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_8684_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1700_c7_8684_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1703_c7_a77b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0133_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_8684_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1695_c7_0133] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0133_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0133_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0133_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0133_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0133_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0133_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0133_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0133_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1685_c7_f1a3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1695_c7_0133] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0133_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0133_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0133_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0133_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0133_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0133_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0133_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0133_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1695_c7_0133] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0133_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0133_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0133_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0133_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0133_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0133_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0133_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0133_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1695_c7_0133] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0133_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0133_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0133_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0133_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0133_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0133_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0133_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0133_return_output;

     -- n16_MUX[uxn_opcodes_h_l1692_c7_3939] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1692_c7_3939_cond <= VAR_n16_MUX_uxn_opcodes_h_l1692_c7_3939_cond;
     n16_MUX_uxn_opcodes_h_l1692_c7_3939_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1692_c7_3939_iftrue;
     n16_MUX_uxn_opcodes_h_l1692_c7_3939_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1692_c7_3939_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1692_c7_3939_return_output := n16_MUX_uxn_opcodes_h_l1692_c7_3939_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1700_c7_8684] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1700_c7_8684_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1700_c7_8684_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1700_c7_8684_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1700_c7_8684_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1700_c7_8684_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1700_c7_8684_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1700_c7_8684_return_output := result_ram_value_MUX_uxn_opcodes_h_l1700_c7_8684_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1692_c7_3939] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_3939_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_3939_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_3939_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_3939_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_3939_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_3939_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_3939_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_3939_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1692_c7_3939_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_3939_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0133_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_3939_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0133_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_3939_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_3939_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0133_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0133_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1700_c7_8684_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_3939_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0133_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1692_c7_3939] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_3939_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_3939_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_3939_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_3939_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_3939_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_3939_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_3939_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_3939_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1692_c7_3939] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_3939_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_3939_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_3939_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_3939_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_3939_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_3939_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_3939_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_3939_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1692_c7_3939] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_3939_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_3939_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_3939_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_3939_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_3939_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_3939_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_3939_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_3939_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1680_c2_547a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_547a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_547a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_547a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_547a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1688_c7_34c5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_34c5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_34c5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1692_c7_3939] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_3939_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_3939_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_3939_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_3939_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_3939_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_3939_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_3939_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_3939_return_output;

     -- n16_MUX[uxn_opcodes_h_l1688_c7_34c5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1688_c7_34c5_cond <= VAR_n16_MUX_uxn_opcodes_h_l1688_c7_34c5_cond;
     n16_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue;
     n16_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output := n16_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1695_c7_0133] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0133_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0133_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0133_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0133_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0133_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0133_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0133_return_output := result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0133_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_3939_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_3939_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_3939_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1692_c7_3939_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0133_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_3939_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l1692_c7_3939] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1692_c7_3939_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1692_c7_3939_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1692_c7_3939_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1692_c7_3939_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1692_c7_3939_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1692_c7_3939_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1692_c7_3939_return_output := result_ram_value_MUX_uxn_opcodes_h_l1692_c7_3939_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1685_c7_f1a3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1688_c7_34c5] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_34c5_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_34c5_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output;

     -- n16_MUX[uxn_opcodes_h_l1685_c7_f1a3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond <= VAR_n16_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond;
     n16_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue;
     n16_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output := n16_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1688_c7_34c5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_34c5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_34c5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1688_c7_34c5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_34c5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_34c5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1688_c7_34c5] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_34c5_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_34c5_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1692_c7_3939_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1680_c2_547a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_547a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_547a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_547a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_547a_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1685_c7_f1a3] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1685_c7_f1a3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1685_c7_f1a3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1688_c7_34c5] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1688_c7_34c5_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1688_c7_34c5_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1688_c7_34c5_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1688_c7_34c5_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output := result_ram_value_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output;

     -- n16_MUX[uxn_opcodes_h_l1680_c2_547a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1680_c2_547a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1680_c2_547a_cond;
     n16_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue;
     n16_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1680_c2_547a_return_output := n16_MUX_uxn_opcodes_h_l1680_c2_547a_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1685_c7_f1a3] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output;

     -- Submodule level 9
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1680_c2_547a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1688_c7_34c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1680_c2_547a] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_547a_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_547a_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_547a_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_547a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1680_c2_547a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_547a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_547a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_547a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_547a_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1680_c2_547a] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_547a_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_547a_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_547a_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_547a_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1685_c7_f1a3] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1685_c7_f1a3_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1685_c7_f1a3_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1685_c7_f1a3_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output := result_ram_value_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1680_c2_547a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_547a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_547a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_547a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_547a_return_output;

     -- Submodule level 10
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1685_c7_f1a3_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l1680_c2_547a] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1680_c2_547a_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1680_c2_547a_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1680_c2_547a_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1680_c2_547a_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1680_c2_547a_return_output := result_ram_value_MUX_uxn_opcodes_h_l1680_c2_547a_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4841_uxn_opcodes_h_l1721_l1674_DUPLICATE_9cc9 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4841_uxn_opcodes_h_l1721_l1674_DUPLICATE_9cc9_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4841(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_547a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_547a_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_547a_return_output,
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1680_c2_547a_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_547a_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_547a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_547a_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4841_uxn_opcodes_h_l1721_l1674_DUPLICATE_9cc9_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4841_uxn_opcodes_h_l1721_l1674_DUPLICATE_9cc9_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
