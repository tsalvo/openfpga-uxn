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
entity str2_0CLK_86d21d89 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end str2_0CLK_86d21d89;
architecture arch of str2_0CLK_86d21d89 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1851_c6_884a]
signal BIN_OP_EQ_uxn_opcodes_h_l1851_c6_884a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1851_c6_884a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1851_c6_884a_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1851_c2_299f]
signal t8_MUX_uxn_opcodes_h_l1851_c2_299f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1851_c2_299f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1851_c2_299f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_299f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_299f_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1851_c2_299f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_299f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_299f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1851_c2_299f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_299f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_299f_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1851_c2_299f]
signal result_ram_value_MUX_uxn_opcodes_h_l1851_c2_299f_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1851_c2_299f_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1851_c2_299f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_299f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_299f_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1851_c2_299f]
signal result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_299f_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_299f_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1851_c2_299f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_299f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_299f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1851_c2_299f]
signal n16_MUX_uxn_opcodes_h_l1851_c2_299f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1851_c2_299f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1856_c11_880c]
signal BIN_OP_EQ_uxn_opcodes_h_l1856_c11_880c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1856_c11_880c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1856_c11_880c_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1856_c7_f455]
signal t8_MUX_uxn_opcodes_h_l1856_c7_f455_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1856_c7_f455_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1856_c7_f455]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f455_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f455_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1856_c7_f455]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f455_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f455_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1856_c7_f455]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f455_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f455_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1856_c7_f455]
signal result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f455_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f455_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1856_c7_f455]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f455_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f455_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1856_c7_f455]
signal result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f455_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f455_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1856_c7_f455]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f455_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f455_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1856_c7_f455]
signal n16_MUX_uxn_opcodes_h_l1856_c7_f455_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1856_c7_f455_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1859_c11_cb21]
signal BIN_OP_EQ_uxn_opcodes_h_l1859_c11_cb21_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1859_c11_cb21_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1859_c11_cb21_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1859_c7_41c5]
signal t8_MUX_uxn_opcodes_h_l1859_c7_41c5_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1859_c7_41c5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_41c5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1859_c7_41c5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_41c5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1859_c7_41c5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_41c5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1859_c7_41c5]
signal result_ram_value_MUX_uxn_opcodes_h_l1859_c7_41c5_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1859_c7_41c5]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_41c5_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1859_c7_41c5]
signal result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_41c5_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1859_c7_41c5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_41c5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1859_c7_41c5]
signal n16_MUX_uxn_opcodes_h_l1859_c7_41c5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1863_c11_474d]
signal BIN_OP_EQ_uxn_opcodes_h_l1863_c11_474d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1863_c11_474d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1863_c11_474d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1863_c7_fabe]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_fabe_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_fabe_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_fabe_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1863_c7_fabe]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_fabe_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_fabe_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_fabe_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1863_c7_fabe]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_fabe_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_fabe_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_fabe_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1863_c7_fabe]
signal result_ram_value_MUX_uxn_opcodes_h_l1863_c7_fabe_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1863_c7_fabe_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1863_c7_fabe_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1863_c7_fabe]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_fabe_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_fabe_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_fabe_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1863_c7_fabe]
signal result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_fabe_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_fabe_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_fabe_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1863_c7_fabe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_fabe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_fabe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_fabe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1863_c7_fabe]
signal n16_MUX_uxn_opcodes_h_l1863_c7_fabe_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1863_c7_fabe_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1863_c7_fabe_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1866_c11_433f]
signal BIN_OP_EQ_uxn_opcodes_h_l1866_c11_433f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1866_c11_433f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1866_c11_433f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1866_c7_53f5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_53f5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_53f5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_53f5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1866_c7_53f5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_53f5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_53f5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_53f5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1866_c7_53f5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_53f5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_53f5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_53f5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1866_c7_53f5]
signal result_ram_value_MUX_uxn_opcodes_h_l1866_c7_53f5_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1866_c7_53f5_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1866_c7_53f5_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1866_c7_53f5]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_53f5_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_53f5_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_53f5_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1866_c7_53f5]
signal result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_53f5_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_53f5_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_53f5_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1866_c7_53f5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_53f5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_53f5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_53f5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1866_c7_53f5]
signal n16_MUX_uxn_opcodes_h_l1866_c7_53f5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1866_c7_53f5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1866_c7_53f5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1868_c3_be6a]
signal CONST_SL_8_uxn_opcodes_h_l1868_c3_be6a_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1868_c3_be6a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1871_c11_ccf8]
signal BIN_OP_EQ_uxn_opcodes_h_l1871_c11_ccf8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1871_c11_ccf8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1871_c11_ccf8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1871_c7_6e95]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_6e95_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_6e95_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_6e95_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1871_c7_6e95]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_6e95_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_6e95_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_6e95_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1871_c7_6e95]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_6e95_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_6e95_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_6e95_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1871_c7_6e95]
signal result_ram_value_MUX_uxn_opcodes_h_l1871_c7_6e95_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1871_c7_6e95_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1871_c7_6e95_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1871_c7_6e95]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_6e95_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_6e95_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_6e95_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1871_c7_6e95]
signal result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_6e95_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_6e95_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_6e95_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1871_c7_6e95]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_6e95_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_6e95_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_6e95_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1871_c7_6e95]
signal n16_MUX_uxn_opcodes_h_l1871_c7_6e95_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1871_c7_6e95_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1871_c7_6e95_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1874_c11_c8d3]
signal BIN_OP_EQ_uxn_opcodes_h_l1874_c11_c8d3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1874_c11_c8d3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1874_c11_c8d3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1874_c7_e5cc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1874_c7_e5cc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1874_c7_e5cc]
signal result_ram_value_MUX_uxn_opcodes_h_l1874_c7_e5cc_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1874_c7_e5cc_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1874_c7_e5cc_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1874_c7_e5cc_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1874_c7_e5cc]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_e5cc_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_e5cc_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_e5cc_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_e5cc_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1874_c7_e5cc]
signal result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_e5cc_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_e5cc_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_e5cc_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_e5cc_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1874_c7_e5cc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e5cc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e5cc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e5cc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e5cc_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1874_c7_e5cc]
signal n16_MUX_uxn_opcodes_h_l1874_c7_e5cc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1874_c7_e5cc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1874_c7_e5cc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1874_c7_e5cc_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1875_c3_bd71]
signal BIN_OP_OR_uxn_opcodes_h_l1875_c3_bd71_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1875_c3_bd71_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1875_c3_bd71_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1877_c32_f0e3]
signal BIN_OP_AND_uxn_opcodes_h_l1877_c32_f0e3_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1877_c32_f0e3_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1877_c32_f0e3_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1877_c32_9126]
signal BIN_OP_GT_uxn_opcodes_h_l1877_c32_9126_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1877_c32_9126_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1877_c32_9126_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1877_c32_fdd9]
signal MUX_uxn_opcodes_h_l1877_c32_fdd9_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1877_c32_fdd9_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1877_c32_fdd9_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1877_c32_fdd9_return_output : signed(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1880_c32_f9ac]
signal CONST_SR_8_uxn_opcodes_h_l1880_c32_f9ac_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1880_c32_f9ac_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1882_c11_8007]
signal BIN_OP_EQ_uxn_opcodes_h_l1882_c11_8007_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1882_c11_8007_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1882_c11_8007_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1882_c7_83d7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_83d7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_83d7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_83d7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_83d7_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1882_c7_83d7]
signal result_ram_value_MUX_uxn_opcodes_h_l1882_c7_83d7_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1882_c7_83d7_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1882_c7_83d7_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1882_c7_83d7_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1882_c7_83d7]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_83d7_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_83d7_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_83d7_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_83d7_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1882_c7_83d7]
signal result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_83d7_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_83d7_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_83d7_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_83d7_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1882_c7_83d7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_83d7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_83d7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_83d7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_83d7_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1884_c21_4a32]
signal BIN_OP_PLUS_uxn_opcodes_h_l1884_c21_4a32_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1884_c21_4a32_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1884_c21_4a32_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1887_c11_dd4b]
signal BIN_OP_EQ_uxn_opcodes_h_l1887_c11_dd4b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1887_c11_dd4b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1887_c11_dd4b_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1887_c7_10ec]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_10ec_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_10ec_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_10ec_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_10ec_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1887_c7_10ec]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_10ec_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_10ec_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_10ec_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_10ec_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_10c5
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_10c5_left : signed(16 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_10c5_right : signed(7 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_10c5_return_output : signed(17 downto 0);

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

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
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
-- BIN_OP_EQ_uxn_opcodes_h_l1851_c6_884a
BIN_OP_EQ_uxn_opcodes_h_l1851_c6_884a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1851_c6_884a_left,
BIN_OP_EQ_uxn_opcodes_h_l1851_c6_884a_right,
BIN_OP_EQ_uxn_opcodes_h_l1851_c6_884a_return_output);

-- t8_MUX_uxn_opcodes_h_l1851_c2_299f
t8_MUX_uxn_opcodes_h_l1851_c2_299f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1851_c2_299f_cond,
t8_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue,
t8_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse,
t8_MUX_uxn_opcodes_h_l1851_c2_299f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_299f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_299f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_299f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_299f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_299f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_299f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_299f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_299f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_299f
result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_299f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_299f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_299f_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1851_c2_299f
result_ram_value_MUX_uxn_opcodes_h_l1851_c2_299f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1851_c2_299f_cond,
result_ram_value_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1851_c2_299f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_299f
result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_299f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_299f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_299f_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_299f
result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_299f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_299f_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_299f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_299f
result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_299f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_299f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_299f_return_output);

-- n16_MUX_uxn_opcodes_h_l1851_c2_299f
n16_MUX_uxn_opcodes_h_l1851_c2_299f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1851_c2_299f_cond,
n16_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue,
n16_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse,
n16_MUX_uxn_opcodes_h_l1851_c2_299f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1856_c11_880c
BIN_OP_EQ_uxn_opcodes_h_l1856_c11_880c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1856_c11_880c_left,
BIN_OP_EQ_uxn_opcodes_h_l1856_c11_880c_right,
BIN_OP_EQ_uxn_opcodes_h_l1856_c11_880c_return_output);

-- t8_MUX_uxn_opcodes_h_l1856_c7_f455
t8_MUX_uxn_opcodes_h_l1856_c7_f455 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1856_c7_f455_cond,
t8_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue,
t8_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse,
t8_MUX_uxn_opcodes_h_l1856_c7_f455_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f455
result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f455 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f455_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f455_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f455
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f455 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f455_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f455_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f455
result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f455 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f455_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f455_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f455
result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f455 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f455_cond,
result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f455_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f455
result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f455 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f455_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f455_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f455
result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f455 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f455_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f455_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f455
result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f455 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f455_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f455_return_output);

-- n16_MUX_uxn_opcodes_h_l1856_c7_f455
n16_MUX_uxn_opcodes_h_l1856_c7_f455 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1856_c7_f455_cond,
n16_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue,
n16_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse,
n16_MUX_uxn_opcodes_h_l1856_c7_f455_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1859_c11_cb21
BIN_OP_EQ_uxn_opcodes_h_l1859_c11_cb21 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1859_c11_cb21_left,
BIN_OP_EQ_uxn_opcodes_h_l1859_c11_cb21_right,
BIN_OP_EQ_uxn_opcodes_h_l1859_c11_cb21_return_output);

-- t8_MUX_uxn_opcodes_h_l1859_c7_41c5
t8_MUX_uxn_opcodes_h_l1859_c7_41c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1859_c7_41c5_cond,
t8_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue,
t8_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse,
t8_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_41c5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_41c5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_41c5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_41c5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_41c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_41c5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_41c5
result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_41c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_41c5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1859_c7_41c5
result_ram_value_MUX_uxn_opcodes_h_l1859_c7_41c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1859_c7_41c5_cond,
result_ram_value_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_41c5
result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_41c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_41c5_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_41c5
result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_41c5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_41c5_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_41c5
result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_41c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_41c5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output);

-- n16_MUX_uxn_opcodes_h_l1859_c7_41c5
n16_MUX_uxn_opcodes_h_l1859_c7_41c5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1859_c7_41c5_cond,
n16_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue,
n16_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse,
n16_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1863_c11_474d
BIN_OP_EQ_uxn_opcodes_h_l1863_c11_474d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1863_c11_474d_left,
BIN_OP_EQ_uxn_opcodes_h_l1863_c11_474d_right,
BIN_OP_EQ_uxn_opcodes_h_l1863_c11_474d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_fabe
result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_fabe : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_fabe_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_fabe_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_fabe_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_fabe
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_fabe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_fabe_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_fabe_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_fabe_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_fabe
result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_fabe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_fabe_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_fabe_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_fabe_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1863_c7_fabe
result_ram_value_MUX_uxn_opcodes_h_l1863_c7_fabe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1863_c7_fabe_cond,
result_ram_value_MUX_uxn_opcodes_h_l1863_c7_fabe_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1863_c7_fabe_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_fabe
result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_fabe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_fabe_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_fabe_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_fabe_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_fabe
result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_fabe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_fabe_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_fabe_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_fabe_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_fabe
result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_fabe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_fabe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_fabe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_fabe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output);

-- n16_MUX_uxn_opcodes_h_l1863_c7_fabe
n16_MUX_uxn_opcodes_h_l1863_c7_fabe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1863_c7_fabe_cond,
n16_MUX_uxn_opcodes_h_l1863_c7_fabe_iftrue,
n16_MUX_uxn_opcodes_h_l1863_c7_fabe_iffalse,
n16_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1866_c11_433f
BIN_OP_EQ_uxn_opcodes_h_l1866_c11_433f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1866_c11_433f_left,
BIN_OP_EQ_uxn_opcodes_h_l1866_c11_433f_right,
BIN_OP_EQ_uxn_opcodes_h_l1866_c11_433f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_53f5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_53f5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_53f5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_53f5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_53f5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_53f5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_53f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_53f5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_53f5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_53f5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_53f5
result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_53f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_53f5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_53f5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_53f5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1866_c7_53f5
result_ram_value_MUX_uxn_opcodes_h_l1866_c7_53f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1866_c7_53f5_cond,
result_ram_value_MUX_uxn_opcodes_h_l1866_c7_53f5_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1866_c7_53f5_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_53f5
result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_53f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_53f5_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_53f5_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_53f5_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_53f5
result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_53f5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_53f5_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_53f5_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_53f5_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_53f5
result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_53f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_53f5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_53f5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_53f5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output);

-- n16_MUX_uxn_opcodes_h_l1866_c7_53f5
n16_MUX_uxn_opcodes_h_l1866_c7_53f5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1866_c7_53f5_cond,
n16_MUX_uxn_opcodes_h_l1866_c7_53f5_iftrue,
n16_MUX_uxn_opcodes_h_l1866_c7_53f5_iffalse,
n16_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1868_c3_be6a
CONST_SL_8_uxn_opcodes_h_l1868_c3_be6a : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1868_c3_be6a_x,
CONST_SL_8_uxn_opcodes_h_l1868_c3_be6a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1871_c11_ccf8
BIN_OP_EQ_uxn_opcodes_h_l1871_c11_ccf8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1871_c11_ccf8_left,
BIN_OP_EQ_uxn_opcodes_h_l1871_c11_ccf8_right,
BIN_OP_EQ_uxn_opcodes_h_l1871_c11_ccf8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_6e95
result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_6e95 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_6e95_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_6e95_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_6e95_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_6e95
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_6e95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_6e95_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_6e95_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_6e95_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_6e95
result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_6e95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_6e95_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_6e95_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_6e95_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1871_c7_6e95
result_ram_value_MUX_uxn_opcodes_h_l1871_c7_6e95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1871_c7_6e95_cond,
result_ram_value_MUX_uxn_opcodes_h_l1871_c7_6e95_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1871_c7_6e95_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_6e95
result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_6e95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_6e95_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_6e95_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_6e95_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_6e95
result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_6e95 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_6e95_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_6e95_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_6e95_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_6e95
result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_6e95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_6e95_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_6e95_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_6e95_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output);

-- n16_MUX_uxn_opcodes_h_l1871_c7_6e95
n16_MUX_uxn_opcodes_h_l1871_c7_6e95 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1871_c7_6e95_cond,
n16_MUX_uxn_opcodes_h_l1871_c7_6e95_iftrue,
n16_MUX_uxn_opcodes_h_l1871_c7_6e95_iffalse,
n16_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1874_c11_c8d3
BIN_OP_EQ_uxn_opcodes_h_l1874_c11_c8d3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1874_c11_c8d3_left,
BIN_OP_EQ_uxn_opcodes_h_l1874_c11_c8d3_right,
BIN_OP_EQ_uxn_opcodes_h_l1874_c11_c8d3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc
result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc
result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1874_c7_e5cc
result_ram_value_MUX_uxn_opcodes_h_l1874_c7_e5cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1874_c7_e5cc_cond,
result_ram_value_MUX_uxn_opcodes_h_l1874_c7_e5cc_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1874_c7_e5cc_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1874_c7_e5cc_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_e5cc
result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_e5cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_e5cc_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_e5cc_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_e5cc_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_e5cc_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_e5cc
result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_e5cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_e5cc_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_e5cc_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_e5cc_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_e5cc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e5cc
result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e5cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e5cc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e5cc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e5cc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e5cc_return_output);

-- n16_MUX_uxn_opcodes_h_l1874_c7_e5cc
n16_MUX_uxn_opcodes_h_l1874_c7_e5cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1874_c7_e5cc_cond,
n16_MUX_uxn_opcodes_h_l1874_c7_e5cc_iftrue,
n16_MUX_uxn_opcodes_h_l1874_c7_e5cc_iffalse,
n16_MUX_uxn_opcodes_h_l1874_c7_e5cc_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1875_c3_bd71
BIN_OP_OR_uxn_opcodes_h_l1875_c3_bd71 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1875_c3_bd71_left,
BIN_OP_OR_uxn_opcodes_h_l1875_c3_bd71_right,
BIN_OP_OR_uxn_opcodes_h_l1875_c3_bd71_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1877_c32_f0e3
BIN_OP_AND_uxn_opcodes_h_l1877_c32_f0e3 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1877_c32_f0e3_left,
BIN_OP_AND_uxn_opcodes_h_l1877_c32_f0e3_right,
BIN_OP_AND_uxn_opcodes_h_l1877_c32_f0e3_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1877_c32_9126
BIN_OP_GT_uxn_opcodes_h_l1877_c32_9126 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1877_c32_9126_left,
BIN_OP_GT_uxn_opcodes_h_l1877_c32_9126_right,
BIN_OP_GT_uxn_opcodes_h_l1877_c32_9126_return_output);

-- MUX_uxn_opcodes_h_l1877_c32_fdd9
MUX_uxn_opcodes_h_l1877_c32_fdd9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1877_c32_fdd9_cond,
MUX_uxn_opcodes_h_l1877_c32_fdd9_iftrue,
MUX_uxn_opcodes_h_l1877_c32_fdd9_iffalse,
MUX_uxn_opcodes_h_l1877_c32_fdd9_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1880_c32_f9ac
CONST_SR_8_uxn_opcodes_h_l1880_c32_f9ac : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1880_c32_f9ac_x,
CONST_SR_8_uxn_opcodes_h_l1880_c32_f9ac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1882_c11_8007
BIN_OP_EQ_uxn_opcodes_h_l1882_c11_8007 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1882_c11_8007_left,
BIN_OP_EQ_uxn_opcodes_h_l1882_c11_8007_right,
BIN_OP_EQ_uxn_opcodes_h_l1882_c11_8007_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_83d7
result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_83d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_83d7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_83d7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_83d7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_83d7_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1882_c7_83d7
result_ram_value_MUX_uxn_opcodes_h_l1882_c7_83d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1882_c7_83d7_cond,
result_ram_value_MUX_uxn_opcodes_h_l1882_c7_83d7_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1882_c7_83d7_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1882_c7_83d7_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_83d7
result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_83d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_83d7_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_83d7_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_83d7_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_83d7_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_83d7
result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_83d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_83d7_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_83d7_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_83d7_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_83d7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_83d7
result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_83d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_83d7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_83d7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_83d7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_83d7_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1884_c21_4a32
BIN_OP_PLUS_uxn_opcodes_h_l1884_c21_4a32 : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1884_c21_4a32_left,
BIN_OP_PLUS_uxn_opcodes_h_l1884_c21_4a32_right,
BIN_OP_PLUS_uxn_opcodes_h_l1884_c21_4a32_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1887_c11_dd4b
BIN_OP_EQ_uxn_opcodes_h_l1887_c11_dd4b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1887_c11_dd4b_left,
BIN_OP_EQ_uxn_opcodes_h_l1887_c11_dd4b_right,
BIN_OP_EQ_uxn_opcodes_h_l1887_c11_dd4b_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_10ec
result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_10ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_10ec_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_10ec_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_10ec_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_10ec_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_10ec
result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_10ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_10ec_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_10ec_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_10ec_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_10ec_return_output);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_10c5
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_10c5 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_10c5_left,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_10c5_right,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_10c5_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 -- Registers
 t8,
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1851_c6_884a_return_output,
 t8_MUX_uxn_opcodes_h_l1851_c2_299f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_299f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_299f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_299f_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1851_c2_299f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_299f_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_299f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_299f_return_output,
 n16_MUX_uxn_opcodes_h_l1851_c2_299f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1856_c11_880c_return_output,
 t8_MUX_uxn_opcodes_h_l1856_c7_f455_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f455_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f455_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f455_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f455_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f455_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f455_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f455_return_output,
 n16_MUX_uxn_opcodes_h_l1856_c7_f455_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1859_c11_cb21_return_output,
 t8_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output,
 n16_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1863_c11_474d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output,
 n16_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1866_c11_433f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output,
 n16_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output,
 CONST_SL_8_uxn_opcodes_h_l1868_c3_be6a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1871_c11_ccf8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output,
 n16_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1874_c11_c8d3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1874_c7_e5cc_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_e5cc_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_e5cc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e5cc_return_output,
 n16_MUX_uxn_opcodes_h_l1874_c7_e5cc_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1875_c3_bd71_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1877_c32_f0e3_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1877_c32_9126_return_output,
 MUX_uxn_opcodes_h_l1877_c32_fdd9_return_output,
 CONST_SR_8_uxn_opcodes_h_l1880_c32_f9ac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1882_c11_8007_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_83d7_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1882_c7_83d7_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_83d7_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_83d7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_83d7_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1884_c21_4a32_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1887_c11_dd4b_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_10ec_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_10ec_return_output,
 BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_10c5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c6_884a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c6_884a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c6_884a_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1856_c7_f455_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1851_c2_299f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1851_c2_299f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f455_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_299f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_299f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1853_c3_181d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f455_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_299f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_299f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f455_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_299f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_299f_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f455_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1851_c2_299f_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1851_c2_299f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f455_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_299f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_299f_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f455_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_299f_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_299f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f455_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_299f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_299f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1856_c7_f455_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1851_c2_299f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1851_c2_299f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1856_c11_880c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1856_c11_880c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1856_c11_880c_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1856_c7_f455_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f455_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1857_c3_7d60 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f455_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f455_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f455_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f455_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f455_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f455_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1856_c7_f455_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_cb21_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_cb21_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_cb21_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1859_c7_41c5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_41c5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1861_c3_cee4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_41c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_41c5_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1859_c7_41c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_41c5_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_41c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_41c5_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1859_c7_41c5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_474d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_474d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_474d_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_fabe_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_fabe_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_fabe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_fabe_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1864_c3_6ac7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_fabe_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_fabe_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_fabe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_fabe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_fabe_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1863_c7_fabe_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1863_c7_fabe_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1863_c7_fabe_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_fabe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_fabe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_fabe_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_fabe_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_fabe_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_fabe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_fabe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_fabe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_fabe_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1863_c7_fabe_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1863_c7_fabe_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1863_c7_fabe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_433f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_433f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_433f_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_53f5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_53f5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_53f5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_53f5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1869_c3_440c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_53f5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_53f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_53f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_53f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_53f5_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1866_c7_53f5_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1866_c7_53f5_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1866_c7_53f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_53f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_53f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_53f5_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_53f5_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_53f5_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_53f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_53f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_53f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_53f5_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1866_c7_53f5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1866_c7_53f5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1866_c7_53f5_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1868_c3_be6a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1868_c3_be6a_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_ccf8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_ccf8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_ccf8_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_6e95_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_6e95_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_6e95_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_6e95_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1872_c3_39b6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_6e95_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1871_c7_6e95_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_6e95_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_6e95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_6e95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_6e95_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1871_c7_6e95_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1871_c7_6e95_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1874_c7_e5cc_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1871_c7_6e95_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_6e95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_6e95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_e5cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_6e95_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_6e95_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_6e95_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_e5cc_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_6e95_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_6e95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_6e95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e5cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_6e95_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1871_c7_6e95_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1871_c7_6e95_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1874_c7_e5cc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1871_c7_6e95_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_c8d3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_c8d3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_c8d3_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_83d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1874_c7_e5cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1874_c7_e5cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1882_c7_83d7_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1874_c7_e5cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_e5cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_e5cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_83d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_e5cc_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_e5cc_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1879_c3_ea47 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_e5cc_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_83d7_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_e5cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e5cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e5cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_83d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e5cc_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1874_c7_e5cc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1874_c7_e5cc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1874_c7_e5cc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_bd71_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_bd71_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_bd71_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1877_c32_fdd9_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1877_c32_fdd9_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1877_c32_fdd9_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1877_c32_f0e3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1877_c32_f0e3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1877_c32_f0e3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1877_c32_9126_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1877_c32_9126_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1877_c32_9126_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1877_c32_fdd9_return_output : signed(7 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1880_c32_f9ac_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1880_c32_f9ac_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1880_c22_ea30_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_8007_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_8007_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_8007_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_83d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_83d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_83d7_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1882_c7_83d7_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1882_c7_83d7_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1882_c7_83d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_83d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_83d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_10ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_83d7_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_83d7_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1884_c3_2582 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_83d7_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_83d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_83d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_83d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_10ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_83d7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1884_c21_4a32_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1884_c21_4a32_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1884_c21_4a32_return_output : signed(18 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1885_c22_e942_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_dd4b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_dd4b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_dd4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_10ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_10ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_10ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_10ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_10ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_10ec_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1863_l1859_l1856_l1851_l1874_l1871_l1866_DUPLICATE_ea92_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1863_l1859_l1856_l1882_l1851_l1871_l1866_DUPLICATE_92f9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1863_l1859_l1856_l1882_l1851_l1871_l1866_DUPLICATE_cac2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1863_l1859_l1887_l1856_l1882_l1851_l1871_l1866_DUPLICATE_a285_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1863_l1859_l1856_l1882_l1851_l1871_l1866_DUPLICATE_3a99_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1863_l1859_l1887_l1856_l1882_l1874_l1871_l1866_DUPLICATE_f6c3_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1867_l1875_DUPLICATE_8e40_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_158d_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_10c5_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_10c5_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_10c5_return_output : signed(17 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4841_uxn_opcodes_h_l1892_l1846_DUPLICATE_481a_return_output : opcode_result_t;
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
     VAR_BIN_OP_GT_uxn_opcodes_h_l1877_c32_9126_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1861_c3_cee4 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1861_c3_cee4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_c8d3_right := to_unsigned(6, 3);
     VAR_MUX_uxn_opcodes_h_l1877_c32_fdd9_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1857_c3_7d60 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1857_c3_7d60;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_83d7_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_e5cc_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_8007_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1872_c3_39b6 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_6e95_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1872_c3_39b6;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1877_c32_f0e3_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_cb21_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1869_c3_440c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_53f5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1869_c3_440c;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_10ec_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_ccf8_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_474d_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1856_c11_880c_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1853_c3_181d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1853_c3_181d;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_10ec_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1864_c3_6ac7 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_fabe_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1864_c3_6ac7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c6_884a_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_dd4b_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_433f_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l1877_c32_fdd9_iffalse := resize(to_signed(-3, 3), 8);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1884_c21_4a32_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));

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

     -- Submodule level 0
     VAR_BIN_OP_AND_uxn_opcodes_h_l1877_c32_f0e3_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_bd71_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1863_c7_fabe_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1871_c7_6e95_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1874_c7_e5cc_iffalse := n16;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_10c5_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c6_884a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1856_c11_880c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_cb21_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_474d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_433f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_ccf8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_c8d3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_8007_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_dd4b_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1851_c6_884a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1851_c6_884a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c6_884a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1851_c6_884a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c6_884a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c6_884a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1851_c6_884a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1863_l1859_l1856_l1882_l1851_l1871_l1866_DUPLICATE_92f9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1863_l1859_l1856_l1882_l1851_l1871_l1866_DUPLICATE_92f9_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1887_c11_dd4b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1887_c11_dd4b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_dd4b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1887_c11_dd4b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_dd4b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_dd4b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1887_c11_dd4b_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1877_c32_f0e3] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1877_c32_f0e3_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1877_c32_f0e3_left;
     BIN_OP_AND_uxn_opcodes_h_l1877_c32_f0e3_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1877_c32_f0e3_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1877_c32_f0e3_return_output := BIN_OP_AND_uxn_opcodes_h_l1877_c32_f0e3_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1885_c22_e942] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1885_c22_e942_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1882_c11_8007] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1882_c11_8007_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_8007_left;
     BIN_OP_EQ_uxn_opcodes_h_l1882_c11_8007_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_8007_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_8007_return_output := BIN_OP_EQ_uxn_opcodes_h_l1882_c11_8007_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1866_c11_433f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1866_c11_433f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_433f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1866_c11_433f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_433f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_433f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1866_c11_433f_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1863_l1859_l1856_l1882_l1851_l1871_l1866_DUPLICATE_cac2 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1863_l1859_l1856_l1882_l1851_l1871_l1866_DUPLICATE_cac2_return_output := result.ram_value;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1863_l1859_l1856_l1882_l1851_l1871_l1866_DUPLICATE_3a99 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1863_l1859_l1856_l1882_l1851_l1871_l1866_DUPLICATE_3a99_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l1859_c11_cb21] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1859_c11_cb21_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_cb21_left;
     BIN_OP_EQ_uxn_opcodes_h_l1859_c11_cb21_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_cb21_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_cb21_return_output := BIN_OP_EQ_uxn_opcodes_h_l1859_c11_cb21_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1863_c11_474d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1863_c11_474d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_474d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1863_c11_474d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_474d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_474d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1863_c11_474d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1856_c11_880c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1856_c11_880c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1856_c11_880c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1856_c11_880c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1856_c11_880c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1856_c11_880c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1856_c11_880c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1863_l1859_l1887_l1856_l1882_l1851_l1871_l1866_DUPLICATE_a285 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1863_l1859_l1887_l1856_l1882_l1851_l1871_l1866_DUPLICATE_a285_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1863_l1859_l1887_l1856_l1882_l1874_l1871_l1866_DUPLICATE_f6c3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1863_l1859_l1887_l1856_l1882_l1874_l1871_l1866_DUPLICATE_f6c3_return_output := result.is_opc_done;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1863_l1859_l1856_l1851_l1874_l1871_l1866_DUPLICATE_ea92 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1863_l1859_l1856_l1851_l1874_l1871_l1866_DUPLICATE_ea92_return_output := result.sp_relative_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1867_l1875_DUPLICATE_8e40 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1867_l1875_DUPLICATE_8e40_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1871_c7_6e95] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1871_c7_6e95_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1874_c11_c8d3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1874_c11_c8d3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_c8d3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1874_c11_c8d3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_c8d3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_c8d3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1874_c11_c8d3_return_output;

     -- CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_158d LATENCY=0
     VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_158d_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l1871_c11_ccf8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1871_c11_ccf8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_ccf8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1871_c11_ccf8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_ccf8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_ccf8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1871_c11_ccf8_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1877_c32_9126_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1877_c32_f0e3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1851_c2_299f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c6_884a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_299f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c6_884a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_299f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c6_884a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_299f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c6_884a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_299f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c6_884a_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1851_c2_299f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c6_884a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_299f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c6_884a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_299f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c6_884a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1851_c2_299f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c6_884a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1856_c7_f455_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1856_c11_880c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f455_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1856_c11_880c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f455_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1856_c11_880c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f455_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1856_c11_880c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f455_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1856_c11_880c_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f455_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1856_c11_880c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f455_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1856_c11_880c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f455_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1856_c11_880c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1856_c7_f455_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1856_c11_880c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1859_c7_41c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_cb21_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_41c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_cb21_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_41c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_cb21_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_41c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_cb21_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_41c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_cb21_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1859_c7_41c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_cb21_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_41c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_cb21_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_41c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_cb21_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1859_c7_41c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_cb21_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1863_c7_fabe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_474d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_fabe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_474d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_fabe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_474d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_fabe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_474d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_fabe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_474d_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1863_c7_fabe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_474d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_fabe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_474d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_fabe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_474d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1866_c7_53f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_433f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_53f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_433f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_53f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_433f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_53f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_433f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_53f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_433f_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1866_c7_53f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_433f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_53f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_433f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_53f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_433f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1871_c7_6e95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_ccf8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_6e95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_ccf8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_6e95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_ccf8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_6e95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_ccf8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_6e95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_ccf8_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1871_c7_6e95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_ccf8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_6e95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_ccf8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_6e95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_ccf8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1874_c7_e5cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_c8d3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e5cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_c8d3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_e5cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_c8d3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_c8d3_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_e5cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_c8d3_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1874_c7_e5cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_c8d3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_c8d3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_83d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_8007_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_83d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_8007_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_83d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_8007_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_83d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_8007_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1882_c7_83d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_8007_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_10ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_dd4b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_10ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_dd4b_return_output;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_10c5_right := VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_158d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_bd71_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1867_l1875_DUPLICATE_8e40_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1868_c3_be6a_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1867_l1875_DUPLICATE_8e40_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1882_c7_83d7_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1885_c22_e942_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1863_l1859_l1856_l1851_l1874_l1871_l1866_DUPLICATE_ea92_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1863_l1859_l1856_l1851_l1874_l1871_l1866_DUPLICATE_ea92_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1863_l1859_l1856_l1851_l1874_l1871_l1866_DUPLICATE_ea92_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_fabe_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1863_l1859_l1856_l1851_l1874_l1871_l1866_DUPLICATE_ea92_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_53f5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1863_l1859_l1856_l1851_l1874_l1871_l1866_DUPLICATE_ea92_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_6e95_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1863_l1859_l1856_l1851_l1874_l1871_l1866_DUPLICATE_ea92_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1863_l1859_l1856_l1851_l1874_l1871_l1866_DUPLICATE_ea92_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1863_l1859_l1856_l1882_l1851_l1871_l1866_DUPLICATE_3a99_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1863_l1859_l1856_l1882_l1851_l1871_l1866_DUPLICATE_3a99_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1863_l1859_l1856_l1882_l1851_l1871_l1866_DUPLICATE_3a99_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_fabe_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1863_l1859_l1856_l1882_l1851_l1871_l1866_DUPLICATE_3a99_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_53f5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1863_l1859_l1856_l1882_l1851_l1871_l1866_DUPLICATE_3a99_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_6e95_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1863_l1859_l1856_l1882_l1851_l1871_l1866_DUPLICATE_3a99_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_83d7_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1863_l1859_l1856_l1882_l1851_l1871_l1866_DUPLICATE_3a99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1863_l1859_l1887_l1856_l1882_l1874_l1871_l1866_DUPLICATE_f6c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1863_l1859_l1887_l1856_l1882_l1874_l1871_l1866_DUPLICATE_f6c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_fabe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1863_l1859_l1887_l1856_l1882_l1874_l1871_l1866_DUPLICATE_f6c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_53f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1863_l1859_l1887_l1856_l1882_l1874_l1871_l1866_DUPLICATE_f6c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_6e95_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1863_l1859_l1887_l1856_l1882_l1874_l1871_l1866_DUPLICATE_f6c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e5cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1863_l1859_l1887_l1856_l1882_l1874_l1871_l1866_DUPLICATE_f6c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_83d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1863_l1859_l1887_l1856_l1882_l1874_l1871_l1866_DUPLICATE_f6c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_10ec_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1863_l1859_l1887_l1856_l1882_l1874_l1871_l1866_DUPLICATE_f6c3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1863_l1859_l1887_l1856_l1882_l1851_l1871_l1866_DUPLICATE_a285_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1863_l1859_l1887_l1856_l1882_l1851_l1871_l1866_DUPLICATE_a285_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1863_l1859_l1887_l1856_l1882_l1851_l1871_l1866_DUPLICATE_a285_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_fabe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1863_l1859_l1887_l1856_l1882_l1851_l1871_l1866_DUPLICATE_a285_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_53f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1863_l1859_l1887_l1856_l1882_l1851_l1871_l1866_DUPLICATE_a285_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_6e95_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1863_l1859_l1887_l1856_l1882_l1851_l1871_l1866_DUPLICATE_a285_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_83d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1863_l1859_l1887_l1856_l1882_l1851_l1871_l1866_DUPLICATE_a285_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_10ec_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1863_l1859_l1887_l1856_l1882_l1851_l1871_l1866_DUPLICATE_a285_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1863_l1859_l1856_l1882_l1851_l1871_l1866_DUPLICATE_92f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1863_l1859_l1856_l1882_l1851_l1871_l1866_DUPLICATE_92f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1863_l1859_l1856_l1882_l1851_l1871_l1866_DUPLICATE_92f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_fabe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1863_l1859_l1856_l1882_l1851_l1871_l1866_DUPLICATE_92f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_53f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1863_l1859_l1856_l1882_l1851_l1871_l1866_DUPLICATE_92f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_6e95_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1863_l1859_l1856_l1882_l1851_l1871_l1866_DUPLICATE_92f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_83d7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1863_l1859_l1856_l1882_l1851_l1871_l1866_DUPLICATE_92f9_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1863_l1859_l1856_l1882_l1851_l1871_l1866_DUPLICATE_cac2_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1863_l1859_l1856_l1882_l1851_l1871_l1866_DUPLICATE_cac2_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1863_l1859_l1856_l1882_l1851_l1871_l1866_DUPLICATE_cac2_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1863_c7_fabe_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1863_l1859_l1856_l1882_l1851_l1871_l1866_DUPLICATE_cac2_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1866_c7_53f5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1863_l1859_l1856_l1882_l1851_l1871_l1866_DUPLICATE_cac2_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1871_c7_6e95_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1863_l1859_l1856_l1882_l1851_l1871_l1866_DUPLICATE_cac2_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1882_c7_83d7_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1863_l1859_l1856_l1882_l1851_l1871_l1866_DUPLICATE_cac2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_6e95_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1871_c7_6e95_return_output;
     -- t8_MUX[uxn_opcodes_h_l1859_c7_41c5] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1859_c7_41c5_cond <= VAR_t8_MUX_uxn_opcodes_h_l1859_c7_41c5_cond;
     t8_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue;
     t8_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output := t8_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1875_c3_bd71] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1875_c3_bd71_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_bd71_left;
     BIN_OP_OR_uxn_opcodes_h_l1875_c3_bd71_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_bd71_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_bd71_return_output := BIN_OP_OR_uxn_opcodes_h_l1875_c3_bd71_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1887_c7_10ec] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_10ec_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_10ec_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_10ec_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_10ec_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_10ec_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_10ec_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_10ec_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_10ec_return_output;

     -- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_10c5 LATENCY=0
     -- Inputs
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_10c5_left <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_10c5_left;
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_10c5_right <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_10c5_right;
     -- Outputs
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_10c5_return_output := BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_10c5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1882_c7_83d7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_83d7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_83d7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_83d7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_83d7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_83d7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_83d7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_83d7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_83d7_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1882_c7_83d7] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1882_c7_83d7_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1882_c7_83d7_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1882_c7_83d7_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1882_c7_83d7_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1882_c7_83d7_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1882_c7_83d7_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1882_c7_83d7_return_output := result_ram_value_MUX_uxn_opcodes_h_l1882_c7_83d7_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1868_c3_be6a] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1868_c3_be6a_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1868_c3_be6a_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1868_c3_be6a_return_output := CONST_SL_8_uxn_opcodes_h_l1868_c3_be6a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1871_c7_6e95] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_6e95_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_6e95_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_6e95_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_6e95_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_6e95_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_6e95_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1877_c32_9126] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1877_c32_9126_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1877_c32_9126_left;
     BIN_OP_GT_uxn_opcodes_h_l1877_c32_9126_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1877_c32_9126_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1877_c32_9126_return_output := BIN_OP_GT_uxn_opcodes_h_l1877_c32_9126_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1887_c7_10ec] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_10ec_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_10ec_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_10ec_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_10ec_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_10ec_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_10ec_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_10ec_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_10ec_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1877_c32_fdd9_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1877_c32_9126_return_output;
     VAR_CONST_SR_8_uxn_opcodes_h_l1880_c32_f9ac_x := VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_bd71_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1874_c7_e5cc_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_bd71_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1884_c21_4a32_left := VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_10c5_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l1879_c3_ea47 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_10c5_return_output)),16);
     VAR_n16_MUX_uxn_opcodes_h_l1866_c7_53f5_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1868_c3_be6a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_83d7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_10ec_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_83d7_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_10ec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_83d7_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1874_c7_e5cc_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1882_c7_83d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_53f5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_e5cc_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1879_c3_ea47;
     -- CONST_SR_8[uxn_opcodes_h_l1880_c32_f9ac] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1880_c32_f9ac_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1880_c32_f9ac_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1880_c32_f9ac_return_output := CONST_SR_8_uxn_opcodes_h_l1880_c32_f9ac_return_output;

     -- t8_MUX[uxn_opcodes_h_l1856_c7_f455] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1856_c7_f455_cond <= VAR_t8_MUX_uxn_opcodes_h_l1856_c7_f455_cond;
     t8_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue;
     t8_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1856_c7_f455_return_output := t8_MUX_uxn_opcodes_h_l1856_c7_f455_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1882_c7_83d7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_83d7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_83d7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_83d7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_83d7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_83d7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_83d7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_83d7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_83d7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1874_c7_e5cc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc_return_output;

     -- MUX[uxn_opcodes_h_l1877_c32_fdd9] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1877_c32_fdd9_cond <= VAR_MUX_uxn_opcodes_h_l1877_c32_fdd9_cond;
     MUX_uxn_opcodes_h_l1877_c32_fdd9_iftrue <= VAR_MUX_uxn_opcodes_h_l1877_c32_fdd9_iftrue;
     MUX_uxn_opcodes_h_l1877_c32_fdd9_iffalse <= VAR_MUX_uxn_opcodes_h_l1877_c32_fdd9_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1877_c32_fdd9_return_output := MUX_uxn_opcodes_h_l1877_c32_fdd9_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1884_c21_4a32] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1884_c21_4a32_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1884_c21_4a32_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1884_c21_4a32_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1884_c21_4a32_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1884_c21_4a32_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1884_c21_4a32_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1866_c7_53f5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_53f5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_53f5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_53f5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_53f5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_53f5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_53f5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1882_c7_83d7] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_83d7_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_83d7_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_83d7_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_83d7_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_83d7_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_83d7_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_83d7_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_83d7_return_output;

     -- n16_MUX[uxn_opcodes_h_l1874_c7_e5cc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1874_c7_e5cc_cond <= VAR_n16_MUX_uxn_opcodes_h_l1874_c7_e5cc_cond;
     n16_MUX_uxn_opcodes_h_l1874_c7_e5cc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1874_c7_e5cc_iftrue;
     n16_MUX_uxn_opcodes_h_l1874_c7_e5cc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1874_c7_e5cc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1874_c7_e5cc_return_output := n16_MUX_uxn_opcodes_h_l1874_c7_e5cc_return_output;

     -- Submodule level 3
     VAR_result_ram_addr_uxn_opcodes_h_l1884_c3_2582 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1884_c21_4a32_return_output)),16);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc_iftrue := VAR_MUX_uxn_opcodes_h_l1877_c32_fdd9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1871_c7_6e95_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1874_c7_e5cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e5cc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_83d7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_e5cc_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_83d7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_6e95_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_fabe_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1856_c7_f455_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_83d7_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1884_c3_2582;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l1880_c22_ea30] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1880_c22_ea30_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1880_c32_f9ac_return_output);

     -- result_ram_addr_MUX[uxn_opcodes_h_l1882_c7_83d7] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_83d7_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_83d7_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_83d7_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_83d7_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_83d7_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_83d7_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_83d7_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_83d7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1874_c7_e5cc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1874_c7_e5cc] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_e5cc_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_e5cc_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_e5cc_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_e5cc_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_e5cc_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_e5cc_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_e5cc_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_e5cc_return_output;

     -- n16_MUX[uxn_opcodes_h_l1871_c7_6e95] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1871_c7_6e95_cond <= VAR_n16_MUX_uxn_opcodes_h_l1871_c7_6e95_cond;
     n16_MUX_uxn_opcodes_h_l1871_c7_6e95_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1871_c7_6e95_iftrue;
     n16_MUX_uxn_opcodes_h_l1871_c7_6e95_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1871_c7_6e95_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output := n16_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1874_c7_e5cc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e5cc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e5cc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e5cc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e5cc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e5cc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e5cc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e5cc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e5cc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1863_c7_fabe] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_fabe_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_fabe_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_fabe_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_fabe_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_fabe_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_fabe_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output;

     -- t8_MUX[uxn_opcodes_h_l1851_c2_299f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1851_c2_299f_cond <= VAR_t8_MUX_uxn_opcodes_h_l1851_c2_299f_cond;
     t8_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue;
     t8_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1851_c2_299f_return_output := t8_MUX_uxn_opcodes_h_l1851_c2_299f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1871_c7_6e95] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_6e95_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_6e95_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_6e95_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_6e95_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_6e95_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_6e95_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output;

     -- Submodule level 4
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1874_c7_e5cc_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1880_c22_ea30_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1866_c7_53f5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_6e95_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_e5cc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_6e95_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_e5cc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_53f5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_e5cc_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_83d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_6e95_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_e5cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1851_c2_299f_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1874_c7_e5cc] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_e5cc_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_e5cc_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_e5cc_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_e5cc_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_e5cc_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_e5cc_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_e5cc_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_e5cc_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1874_c7_e5cc] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1874_c7_e5cc_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1874_c7_e5cc_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1874_c7_e5cc_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1874_c7_e5cc_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1874_c7_e5cc_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1874_c7_e5cc_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1874_c7_e5cc_return_output := result_ram_value_MUX_uxn_opcodes_h_l1874_c7_e5cc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1859_c7_41c5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_41c5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_41c5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1866_c7_53f5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_53f5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_53f5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_53f5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_53f5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_53f5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_53f5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1871_c7_6e95] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_6e95_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_6e95_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_6e95_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_6e95_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_6e95_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_6e95_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1871_c7_6e95] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_6e95_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_6e95_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_6e95_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_6e95_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_6e95_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_6e95_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1871_c7_6e95] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_6e95_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_6e95_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_6e95_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_6e95_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_6e95_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_6e95_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output;

     -- n16_MUX[uxn_opcodes_h_l1866_c7_53f5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1866_c7_53f5_cond <= VAR_n16_MUX_uxn_opcodes_h_l1866_c7_53f5_cond;
     n16_MUX_uxn_opcodes_h_l1866_c7_53f5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1866_c7_53f5_iftrue;
     n16_MUX_uxn_opcodes_h_l1866_c7_53f5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1866_c7_53f5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output := n16_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1863_c7_fabe_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_53f5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_53f5_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_fabe_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_6e95_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_e5cc_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1871_c7_6e95_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1874_c7_e5cc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_53f5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1856_c7_f455] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f455_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f455_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f455_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f455_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1871_c7_6e95] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1871_c7_6e95_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1871_c7_6e95_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1871_c7_6e95_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1871_c7_6e95_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1871_c7_6e95_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1871_c7_6e95_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output := result_ram_value_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1866_c7_53f5] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_53f5_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_53f5_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_53f5_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_53f5_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_53f5_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_53f5_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1871_c7_6e95] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_6e95_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_6e95_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_6e95_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_6e95_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_6e95_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_6e95_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output;

     -- n16_MUX[uxn_opcodes_h_l1863_c7_fabe] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1863_c7_fabe_cond <= VAR_n16_MUX_uxn_opcodes_h_l1863_c7_fabe_cond;
     n16_MUX_uxn_opcodes_h_l1863_c7_fabe_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1863_c7_fabe_iftrue;
     n16_MUX_uxn_opcodes_h_l1863_c7_fabe_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1863_c7_fabe_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output := n16_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1863_c7_fabe] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_fabe_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_fabe_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_fabe_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_fabe_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_fabe_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_fabe_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1866_c7_53f5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_53f5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_53f5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_53f5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_53f5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_53f5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_53f5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1866_c7_53f5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_53f5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_53f5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_53f5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_53f5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_53f5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_53f5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_fabe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_fabe_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_53f5_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1866_c7_53f5_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1871_c7_6e95_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_fabe_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f455_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1851_c2_299f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_299f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_299f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_299f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_299f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1863_c7_fabe] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_fabe_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_fabe_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_fabe_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_fabe_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_fabe_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_fabe_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1866_c7_53f5] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_53f5_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_53f5_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_53f5_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_53f5_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_53f5_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_53f5_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1866_c7_53f5] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1866_c7_53f5_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1866_c7_53f5_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1866_c7_53f5_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1866_c7_53f5_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1866_c7_53f5_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1866_c7_53f5_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output := result_ram_value_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1859_c7_41c5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_41c5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_41c5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1863_c7_fabe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_fabe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_fabe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_fabe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_fabe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_fabe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_fabe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1863_c7_fabe] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_fabe_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_fabe_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_fabe_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_fabe_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_fabe_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_fabe_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output;

     -- n16_MUX[uxn_opcodes_h_l1859_c7_41c5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1859_c7_41c5_cond <= VAR_n16_MUX_uxn_opcodes_h_l1859_c7_41c5_cond;
     n16_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue;
     n16_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output := n16_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_fabe_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1863_c7_fabe_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1866_c7_53f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1859_c7_41c5] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_41c5_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_41c5_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1863_c7_fabe] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_fabe_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_fabe_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_fabe_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_fabe_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_fabe_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_fabe_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1856_c7_f455] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f455_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f455_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f455_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f455_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1859_c7_41c5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_41c5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_41c5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1863_c7_fabe] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1863_c7_fabe_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1863_c7_fabe_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1863_c7_fabe_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1863_c7_fabe_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1863_c7_fabe_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1863_c7_fabe_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output := result_ram_value_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1859_c7_41c5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_41c5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_41c5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output;

     -- n16_MUX[uxn_opcodes_h_l1856_c7_f455] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1856_c7_f455_cond <= VAR_n16_MUX_uxn_opcodes_h_l1856_c7_f455_cond;
     n16_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue;
     n16_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1856_c7_f455_return_output := n16_MUX_uxn_opcodes_h_l1856_c7_f455_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1856_c7_f455_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f455_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1863_c7_fabe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1851_c2_299f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_299f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_299f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_299f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_299f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1856_c7_f455] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f455_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f455_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f455_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f455_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1856_c7_f455] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f455_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f455_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f455_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f455_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1856_c7_f455] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f455_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f455_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f455_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f455_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1859_c7_41c5] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_41c5_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_41c5_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output;

     -- n16_MUX[uxn_opcodes_h_l1851_c2_299f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1851_c2_299f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1851_c2_299f_cond;
     n16_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue;
     n16_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1851_c2_299f_return_output := n16_MUX_uxn_opcodes_h_l1851_c2_299f_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1859_c7_41c5] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1859_c7_41c5_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1859_c7_41c5_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1859_c7_41c5_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1859_c7_41c5_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output := result_ram_value_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output;

     -- Submodule level 9
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1851_c2_299f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f455_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f455_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1859_c7_41c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f455_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l1856_c7_f455] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f455_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f455_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f455_return_output := result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f455_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1851_c2_299f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_299f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_299f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_299f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_299f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1851_c2_299f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_299f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_299f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_299f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_299f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1851_c2_299f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_299f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_299f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_299f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_299f_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1856_c7_f455] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f455_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f455_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f455_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f455_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f455_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f455_return_output;

     -- Submodule level 10
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f455_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f455_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l1851_c2_299f] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1851_c2_299f_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1851_c2_299f_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1851_c2_299f_return_output := result_ram_value_MUX_uxn_opcodes_h_l1851_c2_299f_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1851_c2_299f] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_299f_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_299f_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_299f_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_299f_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_299f_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_299f_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4841_uxn_opcodes_h_l1892_l1846_DUPLICATE_481a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4841_uxn_opcodes_h_l1892_l1846_DUPLICATE_481a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4841(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_299f_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_299f_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_299f_return_output,
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1851_c2_299f_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_299f_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_299f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_299f_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4841_uxn_opcodes_h_l1892_l1846_DUPLICATE_481a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4841_uxn_opcodes_h_l1892_l1846_DUPLICATE_481a_return_output;
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
