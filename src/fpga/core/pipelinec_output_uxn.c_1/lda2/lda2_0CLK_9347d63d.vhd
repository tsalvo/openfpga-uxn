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
-- Submodules: 125
entity lda2_0CLK_9347d63d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lda2_0CLK_9347d63d;
architecture arch of lda2_0CLK_9347d63d is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1559_c6_8b14]
signal BIN_OP_EQ_uxn_opcodes_h_l1559_c6_8b14_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1559_c6_8b14_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1559_c6_8b14_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1559_c1_01f2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1559_c1_01f2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1559_c1_01f2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1559_c1_01f2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1559_c1_01f2_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1559_c2_8e41]
signal result_ram_addr_MUX_uxn_opcodes_h_l1559_c2_8e41_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1559_c2_8e41]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1559_c2_8e41_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1559_c2_8e41]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1559_c2_8e41_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1559_c2_8e41]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1559_c2_8e41_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1559_c2_8e41]
signal result_stack_value_MUX_uxn_opcodes_h_l1559_c2_8e41_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1559_c2_8e41]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1559_c2_8e41_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1559_c2_8e41]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1559_c2_8e41_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1559_c2_8e41]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1559_c2_8e41_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1559_c2_8e41]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1559_c2_8e41_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1559_c2_8e41]
signal tmp16_MUX_uxn_opcodes_h_l1559_c2_8e41_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1559_c2_8e41]
signal t16_MUX_uxn_opcodes_h_l1559_c2_8e41_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1560_c3_ddfa[uxn_opcodes_h_l1560_c3_ddfa]
signal printf_uxn_opcodes_h_l1560_c3_ddfa_uxn_opcodes_h_l1560_c3_ddfa_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1565_c11_b986]
signal BIN_OP_EQ_uxn_opcodes_h_l1565_c11_b986_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1565_c11_b986_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1565_c11_b986_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1565_c7_2270]
signal result_ram_addr_MUX_uxn_opcodes_h_l1565_c7_2270_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1565_c7_2270_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1565_c7_2270]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2270_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2270_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1565_c7_2270]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2270_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2270_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1565_c7_2270]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1565_c7_2270_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1565_c7_2270_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1565_c7_2270]
signal result_stack_value_MUX_uxn_opcodes_h_l1565_c7_2270_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1565_c7_2270_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1565_c7_2270]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1565_c7_2270_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1565_c7_2270_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1565_c7_2270]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2270_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2270_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1565_c7_2270]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2270_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2270_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1565_c7_2270]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2270_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2270_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1565_c7_2270]
signal tmp16_MUX_uxn_opcodes_h_l1565_c7_2270_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1565_c7_2270_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1565_c7_2270]
signal t16_MUX_uxn_opcodes_h_l1565_c7_2270_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1565_c7_2270_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1568_c11_fefd]
signal BIN_OP_EQ_uxn_opcodes_h_l1568_c11_fefd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1568_c11_fefd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1568_c11_fefd_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1568_c7_74ed]
signal result_ram_addr_MUX_uxn_opcodes_h_l1568_c7_74ed_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1568_c7_74ed]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_74ed_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1568_c7_74ed]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_74ed_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1568_c7_74ed]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_74ed_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1568_c7_74ed]
signal result_stack_value_MUX_uxn_opcodes_h_l1568_c7_74ed_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1568_c7_74ed]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1568_c7_74ed_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1568_c7_74ed]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_74ed_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1568_c7_74ed]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_74ed_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1568_c7_74ed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_74ed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1568_c7_74ed]
signal tmp16_MUX_uxn_opcodes_h_l1568_c7_74ed_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1568_c7_74ed]
signal t16_MUX_uxn_opcodes_h_l1568_c7_74ed_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1570_c3_d746]
signal CONST_SL_8_uxn_opcodes_h_l1570_c3_d746_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1570_c3_d746_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1573_c11_6335]
signal BIN_OP_EQ_uxn_opcodes_h_l1573_c11_6335_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1573_c11_6335_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1573_c11_6335_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1573_c7_355a]
signal result_ram_addr_MUX_uxn_opcodes_h_l1573_c7_355a_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1573_c7_355a_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1573_c7_355a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_355a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_355a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1573_c7_355a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1573_c7_355a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1573_c7_355a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1573_c7_355a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1573_c7_355a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1573_c7_355a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1573_c7_355a]
signal result_stack_value_MUX_uxn_opcodes_h_l1573_c7_355a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1573_c7_355a_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1573_c7_355a]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1573_c7_355a_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1573_c7_355a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1573_c7_355a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_355a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_355a_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1573_c7_355a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_355a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_355a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1573_c7_355a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_355a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_355a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1573_c7_355a]
signal tmp16_MUX_uxn_opcodes_h_l1573_c7_355a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1573_c7_355a_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1573_c7_355a]
signal t16_MUX_uxn_opcodes_h_l1573_c7_355a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1573_c7_355a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1576_c11_c4c5]
signal BIN_OP_EQ_uxn_opcodes_h_l1576_c11_c4c5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1576_c11_c4c5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1576_c11_c4c5_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1576_c7_8499]
signal result_ram_addr_MUX_uxn_opcodes_h_l1576_c7_8499_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1576_c7_8499_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1576_c7_8499]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_8499_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_8499_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1576_c7_8499]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1576_c7_8499_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1576_c7_8499_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1576_c7_8499]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1576_c7_8499_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1576_c7_8499_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1576_c7_8499]
signal result_stack_value_MUX_uxn_opcodes_h_l1576_c7_8499_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1576_c7_8499_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1576_c7_8499]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1576_c7_8499_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1576_c7_8499_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1576_c7_8499]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1576_c7_8499_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1576_c7_8499_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1576_c7_8499]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_8499_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_8499_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1576_c7_8499]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_8499_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_8499_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1576_c7_8499]
signal tmp16_MUX_uxn_opcodes_h_l1576_c7_8499_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1576_c7_8499_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1576_c7_8499]
signal t16_MUX_uxn_opcodes_h_l1576_c7_8499_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1576_c7_8499_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1577_c3_82ce]
signal BIN_OP_OR_uxn_opcodes_h_l1577_c3_82ce_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1577_c3_82ce_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1577_c3_82ce_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1580_c32_cc2b]
signal BIN_OP_AND_uxn_opcodes_h_l1580_c32_cc2b_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1580_c32_cc2b_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1580_c32_cc2b_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1580_c32_e9de]
signal BIN_OP_GT_uxn_opcodes_h_l1580_c32_e9de_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1580_c32_e9de_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1580_c32_e9de_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1580_c32_d2fa]
signal MUX_uxn_opcodes_h_l1580_c32_d2fa_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1580_c32_d2fa_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1580_c32_d2fa_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1580_c32_d2fa_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1582_c11_a110]
signal BIN_OP_EQ_uxn_opcodes_h_l1582_c11_a110_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1582_c11_a110_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1582_c11_a110_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1582_c7_769a]
signal result_stack_value_MUX_uxn_opcodes_h_l1582_c7_769a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1582_c7_769a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1582_c7_769a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1582_c7_769a_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1582_c7_769a]
signal result_ram_addr_MUX_uxn_opcodes_h_l1582_c7_769a_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1582_c7_769a_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1582_c7_769a_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1582_c7_769a_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1582_c7_769a]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1582_c7_769a_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1582_c7_769a_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1582_c7_769a_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1582_c7_769a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1582_c7_769a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_769a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_769a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_769a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_769a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1582_c7_769a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_769a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_769a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_769a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_769a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1582_c7_769a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_769a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_769a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_769a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_769a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1582_c7_769a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_769a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_769a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_769a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_769a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1582_c7_769a]
signal tmp16_MUX_uxn_opcodes_h_l1582_c7_769a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1582_c7_769a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1582_c7_769a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1582_c7_769a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1587_c11_591f]
signal BIN_OP_EQ_uxn_opcodes_h_l1587_c11_591f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1587_c11_591f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1587_c11_591f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1587_c7_7b5c]
signal result_stack_value_MUX_uxn_opcodes_h_l1587_c7_7b5c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1587_c7_7b5c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1587_c7_7b5c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1587_c7_7b5c_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1587_c7_7b5c]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_7b5c_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_7b5c_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_7b5c_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_7b5c_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1587_c7_7b5c]
signal result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_7b5c_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_7b5c_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_7b5c_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_7b5c_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1587_c7_7b5c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_7b5c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_7b5c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_7b5c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_7b5c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1587_c7_7b5c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_7b5c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_7b5c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_7b5c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_7b5c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1587_c7_7b5c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_7b5c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_7b5c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_7b5c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_7b5c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1587_c7_7b5c]
signal tmp16_MUX_uxn_opcodes_h_l1587_c7_7b5c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1587_c7_7b5c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1587_c7_7b5c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1587_c7_7b5c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1590_c11_c195]
signal BIN_OP_EQ_uxn_opcodes_h_l1590_c11_c195_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1590_c11_c195_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1590_c11_c195_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1590_c7_b196]
signal result_stack_value_MUX_uxn_opcodes_h_l1590_c7_b196_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1590_c7_b196_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1590_c7_b196_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1590_c7_b196_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1590_c7_b196]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_b196_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_b196_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_b196_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_b196_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1590_c7_b196]
signal result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_b196_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_b196_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_b196_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_b196_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1590_c7_b196]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_b196_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_b196_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_b196_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_b196_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1590_c7_b196]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_b196_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_b196_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_b196_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_b196_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1590_c7_b196]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_b196_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_b196_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_b196_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_b196_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1590_c7_b196]
signal tmp16_MUX_uxn_opcodes_h_l1590_c7_b196_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1590_c7_b196_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1590_c7_b196_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1590_c7_b196_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1592_c3_3db0]
signal CONST_SL_8_uxn_opcodes_h_l1592_c3_3db0_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1592_c3_3db0_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1593_c21_6291]
signal BIN_OP_PLUS_uxn_opcodes_h_l1593_c21_6291_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1593_c21_6291_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1593_c21_6291_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1595_c11_1d87]
signal BIN_OP_EQ_uxn_opcodes_h_l1595_c11_1d87_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1595_c11_1d87_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1595_c11_1d87_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1595_c7_4681]
signal result_stack_value_MUX_uxn_opcodes_h_l1595_c7_4681_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1595_c7_4681_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1595_c7_4681_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1595_c7_4681_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1595_c7_4681]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_4681_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_4681_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_4681_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_4681_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1595_c7_4681]
signal result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_4681_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_4681_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_4681_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_4681_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1595_c7_4681]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_4681_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_4681_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_4681_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_4681_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1595_c7_4681]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_4681_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_4681_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_4681_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_4681_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1595_c7_4681]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_4681_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_4681_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_4681_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_4681_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1595_c7_4681]
signal tmp16_MUX_uxn_opcodes_h_l1595_c7_4681_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1595_c7_4681_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1595_c7_4681_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1595_c7_4681_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1596_c21_bb28]
signal BIN_OP_PLUS_uxn_opcodes_h_l1596_c21_bb28_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1596_c21_bb28_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1596_c21_bb28_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1598_c11_758d]
signal BIN_OP_EQ_uxn_opcodes_h_l1598_c11_758d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1598_c11_758d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1598_c11_758d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1598_c7_94d5]
signal result_stack_value_MUX_uxn_opcodes_h_l1598_c7_94d5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1598_c7_94d5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1598_c7_94d5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1598_c7_94d5_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1598_c7_94d5]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_94d5_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_94d5_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_94d5_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_94d5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1598_c7_94d5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_94d5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_94d5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_94d5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_94d5_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1598_c7_94d5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_94d5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_94d5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_94d5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_94d5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1598_c7_94d5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_94d5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_94d5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_94d5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_94d5_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1598_c7_94d5]
signal tmp16_MUX_uxn_opcodes_h_l1598_c7_94d5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1598_c7_94d5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1598_c7_94d5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1598_c7_94d5_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1599_c3_c411]
signal BIN_OP_OR_uxn_opcodes_h_l1599_c3_c411_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1599_c3_c411_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1599_c3_c411_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1605_c11_5f63]
signal BIN_OP_EQ_uxn_opcodes_h_l1605_c11_5f63_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1605_c11_5f63_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1605_c11_5f63_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1605_c7_99b8]
signal result_stack_value_MUX_uxn_opcodes_h_l1605_c7_99b8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1605_c7_99b8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1605_c7_99b8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1605_c7_99b8_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1605_c7_99b8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1605_c7_99b8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1605_c7_99b8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1605_c7_99b8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1605_c7_99b8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1605_c7_99b8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1605_c7_99b8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1605_c7_99b8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1605_c7_99b8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1605_c7_99b8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1605_c7_99b8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1605_c7_99b8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1605_c7_99b8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1605_c7_99b8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1605_c7_99b8_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1607_c34_56fc]
signal CONST_SR_8_uxn_opcodes_h_l1607_c34_56fc_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1607_c34_56fc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1609_c11_f0fb]
signal BIN_OP_EQ_uxn_opcodes_h_l1609_c11_f0fb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1609_c11_f0fb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1609_c11_f0fb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1609_c7_5992]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1609_c7_5992_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1609_c7_5992_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1609_c7_5992_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1609_c7_5992_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1609_c7_5992]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_5992_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_5992_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_5992_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_5992_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_0a09( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.ram_addr := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_stack_read := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_ram_read := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_stack_write := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1559_c6_8b14
BIN_OP_EQ_uxn_opcodes_h_l1559_c6_8b14 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1559_c6_8b14_left,
BIN_OP_EQ_uxn_opcodes_h_l1559_c6_8b14_right,
BIN_OP_EQ_uxn_opcodes_h_l1559_c6_8b14_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1559_c1_01f2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1559_c1_01f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1559_c1_01f2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1559_c1_01f2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1559_c1_01f2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1559_c1_01f2_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1559_c2_8e41
result_ram_addr_MUX_uxn_opcodes_h_l1559_c2_8e41 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1559_c2_8e41_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1559_c2_8e41
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1559_c2_8e41 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1559_c2_8e41_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1559_c2_8e41
result_is_sp_shift_MUX_uxn_opcodes_h_l1559_c2_8e41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1559_c2_8e41_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1559_c2_8e41
result_is_stack_read_MUX_uxn_opcodes_h_l1559_c2_8e41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1559_c2_8e41_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1559_c2_8e41
result_stack_value_MUX_uxn_opcodes_h_l1559_c2_8e41 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1559_c2_8e41_cond,
result_stack_value_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1559_c2_8e41
result_is_ram_read_MUX_uxn_opcodes_h_l1559_c2_8e41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1559_c2_8e41_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1559_c2_8e41
result_sp_relative_shift_MUX_uxn_opcodes_h_l1559_c2_8e41 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1559_c2_8e41_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1559_c2_8e41
result_is_stack_write_MUX_uxn_opcodes_h_l1559_c2_8e41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1559_c2_8e41_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1559_c2_8e41
result_is_opc_done_MUX_uxn_opcodes_h_l1559_c2_8e41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1559_c2_8e41_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1559_c2_8e41
tmp16_MUX_uxn_opcodes_h_l1559_c2_8e41 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1559_c2_8e41_cond,
tmp16_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue,
tmp16_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse,
tmp16_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output);

-- t16_MUX_uxn_opcodes_h_l1559_c2_8e41
t16_MUX_uxn_opcodes_h_l1559_c2_8e41 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1559_c2_8e41_cond,
t16_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue,
t16_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse,
t16_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output);

-- printf_uxn_opcodes_h_l1560_c3_ddfa_uxn_opcodes_h_l1560_c3_ddfa
printf_uxn_opcodes_h_l1560_c3_ddfa_uxn_opcodes_h_l1560_c3_ddfa : entity work.printf_uxn_opcodes_h_l1560_c3_ddfa_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1560_c3_ddfa_uxn_opcodes_h_l1560_c3_ddfa_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1565_c11_b986
BIN_OP_EQ_uxn_opcodes_h_l1565_c11_b986 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1565_c11_b986_left,
BIN_OP_EQ_uxn_opcodes_h_l1565_c11_b986_right,
BIN_OP_EQ_uxn_opcodes_h_l1565_c11_b986_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1565_c7_2270
result_ram_addr_MUX_uxn_opcodes_h_l1565_c7_2270 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1565_c7_2270_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1565_c7_2270_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2270
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2270 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2270_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2270_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2270
result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2270 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2270_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2270_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1565_c7_2270
result_is_stack_read_MUX_uxn_opcodes_h_l1565_c7_2270 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1565_c7_2270_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1565_c7_2270_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1565_c7_2270
result_stack_value_MUX_uxn_opcodes_h_l1565_c7_2270 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1565_c7_2270_cond,
result_stack_value_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1565_c7_2270_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1565_c7_2270
result_is_ram_read_MUX_uxn_opcodes_h_l1565_c7_2270 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1565_c7_2270_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1565_c7_2270_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2270
result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2270 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2270_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2270_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2270
result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2270 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2270_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2270_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2270
result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2270 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2270_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2270_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1565_c7_2270
tmp16_MUX_uxn_opcodes_h_l1565_c7_2270 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1565_c7_2270_cond,
tmp16_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue,
tmp16_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse,
tmp16_MUX_uxn_opcodes_h_l1565_c7_2270_return_output);

-- t16_MUX_uxn_opcodes_h_l1565_c7_2270
t16_MUX_uxn_opcodes_h_l1565_c7_2270 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1565_c7_2270_cond,
t16_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue,
t16_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse,
t16_MUX_uxn_opcodes_h_l1565_c7_2270_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1568_c11_fefd
BIN_OP_EQ_uxn_opcodes_h_l1568_c11_fefd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1568_c11_fefd_left,
BIN_OP_EQ_uxn_opcodes_h_l1568_c11_fefd_right,
BIN_OP_EQ_uxn_opcodes_h_l1568_c11_fefd_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1568_c7_74ed
result_ram_addr_MUX_uxn_opcodes_h_l1568_c7_74ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1568_c7_74ed_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_74ed
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_74ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_74ed_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_74ed
result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_74ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_74ed_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_74ed
result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_74ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_74ed_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1568_c7_74ed
result_stack_value_MUX_uxn_opcodes_h_l1568_c7_74ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1568_c7_74ed_cond,
result_stack_value_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1568_c7_74ed
result_is_ram_read_MUX_uxn_opcodes_h_l1568_c7_74ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1568_c7_74ed_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_74ed
result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_74ed : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_74ed_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_74ed
result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_74ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_74ed_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_74ed
result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_74ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_74ed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1568_c7_74ed
tmp16_MUX_uxn_opcodes_h_l1568_c7_74ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1568_c7_74ed_cond,
tmp16_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue,
tmp16_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse,
tmp16_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output);

-- t16_MUX_uxn_opcodes_h_l1568_c7_74ed
t16_MUX_uxn_opcodes_h_l1568_c7_74ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1568_c7_74ed_cond,
t16_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue,
t16_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse,
t16_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1570_c3_d746
CONST_SL_8_uxn_opcodes_h_l1570_c3_d746 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1570_c3_d746_x,
CONST_SL_8_uxn_opcodes_h_l1570_c3_d746_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1573_c11_6335
BIN_OP_EQ_uxn_opcodes_h_l1573_c11_6335 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1573_c11_6335_left,
BIN_OP_EQ_uxn_opcodes_h_l1573_c11_6335_right,
BIN_OP_EQ_uxn_opcodes_h_l1573_c11_6335_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1573_c7_355a
result_ram_addr_MUX_uxn_opcodes_h_l1573_c7_355a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1573_c7_355a_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1573_c7_355a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_355a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_355a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_355a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_355a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1573_c7_355a
result_is_sp_shift_MUX_uxn_opcodes_h_l1573_c7_355a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1573_c7_355a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1573_c7_355a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1573_c7_355a
result_is_stack_read_MUX_uxn_opcodes_h_l1573_c7_355a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1573_c7_355a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1573_c7_355a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1573_c7_355a
result_stack_value_MUX_uxn_opcodes_h_l1573_c7_355a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1573_c7_355a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1573_c7_355a_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1573_c7_355a
result_is_ram_read_MUX_uxn_opcodes_h_l1573_c7_355a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1573_c7_355a_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1573_c7_355a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_355a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_355a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_355a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_355a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_355a
result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_355a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_355a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_355a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_355a
result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_355a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_355a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_355a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1573_c7_355a
tmp16_MUX_uxn_opcodes_h_l1573_c7_355a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1573_c7_355a_cond,
tmp16_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1573_c7_355a_return_output);

-- t16_MUX_uxn_opcodes_h_l1573_c7_355a
t16_MUX_uxn_opcodes_h_l1573_c7_355a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1573_c7_355a_cond,
t16_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue,
t16_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse,
t16_MUX_uxn_opcodes_h_l1573_c7_355a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1576_c11_c4c5
BIN_OP_EQ_uxn_opcodes_h_l1576_c11_c4c5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1576_c11_c4c5_left,
BIN_OP_EQ_uxn_opcodes_h_l1576_c11_c4c5_right,
BIN_OP_EQ_uxn_opcodes_h_l1576_c11_c4c5_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1576_c7_8499
result_ram_addr_MUX_uxn_opcodes_h_l1576_c7_8499 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1576_c7_8499_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1576_c7_8499_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_8499
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_8499 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_8499_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_8499_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1576_c7_8499
result_is_sp_shift_MUX_uxn_opcodes_h_l1576_c7_8499 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1576_c7_8499_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1576_c7_8499_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1576_c7_8499
result_is_stack_read_MUX_uxn_opcodes_h_l1576_c7_8499 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1576_c7_8499_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1576_c7_8499_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1576_c7_8499
result_stack_value_MUX_uxn_opcodes_h_l1576_c7_8499 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1576_c7_8499_cond,
result_stack_value_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1576_c7_8499_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1576_c7_8499
result_is_ram_read_MUX_uxn_opcodes_h_l1576_c7_8499 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1576_c7_8499_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1576_c7_8499_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1576_c7_8499
result_sp_relative_shift_MUX_uxn_opcodes_h_l1576_c7_8499 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1576_c7_8499_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1576_c7_8499_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_8499
result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_8499 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_8499_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_8499_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_8499
result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_8499 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_8499_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_8499_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1576_c7_8499
tmp16_MUX_uxn_opcodes_h_l1576_c7_8499 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1576_c7_8499_cond,
tmp16_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue,
tmp16_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse,
tmp16_MUX_uxn_opcodes_h_l1576_c7_8499_return_output);

-- t16_MUX_uxn_opcodes_h_l1576_c7_8499
t16_MUX_uxn_opcodes_h_l1576_c7_8499 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1576_c7_8499_cond,
t16_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue,
t16_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse,
t16_MUX_uxn_opcodes_h_l1576_c7_8499_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1577_c3_82ce
BIN_OP_OR_uxn_opcodes_h_l1577_c3_82ce : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1577_c3_82ce_left,
BIN_OP_OR_uxn_opcodes_h_l1577_c3_82ce_right,
BIN_OP_OR_uxn_opcodes_h_l1577_c3_82ce_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1580_c32_cc2b
BIN_OP_AND_uxn_opcodes_h_l1580_c32_cc2b : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1580_c32_cc2b_left,
BIN_OP_AND_uxn_opcodes_h_l1580_c32_cc2b_right,
BIN_OP_AND_uxn_opcodes_h_l1580_c32_cc2b_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1580_c32_e9de
BIN_OP_GT_uxn_opcodes_h_l1580_c32_e9de : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1580_c32_e9de_left,
BIN_OP_GT_uxn_opcodes_h_l1580_c32_e9de_right,
BIN_OP_GT_uxn_opcodes_h_l1580_c32_e9de_return_output);

-- MUX_uxn_opcodes_h_l1580_c32_d2fa
MUX_uxn_opcodes_h_l1580_c32_d2fa : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1580_c32_d2fa_cond,
MUX_uxn_opcodes_h_l1580_c32_d2fa_iftrue,
MUX_uxn_opcodes_h_l1580_c32_d2fa_iffalse,
MUX_uxn_opcodes_h_l1580_c32_d2fa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1582_c11_a110
BIN_OP_EQ_uxn_opcodes_h_l1582_c11_a110 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1582_c11_a110_left,
BIN_OP_EQ_uxn_opcodes_h_l1582_c11_a110_right,
BIN_OP_EQ_uxn_opcodes_h_l1582_c11_a110_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1582_c7_769a
result_stack_value_MUX_uxn_opcodes_h_l1582_c7_769a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1582_c7_769a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1582_c7_769a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1582_c7_769a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1582_c7_769a_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1582_c7_769a
result_ram_addr_MUX_uxn_opcodes_h_l1582_c7_769a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1582_c7_769a_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1582_c7_769a_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1582_c7_769a_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1582_c7_769a_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1582_c7_769a
result_is_ram_read_MUX_uxn_opcodes_h_l1582_c7_769a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1582_c7_769a_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1582_c7_769a_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1582_c7_769a_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1582_c7_769a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_769a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_769a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_769a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_769a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_769a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_769a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_769a
result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_769a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_769a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_769a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_769a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_769a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_769a
result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_769a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_769a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_769a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_769a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_769a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_769a
result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_769a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_769a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_769a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_769a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_769a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1582_c7_769a
tmp16_MUX_uxn_opcodes_h_l1582_c7_769a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1582_c7_769a_cond,
tmp16_MUX_uxn_opcodes_h_l1582_c7_769a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1582_c7_769a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1582_c7_769a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1587_c11_591f
BIN_OP_EQ_uxn_opcodes_h_l1587_c11_591f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1587_c11_591f_left,
BIN_OP_EQ_uxn_opcodes_h_l1587_c11_591f_right,
BIN_OP_EQ_uxn_opcodes_h_l1587_c11_591f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1587_c7_7b5c
result_stack_value_MUX_uxn_opcodes_h_l1587_c7_7b5c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1587_c7_7b5c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1587_c7_7b5c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1587_c7_7b5c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1587_c7_7b5c_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_7b5c
result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_7b5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_7b5c_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_7b5c_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_7b5c_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_7b5c_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_7b5c
result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_7b5c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_7b5c_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_7b5c_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_7b5c_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_7b5c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_7b5c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_7b5c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_7b5c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_7b5c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_7b5c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_7b5c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_7b5c
result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_7b5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_7b5c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_7b5c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_7b5c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_7b5c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_7b5c
result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_7b5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_7b5c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_7b5c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_7b5c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_7b5c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1587_c7_7b5c
tmp16_MUX_uxn_opcodes_h_l1587_c7_7b5c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1587_c7_7b5c_cond,
tmp16_MUX_uxn_opcodes_h_l1587_c7_7b5c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1587_c7_7b5c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1587_c7_7b5c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1590_c11_c195
BIN_OP_EQ_uxn_opcodes_h_l1590_c11_c195 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1590_c11_c195_left,
BIN_OP_EQ_uxn_opcodes_h_l1590_c11_c195_right,
BIN_OP_EQ_uxn_opcodes_h_l1590_c11_c195_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1590_c7_b196
result_stack_value_MUX_uxn_opcodes_h_l1590_c7_b196 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1590_c7_b196_cond,
result_stack_value_MUX_uxn_opcodes_h_l1590_c7_b196_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1590_c7_b196_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1590_c7_b196_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_b196
result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_b196 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_b196_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_b196_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_b196_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_b196_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_b196
result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_b196 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_b196_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_b196_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_b196_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_b196_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_b196
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_b196 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_b196_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_b196_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_b196_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_b196_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_b196
result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_b196 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_b196_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_b196_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_b196_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_b196_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_b196
result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_b196 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_b196_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_b196_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_b196_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_b196_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1590_c7_b196
tmp16_MUX_uxn_opcodes_h_l1590_c7_b196 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1590_c7_b196_cond,
tmp16_MUX_uxn_opcodes_h_l1590_c7_b196_iftrue,
tmp16_MUX_uxn_opcodes_h_l1590_c7_b196_iffalse,
tmp16_MUX_uxn_opcodes_h_l1590_c7_b196_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1592_c3_3db0
CONST_SL_8_uxn_opcodes_h_l1592_c3_3db0 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1592_c3_3db0_x,
CONST_SL_8_uxn_opcodes_h_l1592_c3_3db0_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1593_c21_6291
BIN_OP_PLUS_uxn_opcodes_h_l1593_c21_6291 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1593_c21_6291_left,
BIN_OP_PLUS_uxn_opcodes_h_l1593_c21_6291_right,
BIN_OP_PLUS_uxn_opcodes_h_l1593_c21_6291_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1595_c11_1d87
BIN_OP_EQ_uxn_opcodes_h_l1595_c11_1d87 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1595_c11_1d87_left,
BIN_OP_EQ_uxn_opcodes_h_l1595_c11_1d87_right,
BIN_OP_EQ_uxn_opcodes_h_l1595_c11_1d87_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1595_c7_4681
result_stack_value_MUX_uxn_opcodes_h_l1595_c7_4681 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1595_c7_4681_cond,
result_stack_value_MUX_uxn_opcodes_h_l1595_c7_4681_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1595_c7_4681_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1595_c7_4681_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_4681
result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_4681 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_4681_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_4681_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_4681_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_4681_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_4681
result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_4681 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_4681_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_4681_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_4681_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_4681_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_4681
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_4681 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_4681_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_4681_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_4681_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_4681_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_4681
result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_4681 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_4681_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_4681_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_4681_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_4681_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_4681
result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_4681 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_4681_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_4681_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_4681_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_4681_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1595_c7_4681
tmp16_MUX_uxn_opcodes_h_l1595_c7_4681 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1595_c7_4681_cond,
tmp16_MUX_uxn_opcodes_h_l1595_c7_4681_iftrue,
tmp16_MUX_uxn_opcodes_h_l1595_c7_4681_iffalse,
tmp16_MUX_uxn_opcodes_h_l1595_c7_4681_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1596_c21_bb28
BIN_OP_PLUS_uxn_opcodes_h_l1596_c21_bb28 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1596_c21_bb28_left,
BIN_OP_PLUS_uxn_opcodes_h_l1596_c21_bb28_right,
BIN_OP_PLUS_uxn_opcodes_h_l1596_c21_bb28_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1598_c11_758d
BIN_OP_EQ_uxn_opcodes_h_l1598_c11_758d : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1598_c11_758d_left,
BIN_OP_EQ_uxn_opcodes_h_l1598_c11_758d_right,
BIN_OP_EQ_uxn_opcodes_h_l1598_c11_758d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1598_c7_94d5
result_stack_value_MUX_uxn_opcodes_h_l1598_c7_94d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1598_c7_94d5_cond,
result_stack_value_MUX_uxn_opcodes_h_l1598_c7_94d5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1598_c7_94d5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1598_c7_94d5_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_94d5
result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_94d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_94d5_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_94d5_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_94d5_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_94d5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_94d5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_94d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_94d5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_94d5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_94d5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_94d5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_94d5
result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_94d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_94d5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_94d5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_94d5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_94d5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_94d5
result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_94d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_94d5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_94d5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_94d5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_94d5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1598_c7_94d5
tmp16_MUX_uxn_opcodes_h_l1598_c7_94d5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1598_c7_94d5_cond,
tmp16_MUX_uxn_opcodes_h_l1598_c7_94d5_iftrue,
tmp16_MUX_uxn_opcodes_h_l1598_c7_94d5_iffalse,
tmp16_MUX_uxn_opcodes_h_l1598_c7_94d5_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1599_c3_c411
BIN_OP_OR_uxn_opcodes_h_l1599_c3_c411 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1599_c3_c411_left,
BIN_OP_OR_uxn_opcodes_h_l1599_c3_c411_right,
BIN_OP_OR_uxn_opcodes_h_l1599_c3_c411_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1605_c11_5f63
BIN_OP_EQ_uxn_opcodes_h_l1605_c11_5f63 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1605_c11_5f63_left,
BIN_OP_EQ_uxn_opcodes_h_l1605_c11_5f63_right,
BIN_OP_EQ_uxn_opcodes_h_l1605_c11_5f63_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1605_c7_99b8
result_stack_value_MUX_uxn_opcodes_h_l1605_c7_99b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1605_c7_99b8_cond,
result_stack_value_MUX_uxn_opcodes_h_l1605_c7_99b8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1605_c7_99b8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1605_c7_99b8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1605_c7_99b8
result_is_stack_write_MUX_uxn_opcodes_h_l1605_c7_99b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1605_c7_99b8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1605_c7_99b8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1605_c7_99b8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1605_c7_99b8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1605_c7_99b8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1605_c7_99b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1605_c7_99b8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1605_c7_99b8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1605_c7_99b8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1605_c7_99b8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1605_c7_99b8
result_is_opc_done_MUX_uxn_opcodes_h_l1605_c7_99b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1605_c7_99b8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1605_c7_99b8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1605_c7_99b8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1605_c7_99b8_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1607_c34_56fc
CONST_SR_8_uxn_opcodes_h_l1607_c34_56fc : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1607_c34_56fc_x,
CONST_SR_8_uxn_opcodes_h_l1607_c34_56fc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1609_c11_f0fb
BIN_OP_EQ_uxn_opcodes_h_l1609_c11_f0fb : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1609_c11_f0fb_left,
BIN_OP_EQ_uxn_opcodes_h_l1609_c11_f0fb_right,
BIN_OP_EQ_uxn_opcodes_h_l1609_c11_f0fb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1609_c7_5992
result_is_stack_write_MUX_uxn_opcodes_h_l1609_c7_5992 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1609_c7_5992_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1609_c7_5992_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1609_c7_5992_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1609_c7_5992_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_5992
result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_5992 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_5992_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_5992_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_5992_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_5992_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1559_c6_8b14_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1559_c1_01f2_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output,
 tmp16_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output,
 t16_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1565_c11_b986_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1565_c7_2270_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2270_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2270_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1565_c7_2270_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1565_c7_2270_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1565_c7_2270_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2270_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2270_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2270_return_output,
 tmp16_MUX_uxn_opcodes_h_l1565_c7_2270_return_output,
 t16_MUX_uxn_opcodes_h_l1565_c7_2270_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1568_c11_fefd_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output,
 tmp16_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output,
 t16_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output,
 CONST_SL_8_uxn_opcodes_h_l1570_c3_d746_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1573_c11_6335_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1573_c7_355a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_355a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1573_c7_355a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1573_c7_355a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1573_c7_355a_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1573_c7_355a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_355a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_355a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_355a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1573_c7_355a_return_output,
 t16_MUX_uxn_opcodes_h_l1573_c7_355a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1576_c11_c4c5_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1576_c7_8499_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_8499_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1576_c7_8499_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1576_c7_8499_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1576_c7_8499_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1576_c7_8499_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1576_c7_8499_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_8499_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_8499_return_output,
 tmp16_MUX_uxn_opcodes_h_l1576_c7_8499_return_output,
 t16_MUX_uxn_opcodes_h_l1576_c7_8499_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1577_c3_82ce_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1580_c32_cc2b_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1580_c32_e9de_return_output,
 MUX_uxn_opcodes_h_l1580_c32_d2fa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1582_c11_a110_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1582_c7_769a_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1582_c7_769a_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1582_c7_769a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_769a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_769a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_769a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_769a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1582_c7_769a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1587_c11_591f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1587_c7_7b5c_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_7b5c_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_7b5c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_7b5c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_7b5c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_7b5c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1587_c7_7b5c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1590_c11_c195_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1590_c7_b196_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_b196_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_b196_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_b196_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_b196_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_b196_return_output,
 tmp16_MUX_uxn_opcodes_h_l1590_c7_b196_return_output,
 CONST_SL_8_uxn_opcodes_h_l1592_c3_3db0_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1593_c21_6291_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1595_c11_1d87_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1595_c7_4681_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_4681_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_4681_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_4681_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_4681_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_4681_return_output,
 tmp16_MUX_uxn_opcodes_h_l1595_c7_4681_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1596_c21_bb28_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1598_c11_758d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1598_c7_94d5_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_94d5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_94d5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_94d5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_94d5_return_output,
 tmp16_MUX_uxn_opcodes_h_l1598_c7_94d5_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1599_c3_c411_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1605_c11_5f63_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1605_c7_99b8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1605_c7_99b8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1605_c7_99b8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1605_c7_99b8_return_output,
 CONST_SR_8_uxn_opcodes_h_l1607_c34_56fc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1609_c11_f0fb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1609_c7_5992_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_5992_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1559_c6_8b14_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1559_c6_8b14_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1559_c6_8b14_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1559_c1_01f2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1559_c1_01f2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1559_c1_01f2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1559_c1_01f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1565_c7_2270_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1559_c2_8e41_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1562_c3_d1af : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2270_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1559_c2_8e41_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2270_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1559_c2_8e41_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1565_c7_2270_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1559_c2_8e41_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1565_c7_2270_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1559_c2_8e41_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1565_c7_2270_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1559_c2_8e41_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2270_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1559_c2_8e41_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2270_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1559_c2_8e41_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2270_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1559_c2_8e41_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_2270_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1559_c2_8e41_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1565_c7_2270_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1559_c2_8e41_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1560_c3_ddfa_uxn_opcodes_h_l1560_c3_ddfa_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_b986_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_b986_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_b986_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1565_c7_2270_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1566_c3_3b1e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2270_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2270_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1565_c7_2270_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1565_c7_2270_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1565_c7_2270_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2270_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2270_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2270_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_2270_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1565_c7_2270_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_fefd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_fefd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_fefd_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1573_c7_355a_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1568_c7_74ed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1571_c3_75ca : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_355a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_74ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1573_c7_355a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_74ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1573_c7_355a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_74ed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1573_c7_355a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1568_c7_74ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1573_c7_355a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1568_c7_74ed_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_355a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_74ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_355a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_74ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_355a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_74ed_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1573_c7_355a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_74ed_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1573_c7_355a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1568_c7_74ed_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1570_c3_d746_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1570_c3_d746_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_6335_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_6335_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_6335_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1576_c7_8499_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1573_c7_355a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1574_c3_f58d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_8499_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_355a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1576_c7_8499_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1573_c7_355a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1576_c7_8499_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1573_c7_355a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1576_c7_8499_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1573_c7_355a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1576_c7_8499_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1573_c7_355a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1576_c7_8499_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_355a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_8499_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_355a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_8499_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_355a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1576_c7_8499_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1573_c7_355a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1576_c7_8499_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1573_c7_355a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1576_c11_c4c5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1576_c11_c4c5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1576_c11_c4c5_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1582_c7_769a_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1576_c7_8499_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_769a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_8499_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_769a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1576_c7_8499_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1576_c7_8499_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1582_c7_769a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1576_c7_8499_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1582_c7_769a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1576_c7_8499_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1576_c7_8499_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_769a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_8499_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_769a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_8499_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_769a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1576_c7_8499_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1576_c7_8499_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1577_c3_82ce_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1577_c3_82ce_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1577_c3_82ce_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1580_c32_d2fa_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1580_c32_d2fa_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1580_c32_d2fa_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1580_c32_cc2b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1580_c32_cc2b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1580_c32_cc2b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1580_c32_e9de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1580_c32_e9de_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1580_c32_e9de_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1580_c32_d2fa_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_a110_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_a110_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_a110_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1582_c7_769a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1582_c7_769a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1587_c7_7b5c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1582_c7_769a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1582_c7_769a_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1582_c7_769a_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_7b5c_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1582_c7_769a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1582_c7_769a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1582_c7_769a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_7b5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1582_c7_769a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_769a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_769a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_7b5c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_769a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_769a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_769a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_769a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_769a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_769a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_7b5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_769a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_769a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_769a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_7b5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_769a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_769a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_769a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1587_c7_7b5c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_769a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_591f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_591f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_591f_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1587_c7_7b5c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1587_c7_7b5c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1590_c7_b196_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1587_c7_7b5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_7b5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_7b5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_b196_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_7b5c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_7b5c_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_7b5c_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_b196_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_7b5c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_7b5c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_7b5c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_b196_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_7b5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_7b5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_7b5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_b196_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_7b5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_7b5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_7b5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_b196_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_7b5c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1587_c7_7b5c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1587_c7_7b5c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1590_c7_b196_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1587_c7_7b5c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_c195_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_c195_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_c195_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1590_c7_b196_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1590_c7_b196_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1595_c7_4681_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1590_c7_b196_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_b196_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_b196_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_4681_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_b196_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_b196_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1593_c3_596d : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_b196_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_4681_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_b196_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_b196_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_b196_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_4681_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_b196_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_b196_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_b196_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_4681_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_b196_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_b196_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_b196_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_4681_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_b196_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1590_c7_b196_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1590_c7_b196_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1595_c7_4681_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1590_c7_b196_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1592_c3_3db0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1592_c3_3db0_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1593_c21_6291_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1593_c21_6291_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1593_c21_6291_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_1d87_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_1d87_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_1d87_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1595_c7_4681_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1595_c7_4681_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1598_c7_94d5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1595_c7_4681_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_4681_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_4681_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_94d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_4681_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_4681_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1596_c3_dac2 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_4681_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_4681_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_4681_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_4681_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_94d5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_4681_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_4681_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_4681_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_94d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_4681_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_4681_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_4681_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_94d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_4681_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1595_c7_4681_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1595_c7_4681_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1598_c7_94d5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1595_c7_4681_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1596_c21_bb28_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1596_c21_bb28_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1596_c21_bb28_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1598_c11_758d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1598_c11_758d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1598_c11_758d_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1598_c7_94d5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1598_c7_94d5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1605_c7_99b8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1598_c7_94d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_94d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_94d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_94d5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_94d5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1602_c3_eac9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_94d5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1605_c7_99b8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_94d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_94d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_94d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1605_c7_99b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_94d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_94d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_94d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1605_c7_99b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_94d5_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1598_c7_94d5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1598_c7_94d5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1598_c7_94d5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1599_c3_c411_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1599_c3_c411_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1599_c3_c411_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1603_c24_c83c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1605_c11_5f63_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1605_c11_5f63_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1605_c11_5f63_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1605_c7_99b8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1605_c7_99b8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1605_c7_99b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1605_c7_99b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1605_c7_99b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1609_c7_5992_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1605_c7_99b8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1605_c7_99b8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1606_c3_d851 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1605_c7_99b8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1605_c7_99b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1605_c7_99b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1605_c7_99b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_5992_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1605_c7_99b8_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1607_c34_56fc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1607_c34_56fc_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1607_c24_d529_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1609_c11_f0fb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1609_c11_f0fb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1609_c11_f0fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1609_c7_5992_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1609_c7_5992_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1609_c7_5992_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_5992_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_5992_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_5992_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1565_l1559_l1576_l1573_l1568_l1595_DUPLICATE_3d31_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1565_l1559_l1582_l1573_l1568_DUPLICATE_97d4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1565_l1590_l1559_l1587_l1582_l1576_l1605_l1573_l1568_l1595_DUPLICATE_e987_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1565_l1590_l1559_l1587_l1576_l1573_l1598_l1568_l1595_DUPLICATE_126d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1565_l1559_l1576_l1573_l1568_DUPLICATE_2a43_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1565_l1590_l1559_l1587_l1582_l1609_l1576_l1605_l1573_l1568_l1595_DUPLICATE_6104_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1573_l1565_l1576_l1568_DUPLICATE_c15c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1565_l1590_l1587_l1582_l1609_l1576_l1605_l1573_l1598_l1568_l1595_DUPLICATE_20b8_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1577_l1569_DUPLICATE_4ed8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1590_l1587_l1582_l1576_l1605_l1595_DUPLICATE_abee_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1591_l1599_DUPLICATE_03df_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0a09_uxn_opcodes_h_l1614_l1555_DUPLICATE_faf2_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1609_c7_5992_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1609_c11_f0fb_right := to_unsigned(11, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_769a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1559_c1_01f2_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1598_c11_758d_right := to_unsigned(9, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_5992_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1576_c11_c4c5_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1606_c3_d851 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1605_c7_99b8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1606_c3_d851;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_591f_right := to_unsigned(6, 3);
     VAR_MUX_uxn_opcodes_h_l1580_c32_d2fa_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_94d5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1580_c32_e9de_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1559_c6_8b14_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1562_c3_d1af := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1562_c3_d1af;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_c195_right := to_unsigned(7, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1596_c21_bb28_right := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1582_c7_769a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_6335_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_94d5_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1602_c3_eac9 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_94d5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1602_c3_eac9;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1605_c11_5f63_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_1d87_right := to_unsigned(8, 4);
     VAR_MUX_uxn_opcodes_h_l1580_c32_d2fa_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1593_c21_6291_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_a110_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1574_c3_f58d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1574_c3_f58d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1566_c3_3b1e := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1566_c3_3b1e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_fefd_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1571_c3_75ca := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1571_c3_75ca;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1580_c32_cc2b_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_b986_right := to_unsigned(1, 1);

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
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1559_c1_01f2_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1580_c32_cc2b_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1559_c6_8b14_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_b986_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_fefd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_6335_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1576_c11_c4c5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_a110_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_591f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_c195_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_1d87_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1598_c11_758d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1605_c11_5f63_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1609_c11_f0fb_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1577_c3_82ce_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1593_c21_6291_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1596_c21_bb28_left := t16;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1582_c7_769a_iftrue := t16;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_7b5c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1599_c3_c411_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1607_c34_56fc_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_769a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1587_c7_7b5c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1595_c7_4681_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1598_c7_94d5_iffalse := tmp16;
     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1577_l1569_DUPLICATE_4ed8 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1577_l1569_DUPLICATE_4ed8_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1591_l1599_DUPLICATE_03df LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1591_l1599_DUPLICATE_03df_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_PLUS[uxn_opcodes_h_l1596_c21_bb28] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1596_c21_bb28_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1596_c21_bb28_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1596_c21_bb28_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1596_c21_bb28_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1596_c21_bb28_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1596_c21_bb28_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1565_l1590_l1559_l1587_l1582_l1576_l1605_l1573_l1568_l1595_DUPLICATE_e987 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1565_l1590_l1559_l1587_l1582_l1576_l1605_l1573_l1568_l1595_DUPLICATE_e987_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1565_l1590_l1559_l1587_l1576_l1573_l1598_l1568_l1595_DUPLICATE_126d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1565_l1590_l1559_l1587_l1576_l1573_l1598_l1568_l1595_DUPLICATE_126d_return_output := result.is_ram_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1573_c11_6335] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1573_c11_6335_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_6335_left;
     BIN_OP_EQ_uxn_opcodes_h_l1573_c11_6335_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_6335_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_6335_return_output := BIN_OP_EQ_uxn_opcodes_h_l1573_c11_6335_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1565_l1559_l1582_l1573_l1568_DUPLICATE_97d4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1565_l1559_l1582_l1573_l1568_DUPLICATE_97d4_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1565_l1590_l1587_l1582_l1609_l1576_l1605_l1573_l1598_l1568_l1595_DUPLICATE_20b8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1565_l1590_l1587_l1582_l1609_l1576_l1605_l1573_l1598_l1568_l1595_DUPLICATE_20b8_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1590_c11_c195] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1590_c11_c195_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_c195_left;
     BIN_OP_EQ_uxn_opcodes_h_l1590_c11_c195_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_c195_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_c195_return_output := BIN_OP_EQ_uxn_opcodes_h_l1590_c11_c195_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1573_l1565_l1576_l1568_DUPLICATE_c15c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1573_l1565_l1576_l1568_DUPLICATE_c15c_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1582_c11_a110] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1582_c11_a110_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_a110_left;
     BIN_OP_EQ_uxn_opcodes_h_l1582_c11_a110_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_a110_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_a110_return_output := BIN_OP_EQ_uxn_opcodes_h_l1582_c11_a110_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1568_c11_fefd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1568_c11_fefd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_fefd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1568_c11_fefd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_fefd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_fefd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1568_c11_fefd_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1607_c34_56fc] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1607_c34_56fc_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1607_c34_56fc_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1607_c34_56fc_return_output := CONST_SR_8_uxn_opcodes_h_l1607_c34_56fc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1605_c11_5f63] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1605_c11_5f63_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1605_c11_5f63_left;
     BIN_OP_EQ_uxn_opcodes_h_l1605_c11_5f63_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1605_c11_5f63_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1605_c11_5f63_return_output := BIN_OP_EQ_uxn_opcodes_h_l1605_c11_5f63_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1598_c11_758d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1598_c11_758d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1598_c11_758d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1598_c11_758d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1598_c11_758d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1598_c11_758d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1598_c11_758d_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1593_c21_6291] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1593_c21_6291_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1593_c21_6291_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1593_c21_6291_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1593_c21_6291_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1593_c21_6291_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1593_c21_6291_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1609_c11_f0fb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1609_c11_f0fb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1609_c11_f0fb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1609_c11_f0fb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1609_c11_f0fb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1609_c11_f0fb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1609_c11_f0fb_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1580_c32_cc2b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1580_c32_cc2b_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1580_c32_cc2b_left;
     BIN_OP_AND_uxn_opcodes_h_l1580_c32_cc2b_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1580_c32_cc2b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1580_c32_cc2b_return_output := BIN_OP_AND_uxn_opcodes_h_l1580_c32_cc2b_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1590_l1587_l1582_l1576_l1605_l1595_DUPLICATE_abee LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1590_l1587_l1582_l1576_l1605_l1595_DUPLICATE_abee_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1565_l1559_l1576_l1573_l1568_l1595_DUPLICATE_3d31 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1565_l1559_l1576_l1573_l1568_l1595_DUPLICATE_3d31_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l1587_c11_591f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1587_c11_591f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_591f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1587_c11_591f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_591f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_591f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1587_c11_591f_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1565_l1559_l1576_l1573_l1568_DUPLICATE_2a43 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1565_l1559_l1576_l1573_l1568_DUPLICATE_2a43_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1565_l1590_l1559_l1587_l1582_l1609_l1576_l1605_l1573_l1568_l1595_DUPLICATE_6104 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1565_l1590_l1559_l1587_l1582_l1609_l1576_l1605_l1573_l1568_l1595_DUPLICATE_6104_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1595_c11_1d87] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1595_c11_1d87_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_1d87_left;
     BIN_OP_EQ_uxn_opcodes_h_l1595_c11_1d87_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_1d87_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_1d87_return_output := BIN_OP_EQ_uxn_opcodes_h_l1595_c11_1d87_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1576_c11_c4c5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1576_c11_c4c5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1576_c11_c4c5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1576_c11_c4c5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1576_c11_c4c5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1576_c11_c4c5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1576_c11_c4c5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1559_c6_8b14] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1559_c6_8b14_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1559_c6_8b14_left;
     BIN_OP_EQ_uxn_opcodes_h_l1559_c6_8b14_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1559_c6_8b14_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1559_c6_8b14_return_output := BIN_OP_EQ_uxn_opcodes_h_l1559_c6_8b14_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1565_c11_b986] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1565_c11_b986_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_b986_left;
     BIN_OP_EQ_uxn_opcodes_h_l1565_c11_b986_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_b986_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_b986_return_output := BIN_OP_EQ_uxn_opcodes_h_l1565_c11_b986_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1580_c32_e9de_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1580_c32_cc2b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1559_c1_01f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1559_c6_8b14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1559_c2_8e41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1559_c6_8b14_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1559_c2_8e41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1559_c6_8b14_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1559_c2_8e41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1559_c6_8b14_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1559_c2_8e41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1559_c6_8b14_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1559_c2_8e41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1559_c6_8b14_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1559_c2_8e41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1559_c6_8b14_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1559_c2_8e41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1559_c6_8b14_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1559_c2_8e41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1559_c6_8b14_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1559_c2_8e41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1559_c6_8b14_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1559_c2_8e41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1559_c6_8b14_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1559_c2_8e41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1559_c6_8b14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2270_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_b986_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1565_c7_2270_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_b986_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2270_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_b986_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1565_c7_2270_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_b986_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2270_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_b986_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1565_c7_2270_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_b986_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2270_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_b986_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2270_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_b986_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1565_c7_2270_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_b986_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1565_c7_2270_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_b986_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_2270_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_b986_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_74ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_fefd_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1568_c7_74ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_fefd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_74ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_fefd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_74ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_fefd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_74ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_fefd_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1568_c7_74ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_fefd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_74ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_fefd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_74ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_fefd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1568_c7_74ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_fefd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1568_c7_74ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_fefd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_74ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_fefd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_355a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_6335_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1573_c7_355a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_6335_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1573_c7_355a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_6335_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1573_c7_355a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_6335_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_355a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_6335_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1573_c7_355a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_6335_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_355a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_6335_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_355a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_6335_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1573_c7_355a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_6335_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1573_c7_355a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_6335_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1573_c7_355a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_6335_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_8499_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1576_c11_c4c5_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1576_c7_8499_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1576_c11_c4c5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1576_c7_8499_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1576_c11_c4c5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1576_c7_8499_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1576_c11_c4c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_8499_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1576_c11_c4c5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1576_c7_8499_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1576_c11_c4c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1576_c7_8499_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1576_c11_c4c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_8499_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1576_c11_c4c5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1576_c7_8499_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1576_c11_c4c5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1576_c7_8499_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1576_c11_c4c5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1576_c7_8499_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1576_c11_c4c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_769a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_a110_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1582_c7_769a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_a110_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_769a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_a110_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_769a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_a110_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1582_c7_769a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_a110_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_769a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_a110_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1582_c7_769a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_a110_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_769a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_a110_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_7b5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_591f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_7b5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_591f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_7b5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_591f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_7b5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_591f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_7b5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_591f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1587_c7_7b5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_591f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1587_c7_7b5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_591f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_b196_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_c195_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_b196_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_c195_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_b196_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_c195_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_b196_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_c195_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_b196_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_c195_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1590_c7_b196_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_c195_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1590_c7_b196_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_c195_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_4681_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_1d87_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_4681_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_1d87_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_4681_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_1d87_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_4681_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_1d87_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_4681_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_1d87_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1595_c7_4681_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_1d87_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1595_c7_4681_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_1d87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_94d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1598_c11_758d_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_94d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1598_c11_758d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_94d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1598_c11_758d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_94d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1598_c11_758d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1598_c7_94d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1598_c11_758d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1598_c7_94d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1598_c11_758d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1605_c7_99b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1605_c11_5f63_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1605_c7_99b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1605_c11_5f63_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1605_c7_99b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1605_c11_5f63_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1605_c7_99b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1605_c11_5f63_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_5992_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1609_c11_f0fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1609_c7_5992_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1609_c11_f0fb_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l1593_c3_596d := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1593_c21_6291_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l1596_c3_dac2 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1596_c21_bb28_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l1577_c3_82ce_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1577_l1569_DUPLICATE_4ed8_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1570_c3_d746_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1577_l1569_DUPLICATE_4ed8_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1599_c3_c411_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1591_l1599_DUPLICATE_03df_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1592_c3_3db0_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1591_l1599_DUPLICATE_03df_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1565_l1559_l1576_l1573_l1568_DUPLICATE_2a43_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1565_l1559_l1576_l1573_l1568_DUPLICATE_2a43_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1565_l1559_l1576_l1573_l1568_DUPLICATE_2a43_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1565_l1559_l1576_l1573_l1568_DUPLICATE_2a43_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1565_l1559_l1576_l1573_l1568_DUPLICATE_2a43_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1565_l1559_l1576_l1573_l1568_l1595_DUPLICATE_3d31_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1565_l1559_l1576_l1573_l1568_l1595_DUPLICATE_3d31_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1565_l1559_l1576_l1573_l1568_l1595_DUPLICATE_3d31_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1565_l1559_l1576_l1573_l1568_l1595_DUPLICATE_3d31_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1565_l1559_l1576_l1573_l1568_l1595_DUPLICATE_3d31_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_4681_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1565_l1559_l1576_l1573_l1568_l1595_DUPLICATE_3d31_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1565_l1590_l1587_l1582_l1609_l1576_l1605_l1573_l1598_l1568_l1595_DUPLICATE_20b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1565_l1590_l1587_l1582_l1609_l1576_l1605_l1573_l1598_l1568_l1595_DUPLICATE_20b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1565_l1590_l1587_l1582_l1609_l1576_l1605_l1573_l1598_l1568_l1595_DUPLICATE_20b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1565_l1590_l1587_l1582_l1609_l1576_l1605_l1573_l1598_l1568_l1595_DUPLICATE_20b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_769a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1565_l1590_l1587_l1582_l1609_l1576_l1605_l1573_l1598_l1568_l1595_DUPLICATE_20b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_7b5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1565_l1590_l1587_l1582_l1609_l1576_l1605_l1573_l1598_l1568_l1595_DUPLICATE_20b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_b196_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1565_l1590_l1587_l1582_l1609_l1576_l1605_l1573_l1598_l1568_l1595_DUPLICATE_20b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_4681_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1565_l1590_l1587_l1582_l1609_l1576_l1605_l1573_l1598_l1568_l1595_DUPLICATE_20b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_94d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1565_l1590_l1587_l1582_l1609_l1576_l1605_l1573_l1598_l1568_l1595_DUPLICATE_20b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1605_c7_99b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1565_l1590_l1587_l1582_l1609_l1576_l1605_l1573_l1598_l1568_l1595_DUPLICATE_20b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_5992_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1565_l1590_l1587_l1582_l1609_l1576_l1605_l1573_l1598_l1568_l1595_DUPLICATE_20b8_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1565_l1590_l1559_l1587_l1576_l1573_l1598_l1568_l1595_DUPLICATE_126d_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1565_l1590_l1559_l1587_l1576_l1573_l1598_l1568_l1595_DUPLICATE_126d_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1565_l1590_l1559_l1587_l1576_l1573_l1598_l1568_l1595_DUPLICATE_126d_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1565_l1590_l1559_l1587_l1576_l1573_l1598_l1568_l1595_DUPLICATE_126d_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1565_l1590_l1559_l1587_l1576_l1573_l1598_l1568_l1595_DUPLICATE_126d_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_7b5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1565_l1590_l1559_l1587_l1576_l1573_l1598_l1568_l1595_DUPLICATE_126d_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_b196_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1565_l1590_l1559_l1587_l1576_l1573_l1598_l1568_l1595_DUPLICATE_126d_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_4681_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1565_l1590_l1559_l1587_l1576_l1573_l1598_l1568_l1595_DUPLICATE_126d_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_94d5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1565_l1590_l1559_l1587_l1576_l1573_l1598_l1568_l1595_DUPLICATE_126d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1565_l1559_l1582_l1573_l1568_DUPLICATE_97d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1565_l1559_l1582_l1573_l1568_DUPLICATE_97d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1565_l1559_l1582_l1573_l1568_DUPLICATE_97d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1565_l1559_l1582_l1573_l1568_DUPLICATE_97d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_769a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1565_l1559_l1582_l1573_l1568_DUPLICATE_97d4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1573_l1565_l1576_l1568_DUPLICATE_c15c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1573_l1565_l1576_l1568_DUPLICATE_c15c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1573_l1565_l1576_l1568_DUPLICATE_c15c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1573_l1565_l1576_l1568_DUPLICATE_c15c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1565_l1590_l1559_l1587_l1582_l1609_l1576_l1605_l1573_l1568_l1595_DUPLICATE_6104_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1565_l1590_l1559_l1587_l1582_l1609_l1576_l1605_l1573_l1568_l1595_DUPLICATE_6104_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1565_l1590_l1559_l1587_l1582_l1609_l1576_l1605_l1573_l1568_l1595_DUPLICATE_6104_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1565_l1590_l1559_l1587_l1582_l1609_l1576_l1605_l1573_l1568_l1595_DUPLICATE_6104_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1565_l1590_l1559_l1587_l1582_l1609_l1576_l1605_l1573_l1568_l1595_DUPLICATE_6104_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_769a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1565_l1590_l1559_l1587_l1582_l1609_l1576_l1605_l1573_l1568_l1595_DUPLICATE_6104_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_7b5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1565_l1590_l1559_l1587_l1582_l1609_l1576_l1605_l1573_l1568_l1595_DUPLICATE_6104_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_b196_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1565_l1590_l1559_l1587_l1582_l1609_l1576_l1605_l1573_l1568_l1595_DUPLICATE_6104_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_4681_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1565_l1590_l1559_l1587_l1582_l1609_l1576_l1605_l1573_l1568_l1595_DUPLICATE_6104_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1605_c7_99b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1565_l1590_l1559_l1587_l1582_l1609_l1576_l1605_l1573_l1568_l1595_DUPLICATE_6104_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1609_c7_5992_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1565_l1590_l1559_l1587_l1582_l1609_l1576_l1605_l1573_l1568_l1595_DUPLICATE_6104_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1590_l1587_l1582_l1576_l1605_l1595_DUPLICATE_abee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_769a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1590_l1587_l1582_l1576_l1605_l1595_DUPLICATE_abee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_7b5c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1590_l1587_l1582_l1576_l1605_l1595_DUPLICATE_abee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_b196_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1590_l1587_l1582_l1576_l1605_l1595_DUPLICATE_abee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_4681_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1590_l1587_l1582_l1576_l1605_l1595_DUPLICATE_abee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1605_c7_99b8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1590_l1587_l1582_l1576_l1605_l1595_DUPLICATE_abee_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1565_l1590_l1559_l1587_l1582_l1576_l1605_l1573_l1568_l1595_DUPLICATE_e987_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1565_l1590_l1559_l1587_l1582_l1576_l1605_l1573_l1568_l1595_DUPLICATE_e987_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1565_l1590_l1559_l1587_l1582_l1576_l1605_l1573_l1568_l1595_DUPLICATE_e987_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1565_l1590_l1559_l1587_l1582_l1576_l1605_l1573_l1568_l1595_DUPLICATE_e987_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1565_l1590_l1559_l1587_l1582_l1576_l1605_l1573_l1568_l1595_DUPLICATE_e987_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1582_c7_769a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1565_l1590_l1559_l1587_l1582_l1576_l1605_l1573_l1568_l1595_DUPLICATE_e987_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1587_c7_7b5c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1565_l1590_l1559_l1587_l1582_l1576_l1605_l1573_l1568_l1595_DUPLICATE_e987_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1590_c7_b196_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1565_l1590_l1559_l1587_l1582_l1576_l1605_l1573_l1568_l1595_DUPLICATE_e987_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1595_c7_4681_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1565_l1590_l1559_l1587_l1582_l1576_l1605_l1573_l1568_l1595_DUPLICATE_e987_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1605_c7_99b8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1565_l1590_l1559_l1587_l1582_l1576_l1605_l1573_l1568_l1595_DUPLICATE_e987_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_b196_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1593_c3_596d;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_4681_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1596_c3_dac2;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1609_c7_5992] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_5992_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_5992_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_5992_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_5992_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_5992_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_5992_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_5992_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_5992_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1592_c3_3db0] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1592_c3_3db0_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1592_c3_3db0_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1592_c3_3db0_return_output := CONST_SL_8_uxn_opcodes_h_l1592_c3_3db0_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1577_c3_82ce] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1577_c3_82ce_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1577_c3_82ce_left;
     BIN_OP_OR_uxn_opcodes_h_l1577_c3_82ce_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1577_c3_82ce_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1577_c3_82ce_return_output := BIN_OP_OR_uxn_opcodes_h_l1577_c3_82ce_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1609_c7_5992] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1609_c7_5992_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1609_c7_5992_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1609_c7_5992_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1609_c7_5992_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1609_c7_5992_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1609_c7_5992_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1609_c7_5992_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1609_c7_5992_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1605_c7_99b8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1605_c7_99b8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1605_c7_99b8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1605_c7_99b8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1605_c7_99b8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1605_c7_99b8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1605_c7_99b8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1605_c7_99b8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1605_c7_99b8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1576_c7_8499] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1576_c7_8499_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1576_c7_8499_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1576_c7_8499_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1576_c7_8499_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1595_c7_4681] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_4681_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_4681_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_4681_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_4681_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_4681_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_4681_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_4681_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_4681_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1582_c7_769a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_769a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_769a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_769a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_769a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_769a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_769a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_769a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_769a_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1598_c7_94d5] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_94d5_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_94d5_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_94d5_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_94d5_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_94d5_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_94d5_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_94d5_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_94d5_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1580_c32_e9de] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1580_c32_e9de_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1580_c32_e9de_left;
     BIN_OP_GT_uxn_opcodes_h_l1580_c32_e9de_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1580_c32_e9de_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1580_c32_e9de_return_output := BIN_OP_GT_uxn_opcodes_h_l1580_c32_e9de_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1599_c3_c411] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1599_c3_c411_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1599_c3_c411_left;
     BIN_OP_OR_uxn_opcodes_h_l1599_c3_c411_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1599_c3_c411_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1599_c3_c411_return_output := BIN_OP_OR_uxn_opcodes_h_l1599_c3_c411_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1607_c24_d529] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1607_c24_d529_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1607_c34_56fc_return_output);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1559_c1_01f2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1559_c1_01f2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1559_c1_01f2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1559_c1_01f2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1559_c1_01f2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1559_c1_01f2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1559_c1_01f2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1559_c1_01f2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1559_c1_01f2_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1570_c3_d746] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1570_c3_d746_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1570_c3_d746_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1570_c3_d746_return_output := CONST_SL_8_uxn_opcodes_h_l1570_c3_d746_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1580_c32_d2fa_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1580_c32_e9de_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1577_c3_82ce_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1598_c7_94d5_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1599_c3_c411_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1605_c7_99b8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1607_c24_d529_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1570_c3_d746_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1590_c7_b196_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1592_c3_3db0_return_output;
     VAR_printf_uxn_opcodes_h_l1560_c3_ddfa_uxn_opcodes_h_l1560_c3_ddfa_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1559_c1_01f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1605_c7_99b8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1609_c7_5992_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_4681_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_94d5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_769a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1576_c7_8499_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1605_c7_99b8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1609_c7_5992_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_b196_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_4681_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_94d5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1605_c7_99b8_return_output;
     -- MUX[uxn_opcodes_h_l1580_c32_d2fa] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1580_c32_d2fa_cond <= VAR_MUX_uxn_opcodes_h_l1580_c32_d2fa_cond;
     MUX_uxn_opcodes_h_l1580_c32_d2fa_iftrue <= VAR_MUX_uxn_opcodes_h_l1580_c32_d2fa_iftrue;
     MUX_uxn_opcodes_h_l1580_c32_d2fa_iffalse <= VAR_MUX_uxn_opcodes_h_l1580_c32_d2fa_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1580_c32_d2fa_return_output := MUX_uxn_opcodes_h_l1580_c32_d2fa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1605_c7_99b8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1605_c7_99b8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1605_c7_99b8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1605_c7_99b8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1605_c7_99b8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1605_c7_99b8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1605_c7_99b8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1605_c7_99b8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1605_c7_99b8_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1590_c7_b196] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_b196_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_b196_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_b196_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_b196_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_b196_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_b196_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_b196_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_b196_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1598_c7_94d5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1598_c7_94d5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1598_c7_94d5_cond;
     tmp16_MUX_uxn_opcodes_h_l1598_c7_94d5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1598_c7_94d5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1598_c7_94d5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1598_c7_94d5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1598_c7_94d5_return_output := tmp16_MUX_uxn_opcodes_h_l1598_c7_94d5_return_output;

     -- t16_MUX[uxn_opcodes_h_l1576_c7_8499] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1576_c7_8499_cond <= VAR_t16_MUX_uxn_opcodes_h_l1576_c7_8499_cond;
     t16_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue;
     t16_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1576_c7_8499_return_output := t16_MUX_uxn_opcodes_h_l1576_c7_8499_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1605_c7_99b8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1605_c7_99b8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1605_c7_99b8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1605_c7_99b8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1605_c7_99b8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1605_c7_99b8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1605_c7_99b8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1605_c7_99b8_return_output := result_stack_value_MUX_uxn_opcodes_h_l1605_c7_99b8_return_output;

     -- printf_uxn_opcodes_h_l1560_c3_ddfa[uxn_opcodes_h_l1560_c3_ddfa] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1560_c3_ddfa_uxn_opcodes_h_l1560_c3_ddfa_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1560_c3_ddfa_uxn_opcodes_h_l1560_c3_ddfa_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1576_c7_8499] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1576_c7_8499_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1576_c7_8499_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1576_c7_8499_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1576_c7_8499_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1603_c24_c83c] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1603_c24_c83c_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1599_c3_c411_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1598_c7_94d5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_94d5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_94d5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_94d5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_94d5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_94d5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_94d5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_94d5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_94d5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1573_c7_355a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1573_c7_355a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1573_c7_355a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1573_c7_355a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1573_c7_355a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1605_c7_99b8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1605_c7_99b8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1605_c7_99b8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1605_c7_99b8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1605_c7_99b8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1605_c7_99b8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1605_c7_99b8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1605_c7_99b8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1605_c7_99b8_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1595_c7_4681] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_4681_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_4681_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_4681_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_4681_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_4681_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_4681_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_4681_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_4681_return_output;

     -- Submodule level 3
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1598_c7_94d5_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1603_c24_c83c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue := VAR_MUX_uxn_opcodes_h_l1580_c32_d2fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_94d5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1605_c7_99b8_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_b196_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_4681_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1576_c7_8499_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1573_c7_355a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_94d5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1605_c7_99b8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_7b5c_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_b196_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_4681_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_94d5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1598_c7_94d5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1605_c7_99b8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1576_c7_8499_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1595_c7_4681_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1598_c7_94d5_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1595_c7_4681] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_4681_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_4681_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_4681_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_4681_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_4681_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_4681_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_4681_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_4681_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1595_c7_4681] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1595_c7_4681_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1595_c7_4681_cond;
     tmp16_MUX_uxn_opcodes_h_l1595_c7_4681_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1595_c7_4681_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1595_c7_4681_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1595_c7_4681_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1595_c7_4681_return_output := tmp16_MUX_uxn_opcodes_h_l1595_c7_4681_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1590_c7_b196] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_b196_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_b196_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_b196_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_b196_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_b196_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_b196_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_b196_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_b196_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1598_c7_94d5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_94d5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_94d5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_94d5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_94d5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_94d5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_94d5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_94d5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_94d5_return_output;

     -- t16_MUX[uxn_opcodes_h_l1573_c7_355a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1573_c7_355a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1573_c7_355a_cond;
     t16_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue;
     t16_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1573_c7_355a_return_output := t16_MUX_uxn_opcodes_h_l1573_c7_355a_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1587_c7_7b5c] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_7b5c_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_7b5c_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_7b5c_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_7b5c_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_7b5c_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_7b5c_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_7b5c_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_7b5c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1598_c7_94d5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_94d5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_94d5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_94d5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_94d5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_94d5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_94d5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_94d5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_94d5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1568_c7_74ed] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_74ed_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_74ed_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1573_c7_355a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1573_c7_355a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1573_c7_355a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1573_c7_355a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1573_c7_355a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1598_c7_94d5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1598_c7_94d5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1598_c7_94d5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1598_c7_94d5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1598_c7_94d5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1598_c7_94d5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1598_c7_94d5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1598_c7_94d5_return_output := result_stack_value_MUX_uxn_opcodes_h_l1598_c7_94d5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1576_c7_8499] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1576_c7_8499_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1576_c7_8499_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1576_c7_8499_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1576_c7_8499_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_4681_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_94d5_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_7b5c_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_b196_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1573_c7_355a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_4681_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_94d5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1582_c7_769a_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_7b5c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1576_c7_8499_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_b196_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_4681_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1595_c7_4681_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1598_c7_94d5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1573_c7_355a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1590_c7_b196_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1595_c7_4681_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1565_c7_2270] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1565_c7_2270_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1565_c7_2270_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1565_c7_2270_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1565_c7_2270_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1587_c7_7b5c] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_7b5c_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_7b5c_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_7b5c_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_7b5c_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_7b5c_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_7b5c_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_7b5c_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_7b5c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1595_c7_4681] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_4681_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_4681_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_4681_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_4681_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_4681_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_4681_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_4681_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_4681_return_output;

     -- t16_MUX[uxn_opcodes_h_l1568_c7_74ed] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1568_c7_74ed_cond <= VAR_t16_MUX_uxn_opcodes_h_l1568_c7_74ed_cond;
     t16_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue;
     t16_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output := t16_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1595_c7_4681] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1595_c7_4681_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1595_c7_4681_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1595_c7_4681_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1595_c7_4681_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1595_c7_4681_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1595_c7_4681_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1595_c7_4681_return_output := result_stack_value_MUX_uxn_opcodes_h_l1595_c7_4681_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1568_c7_74ed] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_74ed_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_74ed_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1590_c7_b196] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_b196_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_b196_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_b196_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_b196_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_b196_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_b196_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_b196_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_b196_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1573_c7_355a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_355a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_355a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_355a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_355a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1595_c7_4681] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_4681_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_4681_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_4681_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_4681_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_4681_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_4681_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_4681_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_4681_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1582_c7_769a] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1582_c7_769a_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1582_c7_769a_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1582_c7_769a_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1582_c7_769a_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1582_c7_769a_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1582_c7_769a_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1582_c7_769a_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1582_c7_769a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1590_c7_b196] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1590_c7_b196_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1590_c7_b196_cond;
     tmp16_MUX_uxn_opcodes_h_l1590_c7_b196_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1590_c7_b196_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1590_c7_b196_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1590_c7_b196_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1590_c7_b196_return_output := tmp16_MUX_uxn_opcodes_h_l1590_c7_b196_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_b196_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_4681_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1582_c7_769a_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_7b5c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1565_c7_2270_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_b196_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_4681_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1582_c7_769a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_355a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_7b5c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_b196_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1590_c7_b196_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1595_c7_4681_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1587_c7_7b5c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1590_c7_b196_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1559_c2_8e41] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1559_c2_8e41_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1559_c2_8e41_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1582_c7_769a] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1582_c7_769a_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1582_c7_769a_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1582_c7_769a_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1582_c7_769a_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1582_c7_769a_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1582_c7_769a_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1582_c7_769a_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1582_c7_769a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1590_c7_b196] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1590_c7_b196_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1590_c7_b196_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1590_c7_b196_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1590_c7_b196_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1590_c7_b196_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1590_c7_b196_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1590_c7_b196_return_output := result_stack_value_MUX_uxn_opcodes_h_l1590_c7_b196_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1587_c7_7b5c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_7b5c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_7b5c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_7b5c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_7b5c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_7b5c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_7b5c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_7b5c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_7b5c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1590_c7_b196] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_b196_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_b196_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_b196_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_b196_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_b196_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_b196_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_b196_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_b196_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1587_c7_7b5c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1587_c7_7b5c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1587_c7_7b5c_cond;
     tmp16_MUX_uxn_opcodes_h_l1587_c7_7b5c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1587_c7_7b5c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1587_c7_7b5c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1587_c7_7b5c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1587_c7_7b5c_return_output := tmp16_MUX_uxn_opcodes_h_l1587_c7_7b5c_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1576_c7_8499] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1576_c7_8499_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1576_c7_8499_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1576_c7_8499_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1576_c7_8499_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1565_c7_2270] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2270_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2270_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2270_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2270_return_output;

     -- t16_MUX[uxn_opcodes_h_l1565_c7_2270] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1565_c7_2270_cond <= VAR_t16_MUX_uxn_opcodes_h_l1565_c7_2270_cond;
     t16_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue;
     t16_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1565_c7_2270_return_output := t16_MUX_uxn_opcodes_h_l1565_c7_2270_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1590_c7_b196] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_b196_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_b196_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_b196_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_b196_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_b196_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_b196_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_b196_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_b196_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1568_c7_74ed] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_74ed_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_74ed_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_7b5c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_b196_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1582_c7_769a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2270_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_7b5c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_b196_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1576_c7_8499_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_769a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_7b5c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1587_c7_7b5c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1590_c7_b196_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1565_c7_2270_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_769a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1587_c7_7b5c_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1587_c7_7b5c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_7b5c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_7b5c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_7b5c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_7b5c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_7b5c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_7b5c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_7b5c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_7b5c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1559_c2_8e41] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1559_c2_8e41_cond <= VAR_t16_MUX_uxn_opcodes_h_l1559_c2_8e41_cond;
     t16_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue;
     t16_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output := t16_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1565_c7_2270] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2270_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2270_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2270_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2270_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1587_c7_7b5c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1587_c7_7b5c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1587_c7_7b5c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1587_c7_7b5c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1587_c7_7b5c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1587_c7_7b5c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1587_c7_7b5c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1587_c7_7b5c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1587_c7_7b5c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1582_c7_769a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_769a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_769a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_769a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_769a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_769a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_769a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_769a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_769a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1587_c7_7b5c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_7b5c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_7b5c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_7b5c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_7b5c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_7b5c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_7b5c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_7b5c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_7b5c_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1573_c7_355a] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1573_c7_355a_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1573_c7_355a_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1573_c7_355a_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1573_c7_355a_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1576_c7_8499] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1576_c7_8499_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1576_c7_8499_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1576_c7_8499_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1576_c7_8499_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1582_c7_769a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1582_c7_769a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_769a_cond;
     tmp16_MUX_uxn_opcodes_h_l1582_c7_769a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_769a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1582_c7_769a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_769a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_769a_return_output := tmp16_MUX_uxn_opcodes_h_l1582_c7_769a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1559_c2_8e41] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1559_c2_8e41_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1559_c2_8e41_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_769a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_7b5c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1576_c7_8499_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_769a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_7b5c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1573_c7_355a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2270_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_769a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1582_c7_769a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1587_c7_7b5c_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_769a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1582_c7_769a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_769a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_769a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_769a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_769a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_769a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_769a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_769a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_769a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1582_c7_769a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_769a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_769a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_769a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_769a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_769a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_769a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_769a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_769a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1576_c7_8499] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1576_c7_8499_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1576_c7_8499_cond;
     tmp16_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1576_c7_8499_return_output := tmp16_MUX_uxn_opcodes_h_l1576_c7_8499_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1582_c7_769a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1582_c7_769a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1582_c7_769a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1582_c7_769a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1582_c7_769a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1582_c7_769a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1582_c7_769a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1582_c7_769a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1582_c7_769a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1576_c7_8499] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_8499_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_8499_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_8499_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_8499_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1573_c7_355a] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1573_c7_355a_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1573_c7_355a_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1573_c7_355a_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1573_c7_355a_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1568_c7_74ed] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1568_c7_74ed_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1568_c7_74ed_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1559_c2_8e41] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1559_c2_8e41_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1559_c2_8e41_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_769a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1573_c7_355a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_769a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1576_c7_8499_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1582_c7_769a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1576_c7_8499_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1576_c7_8499] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_8499_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_8499_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_8499_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_8499_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1573_c7_355a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_355a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_355a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_355a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_355a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1576_c7_8499] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_8499_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_8499_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_8499_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_8499_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1565_c7_2270] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1565_c7_2270_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1565_c7_2270_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1565_c7_2270_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1565_c7_2270_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1576_c7_8499] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1576_c7_8499_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1576_c7_8499_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1576_c7_8499_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1576_c7_8499_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1576_c7_8499_return_output := result_stack_value_MUX_uxn_opcodes_h_l1576_c7_8499_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1568_c7_74ed] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1568_c7_74ed_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1568_c7_74ed_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1573_c7_355a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1573_c7_355a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1573_c7_355a_cond;
     tmp16_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1573_c7_355a_return_output := tmp16_MUX_uxn_opcodes_h_l1573_c7_355a_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1576_c7_8499_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1576_c7_8499_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1565_c7_2270_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_355a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1576_c7_8499_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1573_c7_355a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1573_c7_355a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_355a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_355a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_355a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_355a_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1565_c7_2270] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1565_c7_2270_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1565_c7_2270_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1565_c7_2270_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1565_c7_2270_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1573_c7_355a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1573_c7_355a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1573_c7_355a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1573_c7_355a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1573_c7_355a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1573_c7_355a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_355a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_355a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_355a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_355a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_355a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_355a_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1559_c2_8e41] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1559_c2_8e41_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1559_c2_8e41_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1568_c7_74ed] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_74ed_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_74ed_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1568_c7_74ed] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1568_c7_74ed_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_74ed_cond;
     tmp16_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output := tmp16_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_355a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1565_c7_2270_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1573_c7_355a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1573_c7_355a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1568_c7_74ed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_74ed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_74ed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1568_c7_74ed] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1568_c7_74ed_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1568_c7_74ed_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output := result_stack_value_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1565_c7_2270] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2270_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2270_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2270_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2270_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1568_c7_74ed] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_74ed_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_74ed_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_74ed_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_74ed_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1559_c2_8e41] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1559_c2_8e41_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1559_c2_8e41_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1565_c7_2270] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1565_c7_2270_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_2270_cond;
     tmp16_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_2270_return_output := tmp16_MUX_uxn_opcodes_h_l1565_c7_2270_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2270_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1568_c7_74ed_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_2270_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1565_c7_2270] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1565_c7_2270_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1565_c7_2270_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1565_c7_2270_return_output := result_stack_value_MUX_uxn_opcodes_h_l1565_c7_2270_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1559_c2_8e41] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1559_c2_8e41_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1559_c2_8e41_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1565_c7_2270] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2270_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2270_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2270_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2270_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1565_c7_2270] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2270_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2270_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2270_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2270_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2270_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2270_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1559_c2_8e41] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1559_c2_8e41_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1559_c2_8e41_cond;
     tmp16_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output := tmp16_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2270_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2270_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1565_c7_2270_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1559_c2_8e41] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1559_c2_8e41_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1559_c2_8e41_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output := result_stack_value_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1559_c2_8e41] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1559_c2_8e41_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1559_c2_8e41_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1559_c2_8e41] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1559_c2_8e41_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1559_c2_8e41_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1559_c2_8e41_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1559_c2_8e41_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_0a09_uxn_opcodes_h_l1614_l1555_DUPLICATE_faf2 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0a09_uxn_opcodes_h_l1614_l1555_DUPLICATE_faf2_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_0a09(
     result,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1559_c2_8e41_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0a09_uxn_opcodes_h_l1614_l1555_DUPLICATE_faf2_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0a09_uxn_opcodes_h_l1614_l1555_DUPLICATE_faf2_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
