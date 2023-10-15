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
-- Submodules: 55
entity ldr_0CLK_df07acae is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ldr_0CLK_df07acae;
architecture arch of ldr_0CLK_df07acae is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1728_c6_1c5d]
signal BIN_OP_EQ_uxn_opcodes_h_l1728_c6_1c5d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1728_c6_1c5d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1728_c6_1c5d_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1728_c2_016a]
signal t8_MUX_uxn_opcodes_h_l1728_c2_016a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1728_c2_016a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1728_c2_016a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_016a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_016a_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1728_c2_016a]
signal result_stack_value_MUX_uxn_opcodes_h_l1728_c2_016a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1728_c2_016a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1728_c2_016a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_016a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_016a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1728_c2_016a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_016a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_016a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1728_c2_016a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_016a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_016a_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1728_c2_016a]
signal result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_016a_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_016a_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1728_c2_016a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_016a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_016a_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1728_c2_016a]
signal tmp8_MUX_uxn_opcodes_h_l1728_c2_016a_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1728_c2_016a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1733_c11_6cdd]
signal BIN_OP_EQ_uxn_opcodes_h_l1733_c11_6cdd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1733_c11_6cdd_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1733_c11_6cdd_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1733_c7_f513]
signal t8_MUX_uxn_opcodes_h_l1733_c7_f513_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1733_c7_f513_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1733_c7_f513]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f513_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f513_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1733_c7_f513]
signal result_stack_value_MUX_uxn_opcodes_h_l1733_c7_f513_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1733_c7_f513_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1733_c7_f513]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f513_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f513_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1733_c7_f513]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_f513_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_f513_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1733_c7_f513]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_f513_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_f513_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1733_c7_f513]
signal result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_f513_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_f513_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1733_c7_f513]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f513_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f513_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1733_c7_f513]
signal tmp8_MUX_uxn_opcodes_h_l1733_c7_f513_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1733_c7_f513_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1736_c11_7307]
signal BIN_OP_EQ_uxn_opcodes_h_l1736_c11_7307_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1736_c11_7307_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1736_c11_7307_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1736_c7_4cca]
signal t8_MUX_uxn_opcodes_h_l1736_c7_4cca_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1736_c7_4cca]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_4cca_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1736_c7_4cca]
signal result_stack_value_MUX_uxn_opcodes_h_l1736_c7_4cca_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1736_c7_4cca]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_4cca_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1736_c7_4cca]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_4cca_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1736_c7_4cca]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_4cca_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1736_c7_4cca]
signal result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_4cca_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1736_c7_4cca]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_4cca_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1736_c7_4cca]
signal tmp8_MUX_uxn_opcodes_h_l1736_c7_4cca_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1739_c32_dc69]
signal BIN_OP_AND_uxn_opcodes_h_l1739_c32_dc69_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1739_c32_dc69_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1739_c32_dc69_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1739_c32_1de3]
signal BIN_OP_GT_uxn_opcodes_h_l1739_c32_1de3_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1739_c32_1de3_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1739_c32_1de3_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1739_c32_595b]
signal MUX_uxn_opcodes_h_l1739_c32_595b_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1739_c32_595b_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1739_c32_595b_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1739_c32_595b_return_output : signed(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1740_c21_ae8c]
signal BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_ae8c_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_ae8c_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_ae8c_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1742_c11_9181]
signal BIN_OP_EQ_uxn_opcodes_h_l1742_c11_9181_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1742_c11_9181_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1742_c11_9181_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1742_c7_f724]
signal result_stack_value_MUX_uxn_opcodes_h_l1742_c7_f724_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1742_c7_f724_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1742_c7_f724_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1742_c7_f724_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1742_c7_f724]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_f724_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_f724_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_f724_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_f724_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1742_c7_f724]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_f724_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_f724_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_f724_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_f724_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1742_c7_f724]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_f724_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_f724_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_f724_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_f724_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1742_c7_f724]
signal result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_f724_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_f724_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_f724_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_f724_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1742_c7_f724]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f724_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f724_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f724_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f724_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1742_c7_f724]
signal tmp8_MUX_uxn_opcodes_h_l1742_c7_f724_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1742_c7_f724_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1742_c7_f724_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1742_c7_f724_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1744_c21_91b4]
signal BIN_OP_PLUS_uxn_opcodes_h_l1744_c21_91b4_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1744_c21_91b4_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1744_c21_91b4_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1746_c11_20df]
signal BIN_OP_EQ_uxn_opcodes_h_l1746_c11_20df_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1746_c11_20df_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1746_c11_20df_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1746_c7_7667]
signal result_stack_value_MUX_uxn_opcodes_h_l1746_c7_7667_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1746_c7_7667_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1746_c7_7667_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1746_c7_7667_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1746_c7_7667]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_7667_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_7667_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_7667_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_7667_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1746_c7_7667]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_7667_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_7667_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_7667_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_7667_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1746_c7_7667]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_7667_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_7667_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_7667_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_7667_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1746_c7_7667]
signal tmp8_MUX_uxn_opcodes_h_l1746_c7_7667_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1746_c7_7667_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1746_c7_7667_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1746_c7_7667_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1752_c11_d7f8]
signal BIN_OP_EQ_uxn_opcodes_h_l1752_c11_d7f8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1752_c11_d7f8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1752_c11_d7f8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1752_c7_2dc3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2dc3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2dc3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2dc3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2dc3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1752_c7_2dc3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2dc3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2dc3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2dc3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2dc3_return_output : unsigned(0 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_a287( ref_toks_0 : opcode_result_t;
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
      base.stack_value := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.ram_addr := ref_toks_6;
      base.is_opc_done := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1728_c6_1c5d
BIN_OP_EQ_uxn_opcodes_h_l1728_c6_1c5d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1728_c6_1c5d_left,
BIN_OP_EQ_uxn_opcodes_h_l1728_c6_1c5d_right,
BIN_OP_EQ_uxn_opcodes_h_l1728_c6_1c5d_return_output);

-- t8_MUX_uxn_opcodes_h_l1728_c2_016a
t8_MUX_uxn_opcodes_h_l1728_c2_016a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1728_c2_016a_cond,
t8_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue,
t8_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse,
t8_MUX_uxn_opcodes_h_l1728_c2_016a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_016a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_016a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_016a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_016a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1728_c2_016a
result_stack_value_MUX_uxn_opcodes_h_l1728_c2_016a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1728_c2_016a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1728_c2_016a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_016a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_016a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_016a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_016a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_016a
result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_016a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_016a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_016a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_016a
result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_016a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_016a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_016a_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_016a
result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_016a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_016a_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_016a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_016a
result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_016a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_016a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_016a_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1728_c2_016a
tmp8_MUX_uxn_opcodes_h_l1728_c2_016a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1728_c2_016a_cond,
tmp8_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue,
tmp8_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse,
tmp8_MUX_uxn_opcodes_h_l1728_c2_016a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1733_c11_6cdd
BIN_OP_EQ_uxn_opcodes_h_l1733_c11_6cdd : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1733_c11_6cdd_left,
BIN_OP_EQ_uxn_opcodes_h_l1733_c11_6cdd_right,
BIN_OP_EQ_uxn_opcodes_h_l1733_c11_6cdd_return_output);

-- t8_MUX_uxn_opcodes_h_l1733_c7_f513
t8_MUX_uxn_opcodes_h_l1733_c7_f513 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1733_c7_f513_cond,
t8_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue,
t8_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse,
t8_MUX_uxn_opcodes_h_l1733_c7_f513_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f513
result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f513 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f513_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f513_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1733_c7_f513
result_stack_value_MUX_uxn_opcodes_h_l1733_c7_f513 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1733_c7_f513_cond,
result_stack_value_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1733_c7_f513_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f513
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f513 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f513_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f513_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_f513
result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_f513 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_f513_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_f513_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_f513
result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_f513 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_f513_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_f513_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_f513
result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_f513 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_f513_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_f513_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f513
result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f513 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f513_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f513_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1733_c7_f513
tmp8_MUX_uxn_opcodes_h_l1733_c7_f513 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1733_c7_f513_cond,
tmp8_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue,
tmp8_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse,
tmp8_MUX_uxn_opcodes_h_l1733_c7_f513_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1736_c11_7307
BIN_OP_EQ_uxn_opcodes_h_l1736_c11_7307 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1736_c11_7307_left,
BIN_OP_EQ_uxn_opcodes_h_l1736_c11_7307_right,
BIN_OP_EQ_uxn_opcodes_h_l1736_c11_7307_return_output);

-- t8_MUX_uxn_opcodes_h_l1736_c7_4cca
t8_MUX_uxn_opcodes_h_l1736_c7_4cca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1736_c7_4cca_cond,
t8_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue,
t8_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse,
t8_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_4cca
result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_4cca : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_4cca_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1736_c7_4cca
result_stack_value_MUX_uxn_opcodes_h_l1736_c7_4cca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1736_c7_4cca_cond,
result_stack_value_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_4cca
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_4cca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_4cca_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_4cca
result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_4cca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_4cca_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_4cca
result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_4cca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_4cca_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_4cca
result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_4cca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_4cca_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_4cca
result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_4cca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_4cca_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1736_c7_4cca
tmp8_MUX_uxn_opcodes_h_l1736_c7_4cca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1736_c7_4cca_cond,
tmp8_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue,
tmp8_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse,
tmp8_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1739_c32_dc69
BIN_OP_AND_uxn_opcodes_h_l1739_c32_dc69 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1739_c32_dc69_left,
BIN_OP_AND_uxn_opcodes_h_l1739_c32_dc69_right,
BIN_OP_AND_uxn_opcodes_h_l1739_c32_dc69_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1739_c32_1de3
BIN_OP_GT_uxn_opcodes_h_l1739_c32_1de3 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1739_c32_1de3_left,
BIN_OP_GT_uxn_opcodes_h_l1739_c32_1de3_right,
BIN_OP_GT_uxn_opcodes_h_l1739_c32_1de3_return_output);

-- MUX_uxn_opcodes_h_l1739_c32_595b
MUX_uxn_opcodes_h_l1739_c32_595b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1739_c32_595b_cond,
MUX_uxn_opcodes_h_l1739_c32_595b_iftrue,
MUX_uxn_opcodes_h_l1739_c32_595b_iffalse,
MUX_uxn_opcodes_h_l1739_c32_595b_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_ae8c
BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_ae8c : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_ae8c_left,
BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_ae8c_right,
BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_ae8c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1742_c11_9181
BIN_OP_EQ_uxn_opcodes_h_l1742_c11_9181 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1742_c11_9181_left,
BIN_OP_EQ_uxn_opcodes_h_l1742_c11_9181_right,
BIN_OP_EQ_uxn_opcodes_h_l1742_c11_9181_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1742_c7_f724
result_stack_value_MUX_uxn_opcodes_h_l1742_c7_f724 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1742_c7_f724_cond,
result_stack_value_MUX_uxn_opcodes_h_l1742_c7_f724_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1742_c7_f724_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1742_c7_f724_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_f724
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_f724 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_f724_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_f724_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_f724_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_f724_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_f724
result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_f724 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_f724_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_f724_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_f724_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_f724_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_f724
result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_f724 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_f724_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_f724_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_f724_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_f724_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_f724
result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_f724 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_f724_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_f724_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_f724_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_f724_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f724
result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f724 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f724_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f724_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f724_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f724_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1742_c7_f724
tmp8_MUX_uxn_opcodes_h_l1742_c7_f724 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1742_c7_f724_cond,
tmp8_MUX_uxn_opcodes_h_l1742_c7_f724_iftrue,
tmp8_MUX_uxn_opcodes_h_l1742_c7_f724_iffalse,
tmp8_MUX_uxn_opcodes_h_l1742_c7_f724_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1744_c21_91b4
BIN_OP_PLUS_uxn_opcodes_h_l1744_c21_91b4 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1744_c21_91b4_left,
BIN_OP_PLUS_uxn_opcodes_h_l1744_c21_91b4_right,
BIN_OP_PLUS_uxn_opcodes_h_l1744_c21_91b4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1746_c11_20df
BIN_OP_EQ_uxn_opcodes_h_l1746_c11_20df : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1746_c11_20df_left,
BIN_OP_EQ_uxn_opcodes_h_l1746_c11_20df_right,
BIN_OP_EQ_uxn_opcodes_h_l1746_c11_20df_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1746_c7_7667
result_stack_value_MUX_uxn_opcodes_h_l1746_c7_7667 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1746_c7_7667_cond,
result_stack_value_MUX_uxn_opcodes_h_l1746_c7_7667_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1746_c7_7667_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1746_c7_7667_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_7667
result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_7667 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_7667_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_7667_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_7667_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_7667_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_7667
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_7667 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_7667_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_7667_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_7667_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_7667_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_7667
result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_7667 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_7667_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_7667_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_7667_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_7667_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1746_c7_7667
tmp8_MUX_uxn_opcodes_h_l1746_c7_7667 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1746_c7_7667_cond,
tmp8_MUX_uxn_opcodes_h_l1746_c7_7667_iftrue,
tmp8_MUX_uxn_opcodes_h_l1746_c7_7667_iffalse,
tmp8_MUX_uxn_opcodes_h_l1746_c7_7667_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1752_c11_d7f8
BIN_OP_EQ_uxn_opcodes_h_l1752_c11_d7f8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1752_c11_d7f8_left,
BIN_OP_EQ_uxn_opcodes_h_l1752_c11_d7f8_right,
BIN_OP_EQ_uxn_opcodes_h_l1752_c11_d7f8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2dc3
result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2dc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2dc3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2dc3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2dc3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2dc3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2dc3
result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2dc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2dc3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2dc3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2dc3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2dc3_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t8,
 tmp8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1728_c6_1c5d_return_output,
 t8_MUX_uxn_opcodes_h_l1728_c2_016a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_016a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1728_c2_016a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_016a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_016a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_016a_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_016a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_016a_return_output,
 tmp8_MUX_uxn_opcodes_h_l1728_c2_016a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1733_c11_6cdd_return_output,
 t8_MUX_uxn_opcodes_h_l1733_c7_f513_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f513_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1733_c7_f513_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f513_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_f513_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_f513_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_f513_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f513_return_output,
 tmp8_MUX_uxn_opcodes_h_l1733_c7_f513_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1736_c11_7307_return_output,
 t8_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output,
 tmp8_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1739_c32_dc69_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1739_c32_1de3_return_output,
 MUX_uxn_opcodes_h_l1739_c32_595b_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_ae8c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1742_c11_9181_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1742_c7_f724_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_f724_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_f724_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_f724_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_f724_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f724_return_output,
 tmp8_MUX_uxn_opcodes_h_l1742_c7_f724_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1744_c21_91b4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1746_c11_20df_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1746_c7_7667_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_7667_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_7667_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_7667_return_output,
 tmp8_MUX_uxn_opcodes_h_l1746_c7_7667_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1752_c11_d7f8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2dc3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2dc3_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c6_1c5d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c6_1c5d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c6_1c5d_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1733_c7_f513_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1728_c2_016a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1728_c2_016a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f513_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_016a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_016a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1733_c7_f513_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1728_c2_016a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1728_c2_016a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1730_c3_88c9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f513_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_016a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_016a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_f513_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_016a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_016a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_f513_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_016a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_016a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_f513_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_016a_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_016a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f513_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_016a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_016a_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1733_c7_f513_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1728_c2_016a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1728_c2_016a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_6cdd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_6cdd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_6cdd_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1733_c7_f513_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f513_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1733_c7_f513_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1734_c3_400f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f513_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_f513_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_f513_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_f513_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f513_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1733_c7_f513_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_7307_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_7307_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_7307_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1736_c7_4cca_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_4cca_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1742_c7_f724_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c7_4cca_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_f724_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_4cca_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_f724_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_4cca_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_f724_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_4cca_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1740_c3_561c : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_f724_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_4cca_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f724_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_4cca_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1742_c7_f724_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1736_c7_4cca_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1739_c32_595b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1739_c32_595b_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1739_c32_595b_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1739_c32_dc69_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1739_c32_dc69_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1739_c32_dc69_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1739_c32_1de3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1739_c32_1de3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1739_c32_1de3_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1739_c32_595b_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_ae8c_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1740_c26_21fd_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_ae8c_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_ae8c_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_9181_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_9181_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_9181_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1742_c7_f724_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1742_c7_f724_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1746_c7_7667_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1742_c7_f724_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_f724_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_f724_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_7667_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_f724_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_f724_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_f724_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_f724_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_f724_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_f724_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_7667_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_f724_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_f724_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1744_c3_b9fd : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_f724_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_f724_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f724_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f724_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_7667_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f724_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1742_c7_f724_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1742_c7_f724_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1746_c7_7667_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1742_c7_f724_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1744_c21_91b4_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1744_c26_8287_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1744_c21_91b4_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1744_c21_91b4_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1746_c11_20df_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1746_c11_20df_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1746_c11_20df_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1746_c7_7667_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1746_c7_7667_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1746_c7_7667_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_7667_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_7667_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2dc3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_7667_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_7667_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1749_c3_a37b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_7667_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_7667_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_7667_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_7667_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2dc3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_7667_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1746_c7_7667_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1746_c7_7667_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1746_c7_7667_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_d7f8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_d7f8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_d7f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2dc3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2dc3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2dc3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2dc3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2dc3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2dc3_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1728_l1733_l1736_DUPLICATE_dc2e_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1746_l1742_l1736_l1733_l1728_DUPLICATE_546a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1728_l1742_l1733_DUPLICATE_64bb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1752_l1742_l1736_l1733_l1728_DUPLICATE_c5f7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1728_l1742_l1733_DUPLICATE_11cc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1752_l1746_l1742_l1736_l1733_DUPLICATE_1e6b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1742_l1746_l1736_DUPLICATE_5cea_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a287_uxn_opcodes_h_l1757_l1724_DUPLICATE_bd2d_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_7307_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l1739_c32_595b_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1730_c3_88c9 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1730_c3_88c9;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_6cdd_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_7667_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1734_c3_400f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1734_c3_400f;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1739_c32_dc69_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_9181_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2dc3_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_f724_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1746_c11_20df_right := to_unsigned(3, 2);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1739_c32_1de3_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2dc3_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1749_c3_a37b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_7667_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1749_c3_a37b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c6_1c5d_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1739_c32_595b_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_d7f8_right := to_unsigned(4, 3);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_BIN_OP_AND_uxn_opcodes_h_l1739_c32_dc69_left := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_ae8c_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1744_c21_91b4_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c6_1c5d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_6cdd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_7307_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_9181_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1746_c11_20df_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_d7f8_left := VAR_phase;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1746_c7_7667_iftrue := VAR_previous_ram_read;
     VAR_tmp8_MUX_uxn_opcodes_h_l1746_c7_7667_iftrue := VAR_previous_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse := t8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1742_c7_f724_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1746_c7_7667_iffalse := tmp8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1752_c11_d7f8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1752_c11_d7f8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_d7f8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1752_c11_d7f8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_d7f8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_d7f8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1752_c11_d7f8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1742_c11_9181] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1742_c11_9181_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_9181_left;
     BIN_OP_EQ_uxn_opcodes_h_l1742_c11_9181_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_9181_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_9181_return_output := BIN_OP_EQ_uxn_opcodes_h_l1742_c11_9181_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1752_l1746_l1742_l1736_l1733_DUPLICATE_1e6b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1752_l1746_l1742_l1736_l1733_DUPLICATE_1e6b_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1728_l1742_l1733_DUPLICATE_11cc LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1728_l1742_l1733_DUPLICATE_11cc_return_output := result.ram_addr;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1746_l1742_l1736_l1733_l1728_DUPLICATE_546a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1746_l1742_l1736_l1733_l1728_DUPLICATE_546a_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1752_l1742_l1736_l1733_l1728_DUPLICATE_c5f7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1752_l1742_l1736_l1733_l1728_DUPLICATE_c5f7_return_output := result.is_stack_write;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1728_l1733_l1736_DUPLICATE_dc2e LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1728_l1733_l1736_DUPLICATE_dc2e_return_output := result.sp_relative_shift;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1740_c26_21fd] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1740_c26_21fd_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- CAST_TO_int8_t[uxn_opcodes_h_l1744_c26_8287] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1744_c26_8287_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- BIN_OP_AND[uxn_opcodes_h_l1739_c32_dc69] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1739_c32_dc69_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1739_c32_dc69_left;
     BIN_OP_AND_uxn_opcodes_h_l1739_c32_dc69_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1739_c32_dc69_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1739_c32_dc69_return_output := BIN_OP_AND_uxn_opcodes_h_l1739_c32_dc69_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1733_c11_6cdd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1733_c11_6cdd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_6cdd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1733_c11_6cdd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_6cdd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_6cdd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1733_c11_6cdd_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1742_l1746_l1736_DUPLICATE_5cea LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1742_l1746_l1736_DUPLICATE_5cea_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1728_l1742_l1733_DUPLICATE_64bb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1728_l1742_l1733_DUPLICATE_64bb_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1746_c11_20df] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1746_c11_20df_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1746_c11_20df_left;
     BIN_OP_EQ_uxn_opcodes_h_l1746_c11_20df_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1746_c11_20df_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1746_c11_20df_return_output := BIN_OP_EQ_uxn_opcodes_h_l1746_c11_20df_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1736_c11_7307] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1736_c11_7307_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_7307_left;
     BIN_OP_EQ_uxn_opcodes_h_l1736_c11_7307_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_7307_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_7307_return_output := BIN_OP_EQ_uxn_opcodes_h_l1736_c11_7307_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1728_c6_1c5d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1728_c6_1c5d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c6_1c5d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1728_c6_1c5d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c6_1c5d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c6_1c5d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1728_c6_1c5d_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1739_c32_1de3_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1739_c32_dc69_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_016a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c6_1c5d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_016a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c6_1c5d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_016a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c6_1c5d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_016a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c6_1c5d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_016a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c6_1c5d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_016a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c6_1c5d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1728_c2_016a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c6_1c5d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1728_c2_016a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c6_1c5d_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1728_c2_016a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c6_1c5d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f513_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_6cdd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_f513_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_6cdd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_f513_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_6cdd_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_f513_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_6cdd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f513_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_6cdd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f513_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_6cdd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1733_c7_f513_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_6cdd_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1733_c7_f513_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_6cdd_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1733_c7_f513_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_6cdd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_4cca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_7307_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_4cca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_7307_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_4cca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_7307_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_4cca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_7307_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_4cca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_7307_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_4cca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_7307_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c7_4cca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_7307_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1736_c7_4cca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_7307_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1736_c7_4cca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_7307_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f724_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_9181_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_f724_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_9181_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_f724_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_9181_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_f724_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_9181_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_f724_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_9181_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1742_c7_f724_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_9181_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1742_c7_f724_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_9181_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_7667_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1746_c11_20df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_7667_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1746_c11_20df_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_7667_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1746_c11_20df_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1746_c7_7667_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1746_c11_20df_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1746_c7_7667_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1746_c11_20df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2dc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_d7f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2dc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_d7f8_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_ae8c_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1740_c26_21fd_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1744_c21_91b4_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1744_c26_8287_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1728_l1733_l1736_DUPLICATE_dc2e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1728_l1733_l1736_DUPLICATE_dc2e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1728_l1733_l1736_DUPLICATE_dc2e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1728_l1742_l1733_DUPLICATE_11cc_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1728_l1742_l1733_DUPLICATE_11cc_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_f724_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1728_l1742_l1733_DUPLICATE_11cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1752_l1746_l1742_l1736_l1733_DUPLICATE_1e6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1752_l1746_l1742_l1736_l1733_DUPLICATE_1e6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f724_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1752_l1746_l1742_l1736_l1733_DUPLICATE_1e6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_7667_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1752_l1746_l1742_l1736_l1733_DUPLICATE_1e6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2dc3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1752_l1746_l1742_l1736_l1733_DUPLICATE_1e6b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1728_l1742_l1733_DUPLICATE_64bb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1728_l1742_l1733_DUPLICATE_64bb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_f724_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1728_l1742_l1733_DUPLICATE_64bb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1752_l1742_l1736_l1733_l1728_DUPLICATE_c5f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1752_l1742_l1736_l1733_l1728_DUPLICATE_c5f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1752_l1742_l1736_l1733_l1728_DUPLICATE_c5f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_f724_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1752_l1742_l1736_l1733_l1728_DUPLICATE_c5f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2dc3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1752_l1742_l1736_l1733_l1728_DUPLICATE_c5f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1742_l1746_l1736_DUPLICATE_5cea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_f724_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1742_l1746_l1736_DUPLICATE_5cea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_7667_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1742_l1746_l1736_DUPLICATE_5cea_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1746_l1742_l1736_l1733_l1728_DUPLICATE_546a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1746_l1742_l1736_l1733_l1728_DUPLICATE_546a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1746_l1742_l1736_l1733_l1728_DUPLICATE_546a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1742_c7_f724_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1746_l1742_l1736_l1733_l1728_DUPLICATE_546a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1746_c7_7667_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1746_l1742_l1736_l1733_l1728_DUPLICATE_546a_return_output;
     -- t8_MUX[uxn_opcodes_h_l1736_c7_4cca] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1736_c7_4cca_cond <= VAR_t8_MUX_uxn_opcodes_h_l1736_c7_4cca_cond;
     t8_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue;
     t8_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output := t8_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1744_c21_91b4] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1744_c21_91b4_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1744_c21_91b4_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1744_c21_91b4_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1744_c21_91b4_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1744_c21_91b4_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1744_c21_91b4_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1739_c32_1de3] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1739_c32_1de3_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1739_c32_1de3_left;
     BIN_OP_GT_uxn_opcodes_h_l1739_c32_1de3_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1739_c32_1de3_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1739_c32_1de3_return_output := BIN_OP_GT_uxn_opcodes_h_l1739_c32_1de3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1746_c7_7667] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1746_c7_7667_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1746_c7_7667_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1746_c7_7667_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1746_c7_7667_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1746_c7_7667_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1746_c7_7667_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1746_c7_7667_return_output := result_stack_value_MUX_uxn_opcodes_h_l1746_c7_7667_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1746_c7_7667] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1746_c7_7667_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1746_c7_7667_cond;
     tmp8_MUX_uxn_opcodes_h_l1746_c7_7667_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1746_c7_7667_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1746_c7_7667_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1746_c7_7667_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1746_c7_7667_return_output := tmp8_MUX_uxn_opcodes_h_l1746_c7_7667_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1746_c7_7667] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_7667_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_7667_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_7667_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_7667_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_7667_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_7667_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_7667_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_7667_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1740_c21_ae8c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_ae8c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_ae8c_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_ae8c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_ae8c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_ae8c_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_ae8c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1752_c7_2dc3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2dc3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2dc3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2dc3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2dc3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2dc3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2dc3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2dc3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2dc3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1742_c7_f724] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_f724_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_f724_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_f724_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_f724_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_f724_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_f724_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_f724_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_f724_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1752_c7_2dc3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2dc3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2dc3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2dc3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2dc3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2dc3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2dc3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2dc3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2dc3_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1739_c32_595b_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1739_c32_1de3_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l1740_c3_561c := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_ae8c_return_output)),16);
     VAR_result_ram_addr_uxn_opcodes_h_l1744_c3_b9fd := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1744_c21_91b4_return_output)),16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_7667_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_2dc3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1742_c7_f724_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_7667_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_2dc3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_f724_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1746_c7_7667_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1742_c7_f724_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1746_c7_7667_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1742_c7_f724_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1746_c7_7667_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1740_c3_561c;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_f724_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1744_c3_b9fd;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1742_c7_f724] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_f724_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_f724_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_f724_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_f724_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_f724_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_f724_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_f724_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_f724_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1736_c7_4cca] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_4cca_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_4cca_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1742_c7_f724] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1742_c7_f724_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1742_c7_f724_cond;
     tmp8_MUX_uxn_opcodes_h_l1742_c7_f724_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1742_c7_f724_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1742_c7_f724_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1742_c7_f724_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1742_c7_f724_return_output := tmp8_MUX_uxn_opcodes_h_l1742_c7_f724_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1742_c7_f724] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1742_c7_f724_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1742_c7_f724_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1742_c7_f724_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1742_c7_f724_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1742_c7_f724_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1742_c7_f724_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1742_c7_f724_return_output := result_stack_value_MUX_uxn_opcodes_h_l1742_c7_f724_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1742_c7_f724] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_f724_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_f724_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_f724_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_f724_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_f724_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_f724_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_f724_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_f724_return_output;

     -- t8_MUX[uxn_opcodes_h_l1733_c7_f513] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1733_c7_f513_cond <= VAR_t8_MUX_uxn_opcodes_h_l1733_c7_f513_cond;
     t8_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue;
     t8_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1733_c7_f513_return_output := t8_MUX_uxn_opcodes_h_l1733_c7_f513_return_output;

     -- MUX[uxn_opcodes_h_l1739_c32_595b] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1739_c32_595b_cond <= VAR_MUX_uxn_opcodes_h_l1739_c32_595b_cond;
     MUX_uxn_opcodes_h_l1739_c32_595b_iftrue <= VAR_MUX_uxn_opcodes_h_l1739_c32_595b_iftrue;
     MUX_uxn_opcodes_h_l1739_c32_595b_iffalse <= VAR_MUX_uxn_opcodes_h_l1739_c32_595b_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1739_c32_595b_return_output := MUX_uxn_opcodes_h_l1739_c32_595b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1746_c7_7667] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_7667_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_7667_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_7667_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_7667_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_7667_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_7667_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_7667_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_7667_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1746_c7_7667] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_7667_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_7667_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_7667_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_7667_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_7667_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_7667_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_7667_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_7667_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue := VAR_MUX_uxn_opcodes_h_l1739_c32_595b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f724_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1746_c7_7667_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_f724_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1746_c7_7667_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1742_c7_f724_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_f724_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1742_c7_f724_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1733_c7_f513_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1742_c7_f724_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1736_c7_4cca] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_4cca_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_4cca_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1736_c7_4cca] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_4cca_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_4cca_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1742_c7_f724] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f724_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f724_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f724_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f724_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f724_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f724_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f724_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f724_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1736_c7_4cca] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1736_c7_4cca_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1736_c7_4cca_cond;
     tmp8_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output := tmp8_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1736_c7_4cca] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_4cca_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_4cca_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1733_c7_f513] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_f513_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_f513_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_f513_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_f513_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1736_c7_4cca] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1736_c7_4cca_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c7_4cca_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output := result_stack_value_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output;

     -- t8_MUX[uxn_opcodes_h_l1728_c2_016a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1728_c2_016a_cond <= VAR_t8_MUX_uxn_opcodes_h_l1728_c2_016a_cond;
     t8_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue;
     t8_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1728_c2_016a_return_output := t8_MUX_uxn_opcodes_h_l1728_c2_016a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1742_c7_f724] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_f724_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_f724_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_f724_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_f724_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_f724_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_f724_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_f724_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_f724_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f724_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_f513_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_f724_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1728_c2_016a_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1733_c7_f513] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f513_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f513_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f513_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f513_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1736_c7_4cca] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_4cca_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_4cca_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1728_c2_016a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_016a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_016a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_016a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_016a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1733_c7_f513] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1733_c7_f513_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1733_c7_f513_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1733_c7_f513_return_output := result_stack_value_MUX_uxn_opcodes_h_l1733_c7_f513_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1733_c7_f513] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_f513_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_f513_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_f513_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_f513_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1733_c7_f513] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f513_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f513_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f513_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f513_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1733_c7_f513] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1733_c7_f513_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1733_c7_f513_cond;
     tmp8_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1733_c7_f513_return_output := tmp8_MUX_uxn_opcodes_h_l1733_c7_f513_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1736_c7_4cca] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_4cca_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_4cca_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_4cca_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_4cca_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_4cca_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1733_c7_f513_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f513_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f513_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1733_c7_f513_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1733_c7_f513_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1728_c2_016a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_016a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_016a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_016a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_016a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1728_c2_016a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1728_c2_016a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1728_c2_016a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1728_c2_016a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1728_c2_016a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1728_c2_016a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_016a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_016a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_016a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_016a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1733_c7_f513] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_f513_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_f513_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_f513_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_f513_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1728_c2_016a] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_016a_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_016a_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_016a_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_016a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1733_c7_f513] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f513_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f513_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f513_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f513_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f513_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f513_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1728_c2_016a] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1728_c2_016a_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1728_c2_016a_cond;
     tmp8_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1728_c2_016a_return_output := tmp8_MUX_uxn_opcodes_h_l1728_c2_016a_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f513_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_f513_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l1728_c2_016a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1728_c2_016a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_016a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_016a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_016a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_016a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1728_c2_016a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_016a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_016a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_016a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_016a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_016a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_016a_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a287_uxn_opcodes_h_l1757_l1724_DUPLICATE_bd2d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a287_uxn_opcodes_h_l1757_l1724_DUPLICATE_bd2d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a287(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1728_c2_016a_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1728_c2_016a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c2_016a_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1728_c2_016a_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1728_c2_016a_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1728_c2_016a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1728_c2_016a_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a287_uxn_opcodes_h_l1757_l1724_DUPLICATE_bd2d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a287_uxn_opcodes_h_l1757_l1724_DUPLICATE_bd2d_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
